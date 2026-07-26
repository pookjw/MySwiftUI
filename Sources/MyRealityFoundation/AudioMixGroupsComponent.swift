@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
public struct AudioMixGroupsComponent {
    public init(mixGroups: [AudioMixGroup] = []) {
        assertUnimplemented()
    }
    
    public mutating func set(_ mixGroup: AudioMixGroup) {
        assertUnimplemented()
    }
    
    public mutating func remove(named name: String) {
        assertUnimplemented()
    }
    
    public func mixGroup(named name: String) -> AudioMixGroup? {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension AudioMixGroupsComponent : Hashable {
    public static func == (a: AudioMixGroupsComponent, b: AudioMixGroupsComponent) -> Bool {
        assertUnimplemented()
    }
    
    public func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
    
    public var hashValue: Int {
        get {
            assertUnimplemented()
        }
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension AudioMixGroupsComponent : Component {
    @MainActor @preconcurrency public static func __fromCore(_ coreComponent: __ComponentRef) -> AudioMixGroupsComponent {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func __toCore(_ coreComponent: __ComponentRef) {
        assertUnimplemented()
    }

    @_spi(Internal) public static var componentName: String {
        get {
            assertUnimplemented()
        }
    }

    @_spi(Internal) public static func __load(from ref: UnsafeRawPointer) {
        assertUnimplemented()
    }

    @_spi(Internal) public static func __store(attribute: any MyRealityFoundation::Component, to ref: UnsafeMutableRawPointer, offset: Int, deinitialize: Bool) {
        assertUnimplemented()
    }

    @_spi(Internal) public static func __store(attribute: any MyRealityFoundation::Component, to ref: UnsafeMutableRawPointer, offset: Int) {
        assertUnimplemented()
    }

    @_spi(Internal) public static var __coreComponentType: __ComponentTypeRef {
        get {
            assertUnimplemented()
        }
    }

    @_spi(Internal) public static func __load(from ref: UnsafeRawPointer, offset: Int) -> any MyRealityFoundation.Component {
        assertUnimplemented()
    }
}
