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
    
    @Test(arguments: 0..<100)
    func test_lockAndUnlock(_: Int) async {
        actor Counter {
            var number = 0
            func increment() {
                number += 1
            }
        }
        let counter = Counter()
        
        let lock = MovableLock.create()
        let (stream, continuiation) = AsyncStream<Void>.makeStream()
        
        let task = Task(executorPreference: RunLoopTaskExecutor()){
            lock.lock()
            await Task.yield()
            continuiation.yield()
            await counter.increment()
            let result = await counter.number == 1
            print("1")
            lock.unlock()
            return result
        }
        
        for await _ in stream { break }
        lock.lock()
        print("2")
        
        await counter.increment()
        let number = await counter.number
        #expect(number == 2)
        lock.unlock()
        let result = await task.value
        #expect(result)
        
        lock.destory()
    }
    
    @Test(arguments: 0..<100)
    func test_isOwner(_: Int) async {
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
}
