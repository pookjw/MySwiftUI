@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
public struct GeometricPinsComponent : Component {
    public init() {
        assertUnimplemented()
    }
    
    public var pins: Set<GeometricPin> {
        get {
            assertUnimplemented()
        }
    }
    
    public subscript(name: String) -> GeometricPin? {
        get {
            assertUnimplemented()
        }
    }
    
    @discardableResult
    public mutating func removePin(named name: String) -> GeometricPin? {
        assertUnimplemented()
    }
    
    public mutating func set(pin: GeometricPin) {
        assertUnimplemented()
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension GeometricPinsComponent {
    public static func __fromCore(_ coreComponent: __ComponentRef) -> GeometricPinsComponent {
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
