public import CoreGraphics
public import Spatial
package import AttributeGraph
private import _MySwiftUICoreShims

public struct GeometryProxy {
    private var owner: AnyWeakAttribute // 0x0
    private var _size: WeakAttribute<ViewSize> // 0x8
    private var _environment: WeakAttribute<EnvironmentValues> // 0x10
    private var _transform: WeakAttribute<ViewTransform> // 0x18
    private var _position: WeakAttribute<CGPoint> // 0x20
    private var _safeAreaInsets: WeakAttribute<SafeAreaInsets> // 0x28
    private var _seed: UInt32 // 0x30
    
    package init(
        owner: AnyAttribute,
        size: Attribute<ViewSize>,
        environment: Attribute<EnvironmentValues>,
        transform: Attribute<ViewTransform>,
        position: Attribute<CGPoint>,
        safeAreaInsets: Attribute<SafeAreaInsets>?,
        seed: UInt32
    ) {
        self.owner = AnyWeakAttribute(owner)
        self._size = WeakAttribute(size)
        self._environment = WeakAttribute(environment)
        self._transform = WeakAttribute(transform)
        self._position = WeakAttribute(position)
        self._safeAreaInsets = WeakAttribute(safeAreaInsets)
        self._seed = seed
    }
    
    public var size: CGSize {
        Update.begin()
        
        let result: CGSize
        if let size = self._size.attribute {
            let context = AnyRuleContext(attribute: owner.attribute ?? .empty)
            result = context[size].value
        } else {
            result = .zero
        }
        
        Update.end()
        return result
    }
    
    var environment: EnvironmentValues {
        Update.begin()
        
        var result: EnvironmentValues
        
        if let environment = self._environment.attribute {
            result = AnyRuleContext(attribute: self.owner._attribute)[environment]
        } else {
            result = EnvironmentValues(PropertyList())
            
            if ViewGraphHost.isDefaultEnvironmentConfigured {
                let defaultEnvironment = unsafe ViewGraphHost.defaultEnvironment
                result.plist = defaultEnvironment.plist
            } else {
                CoreGlue2.shared.configureEmptyEnvironment(&result)
            }
        }
        
        Update.end()
        return result
    }
    
    public subscript<T>(anchor: Anchor<T>) -> T {
        assertUnimplemented()
    }
    
    public var safeAreaInsets: EdgeInsets {
        assertUnimplemented()
    }
    
    @available(iOS, introduced: 13.0, deprecated: 100000.0, message: "use overload that accepts a CoordinateSpaceProtocol instead")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, message: "use overload that accepts a CoordinateSpaceProtocol instead")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, message: "use overload that accepts a CoordinateSpaceProtocol instead")
    @available(watchOS, introduced: 6.0, deprecated: 100000.0, message: "use overload that accepts a CoordinateSpaceProtocol instead")
    @available(visionOS, introduced: 1.0, deprecated: 100000.0, message: "use overload that accepts a CoordinateSpaceProtocol instead")
    @_disfavoredOverload public func frame(in coordinateSpace: CoordinateSpace) -> CGRect {
        assertUnimplemented()
    }
    
    @available(visionOS 1.0, *)
    @available(iOS, unavailable)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    public func transform(in coordinateSpace: some CoordinateSpaceProtocol) -> AffineTransform3D? {
        assertUnimplemented()
    }
    
    static var current: GeometryProxy? {
        guard let proxy = unsafe _threadGeometryProxyData() else {
            return nil
        }
        
        return unsafe proxy
            .assumingMemoryBound(to: GeometryProxy.self)
            .pointee
    }
    
    package func asCurrent<T>(do block: () throws -> T) rethrows -> T {
        var proxy = self
        let old = unsafe _threadGeometryProxyData()
        do {
            let result = try withUnsafeMutablePointer(to: &proxy) { pointer in
                unsafe _setThreadGeometryProxyData(pointer)
                return try block()
            }
            unsafe _setThreadGeometryProxyData(old)
            return result
        } catch {
            unsafe _setThreadGeometryProxyData(old)
            throw error
        }
    }
}

extension GeometryProxy {
    public func bounds(of coordinateSpace: NamedCoordinateSpace) -> CGRect? {
        assertUnimplemented()
    }
    
    public func frame(in coordinateSpace: some CoordinateSpaceProtocol) -> CGRect {
        assertUnimplemented()
    }
}

extension GeometryProxy {
    public var containerCornerInsets: RectangleCornerInsets {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension GeometryProxy : Sendable {
}
