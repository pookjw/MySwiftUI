public import CoreGraphics

@frozen public struct RectangleCornerInsets : Hashable, Sendable {
    public var topLeading: CGSize
    public var topTrailing: CGSize
    public var bottomLeading: CGSize
    public var bottomTrailing: CGSize
    
    public init() {
        topLeading = .zero
        topTrailing = .zero
        bottomLeading = .zero
        bottomTrailing = .zero
    }
    
    public init(topLeading: CGSize, topTrailing: CGSize, bottomLeading: CGSize, bottomTrailing: CGSize) {
        self.topLeading = topLeading
        self.topTrailing = topTrailing
        self.bottomLeading = bottomLeading
        self.bottomTrailing = bottomTrailing
    }
    
    public static func == (a: RectangleCornerInsets, b: RectangleCornerInsets) -> Bool {
        a.topLeading == b.topLeading &&
        a.topTrailing == b.topTrailing &&
        a.bottomLeading == b.bottomLeading &&
        a.bottomTrailing == b.bottomTrailing
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.topLeading)
        hasher.combine(self.topTrailing)
        hasher.combine(self.bottomLeading)
        hasher.combine(self.bottomTrailing)
    }
}

extension RectangleCornerInsets : BitwiseCopyable {}
