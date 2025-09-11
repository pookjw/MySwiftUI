private import Foundation

package func onNextMainRunLoop(do block: @MainActor @Sendable @escaping () -> Void) {
    RunLoop.main.perform(inModes: [.common], block: unsafeBitCast(block, to: (@Sendable () -> Void).self))
}
