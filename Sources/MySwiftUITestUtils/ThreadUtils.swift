private import CoreFoundation
private import _DarwinFoundation3.pthread
private import os.lock

public final class RunLoopTaskExecutor: TaskExecutor {
    private final class Storage: @unchecked Sendable {
        let lock = OSAllocatedUnfairLock()
        var runLoop: CFRunLoop?
        var source: CFRunLoopSource?
        var jobs: [UnownedJob] = []
        var needsToStop = false
        var executor: UnownedTaskExecutor?
    }
    
    private nonisolated(unsafe) var thread: pthread_t?
    private let storage = Storage()
    
    public init() {
        storage.executor = asUnownedTaskExecutor()
        
        pthread_create(
            &thread,
            nil,
            { context in
                return autoreleasepool {
                    let storage = Unmanaged<Storage>.fromOpaque(context)
                    defer {
                        storage.release()
                    }
                    
                    var context = CFRunLoopSourceContext(
                        version: 0,
                        info: storage.toOpaque(),
                        retain: { ref in
                            return UnsafeRawPointer(Unmanaged<Storage>.fromOpaque(ref.unsafelyUnwrapped).retain().toOpaque())
                        },
                        release: { ref in
                            Unmanaged<Storage>.fromOpaque(ref.unsafelyUnwrapped).release()
                        },
                        copyDescription: nil,
                        equal: nil,
                        hash: nil,
                        schedule: nil,
                        cancel: nil,
                        perform: { ref in
                            let storage = Unmanaged<Storage>.fromOpaque(ref.unsafelyUnwrapped)
                            storage.takeUnretainedValue().lock.withLockUnchecked {
                                for job in storage.takeUnretainedValue().jobs {
                                    autoreleasepool {
                                        job.runSynchronously(on: storage.takeUnretainedValue().executor.unsafelyUnwrapped)
                                    }
                                }
                                storage.takeUnretainedValue().jobs.removeAll()
                            }
                        }
                    )
                    
                    let source = CFRunLoopSourceCreate(kCFAllocatorDefault, 0, &context)
                    let runLoop = CFRunLoopGetCurrent()
                    CFRunLoopAddSource(runLoop, source, .defaultMode)
                    
                    let needToStop = storage.takeUnretainedValue().lock.withLockUnchecked {
                        storage.takeUnretainedValue().source = source
                        storage.takeUnretainedValue().runLoop = runLoop
                        
                        guard !storage.takeUnretainedValue().needsToStop else {
                            return true
                        }
                        
                        for job in storage.takeUnretainedValue().jobs {
                            autoreleasepool {
                                job.runSynchronously(on: storage.takeUnretainedValue().executor.unsafelyUnwrapped)
                            }
                        }
                        
                        storage.takeUnretainedValue().jobs.removeAll()
                        return false
                    }
                    
                    guard !needToStop else {
                        return nil
                    }
                    
                    CFRunLoopRun()
                    return nil
                }
            },
            Unmanaged.passRetained(storage).toOpaque()
        )
        
        pthread_detach(thread.unsafelyUnwrapped)
    }
    
    deinit {
        if pthread_self() == thread {
            storage.needsToStop = true
            if let runLoop = storage.runLoop {
                CFRunLoopStop(runLoop)
            }
            if let source = storage.source {
                CFRunLoopSourceInvalidate(source)
            }
        } else {
            storage.lock.withLockUnchecked {
                storage.needsToStop = true
                if let runLoop = storage.runLoop {
                    while !CFRunLoopIsWaiting(runLoop) {}
                    CFRunLoopStop(runLoop)
                }
                if let source = storage.source {
                    CFRunLoopSourceInvalidate(source)
                }
            }
        }
    }
    
    public func asUnownedTaskExecutor() -> UnownedTaskExecutor {
        return UnownedTaskExecutor(self)
    }
    
    public func enqueue(_ job: consuming ExecutorJob) {
        if pthread_self() == thread {
            job.runSynchronously(on: asUnownedTaskExecutor())
        } else {
            let unownedJob = UnownedJob(job)
            storage.jobs.append(unownedJob)
            
            if let source = storage.source {
                CFRunLoopSourceSignal(source)
            }
            if let runLoop = storage.runLoop {
                CFRunLoopWakeUp(runLoop)
            }
        }
    }
}


fileprivate final class Box<U> {
    let value: U
    init(value: U) {
        self.value = value
    }
}

public func executeBlock<T>(_ block: @escaping () throws -> T) async throws -> T {
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

public func executeBlock(_ block: @escaping () -> Void) {
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

public func executeBlock<T>(_ block: @escaping () -> T) async -> T {
    return await withCheckedContinuation { (continuation: CheckedContinuation<T, Never>) in
        executeBlock {
            let result = block()
            continuation.resume(returning: result)
        }
    }
}
