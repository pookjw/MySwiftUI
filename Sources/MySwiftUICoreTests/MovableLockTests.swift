internal import Testing
private import _MySwiftUIShims
private import Foundation
private import _DarwinFoundation3.pthread

struct MovableLockTests {
    @Test
    func test_createAndDestory() {
        let lock = MovableLock.create()
        lock.destory()
    }
    
    @Test(arguments: 0..<30)
    func test_lockAndUnlock(_: Int) async {
        actor Counter {
            var number = 0
            func increment() {
                number += 1
            }
        }
        
        let counter = Counter()
        let lock = MovableLock.create()
        
        lock.lock()
        
        let executor = RunLoopTaskExecutor()
        let task = Task(executorPreference: executor) {
            lock.lock()
            await counter.increment()
            let result = await counter.number == 2
            lock.unlock()
            return result
        }
        
        await Task.yield()
        await counter.increment()
        let number = await counter.number
        #expect(number == 1)
        lock.unlock()
        
        let result = await task.value
        #expect(result)
        
        lock.destory()
    }
    
    @Test
    func test_isOwner() async {
        let lock = MovableLock.create()
        
        lock.lock()
        #expect(lock.isOwner())
        
        do {
            let result = await executeBlock {
                return lock.isOwner()
            }
            #expect(!result)
        }
        
        lock.unlock()
        #expect(!lock.isOwner())
        
        do {
            let result = await executeBlock {
                return lock.isOwner()
            }
            #expect(!result)
        }
        
        lock.destory()
    }
    
    @Test(arguments: 0..<30)
    func test_isOutermostOwner(_: Int) async {
        let lock = MovableLock.create()
        
        lock.lock()
        #expect(lock.isOutermostOwner())
        lock.lock()
        #expect(!lock.isOutermostOwner())
        lock.unlock()
        #expect(lock.isOutermostOwner())
        let result = await executeBlock {
            return lock.isOutermostOwner()
        }
        #expect(!result)
        lock.unlock()
        #expect(!lock.isOutermostOwner())
        
        lock.destory()
    }
    
    @Test
    func test_syncMain_1() async {
        let lock = MovableLock.create()
        
        let task = Task(executorPreference: globalConcurrentExecutor) { 
            var result = false
            lock.lock()
            lock.syncMain(context: &result) { pointer in
                let casted = pointer.assumingMemoryBound(to: Bool.self)
                casted.pointee = (pthread_main_np() != 0)
            }
            lock.unlock()
            return result
        }
        
        await Task.yield()
        
        await MainActor.run {
            lock.lock()
            lock.unlock()
        }
        
        lock.destory()
        
        let result = await task.value
        #expect(result)
    }
    
    @Test
    func test_syncMain_2() async {
        let lock = MovableLock.create()
        
        let result = await MainActor.run {
            var result = false
            lock.lock()
            lock.syncMain(context: &result) { pointer in
                let casted = pointer.assumingMemoryBound(to: Bool.self)
                casted.pointee = (pthread_main_np() != 0)
            }
            lock.unlock()
            return result
        }
        
        lock.destory()
        #expect(result)
    }
    
    @Test
    func test_lockWaitAndBroadcast() async {
        actor Context {
            var count = 0
            func increment() {
                count += 1
            }
        }
        let lock = MovableLock.create()
        let context = Context()
        
        let task = Task(executorPreference: RunLoopTaskExecutor()) {
            lock.lock()
            lock.lockWait()
            lock.unlock()
            await context.increment()
        }
        
        await Task.yield()
        var value = await context.count
        #expect(value == 0)
        
        await MainActor.run {
            lock.broadcast()
        }
        
        await task.value
        value = await context.count
        #expect(value == 1)
        
        lock.destory()
    }
}
