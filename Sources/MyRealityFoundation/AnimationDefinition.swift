public import Foundation

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public protocol AnimationDefinition {
    var name: String { get set }
    var blendLayer: Int32 { get set }
    var fillMode: AnimationFillMode { get set }
    var bindTarget: BindTarget { get set }
    var trimStart: TimeInterval? { get set }
    var trimEnd: TimeInterval? { get set }
    var trimDuration: TimeInterval? { get set }
    var offset: TimeInterval { get set }
    var delay: TimeInterval { get set }
    var speed: Float { get set }
    var repeatMode: AnimationRepeatMode { get set }
    var duration: TimeInterval { get }
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension AnimationDefinition {
    public func trimmed(start: TimeInterval? = nil, end: TimeInterval? = nil, duration: TimeInterval? = nil) -> Self {
        assertUnimplemented()
    }
    
    public func repeated(count: TimeInterval) -> Self {
        assertUnimplemented()
    }
    
    public func repeated(count: Int) -> Self {
        assertUnimplemented()
    }
    
    public func repeatingForever() -> Self {
        assertUnimplemented()
    }
}
