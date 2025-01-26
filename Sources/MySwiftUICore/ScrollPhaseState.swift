import CoreGraphics

package struct ScrollPhaseState: Equatable, CustomStringConvertible {
    package var shouldUpdateValue: Bool {
        // 0xFB = 1111 1011
        // 주의 : decelerating은 1 << 2가 아니라 3 (0b11)임
        switch phase {
        case .idle:
            return false
        case .tracking:
            return true
        case .interacting:
            return true
        case .decelerating:
            return true
        case .animating:
            return false
        }
    }
    
    package var phase: ScrollPhase
    package var velocity: CGVector
    
    package var isScrolling: Bool { phase != .idle }
    package var isTracking: Bool { phase == .tracking }
    package var isInteracting: Bool { phase == .interacting }
    package var isDecelerating: Bool { phase == .decelerating }
    package var isAnimating: Bool { phase == .animating }
    
    package init(phase: ScrollPhase, velocity: CGVector) {
        self.phase = phase
        self.velocity = velocity
    }
    
    package var description: String {
        return "<ScrollEventState: \(phase), velocity: \(velocity)>"
    }
}
