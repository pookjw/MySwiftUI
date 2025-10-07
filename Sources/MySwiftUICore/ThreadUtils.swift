#warning("TODO")
package import Foundation
private import CoreFoundation

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
fileprivate nonisolated(unsafe) var observerActions: [() -> Void] = []

extension RunLoop {
    package static func addObserver(_ action: @escaping () -> Void) {
        let runLoop = CFRunLoopGetCurrent()
        
        let _observer: CFRunLoopObserver
        if let __observer = observer {
            _observer = __observer
        }  else {
            _observer = CFRunLoopObserverCreate(
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
