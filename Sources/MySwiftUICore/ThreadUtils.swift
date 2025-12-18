// 82B2D47816BC992595021D60C278AFF0

package import Foundation
private import CoreFoundation
private import _DarwinFoundation3.pthread

package func onMainThread(do block: @MainActor @Sendable @escaping () -> Void) {
    if Thread.isMainThread {
        MainActor.assumeIsolated { 
            block()
        }
    } else {
        onNextMainRunLoop(do: block)
    }
}

package func onNextMainRunLoop(do block: @MainActor @Sendable @escaping () -> Void) {
    unsafe RunLoop.main.perform(inModes: [.common], block: unsafeBitCast(block, to: (@Sendable () -> Void).self))
}

fileprivate nonisolated(unsafe) var observer: CFRunLoopObserver?
@safe fileprivate nonisolated(unsafe) var observerActions: [() -> Void] = []

extension RunLoop {
    package static func addObserver(_ action: @escaping () -> Void) {
        let runLoop = CFRunLoopGetCurrent()
        
        let _observer: CFRunLoopObserver
        if let __observer = unsafe observer {
            _observer = __observer
        }  else {
            _observer = unsafe CFRunLoopObserverCreate(
                nil,
                CFRunLoopActivity.beforeWaiting.union(.exit).rawValue,
                true,
                0,
                { _, _, _ in
                    autoreleasepool {
                        RunLoop.flushObservers()
                    }
                },
                nil
            )
            
            CFRunLoopAddObserver(runLoop, _observer, .commonModes)
        }
        
        if let currentMode = CFRunLoopCopyCurrentMode(runLoop) {
            if !CFRunLoopContainsObserver(runLoop, _observer, currentMode) {
                CFRunLoopAddObserver(runLoop, _observer, currentMode)
            }
        }
        
        observerActions.append(action)
    }
    
    package static func flushObservers() {
        while true {
            let actions = observerActions
            guard !actions.isEmpty else {
                break
            }
            
            observerActions = []
            
            Update.begin()
            
            let actionID = Update.Action.nextActionID
            Update.Action.nextActionID &+= 2
            
            for action in actions {
                CustomEventTrace.startAction(actionID, nil)
                action()
                CustomEventTrace.finishAction(actionID, nil)
            }
            
            Update.end()
        }
    }
}

final class ThreadSpecific<T: Sendable> {
    private nonisolated(unsafe) var key: UInt
    private let defaultValue: T
    
    init(_ defaultValue: T) {
        self.key = 0
        self.defaultValue = defaultValue
        
        pthread_key_create(&key) { pointer in
            let ptr = pointer.assumingMemoryBound(to: Any.self)
            ptr.deinitialize(count: 1)
            ptr.deallocate()
        }
    }
    
    deinit {
        var message = _typeName(type(of: self), qualified: false)
        message.append(".deinit is unsafe and would leak")
        fatalError(message)
    }
    
    var value: T {
        get {
            return box.pointee as! T
        }
        set {
            box.withMemoryRebound(to: T.self, capacity: 1) { pointer in
                pointer.pointee = newValue
            }
        }
    }
    
    fileprivate var box: UnsafeMutablePointer<Any> {
        if let pointer = pthread_getspecific(key) {
            return pointer.assumingMemoryBound(to: Any.self)
        }
        
        let pointer = UnsafeMutablePointer<Any>.allocate(capacity: 1)
        pthread_setspecific(key, pointer)
        pointer.initialize(to: defaultValue)
        return pointer
    }
}

extension ThreadSpecific: Sendable {}
