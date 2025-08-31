internal import Testing
private import _MySwiftUIShims
private import Foundation
private import _DarwinFoundation3.pthread

fileprivate final class Box<U> {
    let value: U
    init(value: U) {
        self.value = value
    }
}

fileprivate func executeBlock<T>(_ block: @escaping () throws -> T) async throws -> T {
    return try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<T, any Error>) in
        executeBlock {
            do {
                let result = try block()
                continuation.resume(returning: result)
            } catch {
                continuation.resume(throwing: error)
            }
        }
    }
}

fileprivate func executeBlock(_ block: @escaping () -> Void) {
    withUnsafeTemporaryAllocation(of: pthread_t.self, capacity: 1) { threadPointer in
        let box = Box(value: block)
        let castedThreadPointer = UnsafeMutableRawPointer(threadPointer.baseAddress.unsafelyUnwrapped)
            .assumingMemoryBound(to: pthread_t?.self)
        
        pthread_create(
            castedThreadPointer,
            nil,
            { boxPointer in
                return autoreleasepool {
                    let box = unsafeBitCast(boxPointer, to: Box<() -> Void>.self)
                    box.value()
                    Unmanaged.passUnretained(box).release()
                    return nil
                }
            },
            Unmanaged.passRetained(box).toOpaque()
        )
        
        pthread_detach(castedThreadPointer.pointee.unsafelyUnwrapped)
    }
}

fileprivate func executeBlock<T>(_ block: @escaping () -> T) async -> T {
    return await withCheckedContinuation { (continuation: CheckedContinuation<T, Never>) in
        executeBlock {
            let result = block()
            continuation.resume(returning: result)
        }
    }
}

fileprivate final class MyExecutor: TaskExecutor {
    func asUnownedTaskExecutor() -> UnownedTaskExecutor {
        return UnownedTaskExecutor(self)
    }
    
    func enqueue(_ job: UnownedJob) {
        executeBlock { 
            job.runSynchronously(on: self.asUnownedTaskExecutor())
        }
    }
}


struct MovableLockTests {
    @Test
    func test_createAndDestory() {
        let lock = MovableLock.create()
        lock.destory()
    }
    
    @Test
    func test_lockAndUnlock() async {
        actor Counter {
            var number = 0
            func increment() {
                number += 1
            }
        }
        let counter = Counter()
        
        let lock = MovableLock.create()
        let (stream, continuiation) = AsyncStream<Void>.makeStream()
        
        let task = Task(executorPreference: MyExecutor()){
            lock.lock()
            await Task.yield()
            continuiation.yield()
            await counter.increment()
            let result = await counter.number == 1
            lock.unlock()
            return result
        }
        
        for await _ in stream { break }
        lock.lock()
        
        await counter.increment()
        let number = await counter.number
        #expect(number == 2)
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
}
