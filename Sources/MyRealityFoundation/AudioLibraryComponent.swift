@available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
public struct AudioLibraryComponent : Component, ExpressibleByDictionaryLiteral {
    public var resources: [String : AudioResource]
    
    public init(resources: [String : AudioResource] = [:]) {
        assertUnimplemented()
    }
    
    public init(dictionaryLiteral elements: (String, AudioResource)...) {
        assertUnimplemented()
    }
    
    @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias Key = String
    
    @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias Value = AudioResource
}

extension AudioLibraryComponent {
    public static func __fromCore(_ coreComponent: __ComponentRef) -> AudioLibraryComponent {
        assertUnimplemented()
    }
    
    public func __toCore(_ coreComponent: __ComponentRef) {
        assertUnimplemented()
    }
    
    public static var __coreComponentType: __ComponentTypeRef {
        get {
            assertUnimplemented()
        }
    }
}
