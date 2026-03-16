private import CoreGraphics

struct ScrollEventConverter {
    private var scrollSeed: UInt32 = 0
    private var accumulatedScrollDelta: CGSize = .zero
}
