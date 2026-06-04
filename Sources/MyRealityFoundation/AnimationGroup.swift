public import Foundation

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public struct AnimationGroup : AnimationDefinition {
    public var group: [any AnimationDefinition] {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var name: String {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var blendLayer: Int32 {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var bindTarget: BindTarget {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var fillMode: AnimationFillMode {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var additive: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var trimStart: TimeInterval? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var trimEnd: TimeInterval? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var trimDuration: TimeInterval? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var offset: TimeInterval {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var delay: TimeInterval {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var speed: Float {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var repeatMode: AnimationRepeatMode {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var duration: TimeInterval {
        get {
            assertUnimplemented()
        }
    }
    
    public init(group: [any AnimationDefinition], name: String = "", repeatMode: AnimationRepeatMode = .none, fillMode: AnimationFillMode = [], trimStart: TimeInterval? = nil, trimEnd: TimeInterval? = nil, trimDuration: TimeInterval? = nil, offset: TimeInterval = 0, delay: TimeInterval = 0, speed: Float = 1.0) {
        assertUnimplemented()
    }
    
    @available(macOS, introduced: 12.0, deprecated: 12.0, renamed: "group")
    @available(iOS, introduced: 15.0, deprecated: 15.0, renamed: "group")
    @available(macCatalyst, introduced: 15.0, deprecated: 15.0, renamed: "group")
    @available(visionOS, introduced: 1.0, deprecated: 1.0, renamed: "group")
    @available(tvOS, unavailable, introduced: 26.0)
    @_documentation(visibility: internal) public var group_: [any AnimationDefinition]? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}
