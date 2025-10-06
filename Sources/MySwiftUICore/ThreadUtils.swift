#warning("TODO")
public import Foundation

@inlinable
package func onMainThread(do block: @MainActor @Sendable @escaping () -> Void) {
    if Thread.isMainThread {
        MainActor.assumeIsolated { 
            block()
        }
    } else {
        onNextMainRunLoop(do: block)
    }
}

@inlinable
package func onNextMainRunLoop(do block: @MainActor @Sendable @escaping () -> Void) {
    unsafe RunLoop.main.perform(inModes: [.common], block: unsafeBitCast(block, to: (@Sendable () -> Void).self))
}
