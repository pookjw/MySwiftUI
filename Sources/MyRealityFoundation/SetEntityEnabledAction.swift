@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
public struct SetEntityEnabledAction : EntityAction, Codable {
    public var targetEntity: ActionEntityResolution
    
    public var isEnabled: Bool
    
    @available(macOS, introduced: 15.0, deprecated: 15.0, renamed: "isEnabled")
    @available(iOS, introduced: 18.0, deprecated: 18.0, renamed: "isEnabled")
    @available(macCatalyst, introduced: 18.0, deprecated: 18.0, renamed: "isEnabled")
    @available(visionOS, introduced: 2.0, deprecated: 2.0, renamed: "isEnabled")
    @available(tvOS, introduced: 26.0, deprecated: 26.0, renamed: "isEnabled")
    public var enabled: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var animatedValueType: (any AnimatableData.Type)? {
        get {
            assertUnimplemented()
        }
    }
    
    public init(targetEntity: ActionEntityResolution = .sourceEntity, isEnabled: Bool) {
        assertUnimplemented()
    }
    
    @available(macOS, introduced: 15.0, deprecated: 15.0, renamed: "isEnabled")
    @available(iOS, introduced: 18.0, deprecated: 18.0, renamed: "isEnabled")
    @available(macCatalyst, introduced: 18.0, deprecated: 18.0, renamed: "isEnabled")
    @available(visionOS, introduced: 2.0, deprecated: 2.0, renamed: "isEnabled")
    @available(tvOS, introduced: 26.0, deprecated: 26.0, renamed: "isEnabled")
    public init(targetEntity: ActionEntityResolution = .sourceEntity, enabled: Bool) {
        assertUnimplemented()
    }
    
    @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias EventParameterType = Never
    
    public func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    public init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
}
