public import CoreGraphics
public import Spatial
internal import AttributeGraph
private import _MySwiftUIShims

public struct GeometryProxy {
    private var owner: AnyWeakAttribute
    private var _size: WeakAttribute<ViewSize>
    private var _environment: WeakAttribute<EnvironmentValues>
    private var _transform: WeakAttribute<ViewTransform>
    private var _position: WeakAttribute<CGPoint>
    private var _safeAreaInsets: WeakAttribute<SafeAreaInsets>
    private var _seed: Swift.UInt32
    
    init(
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
        fatalError("TODO")
    }
    
    public subscript<T>(anchor: Anchor<T>) -> T {
        fatalError("TODO")
    }
    
    public var safeAreaInsets: EdgeInsets {
        fatalError("TODO")
    }
    
    @available(iOS, introduced: 13.0, deprecated: 100000.0, message: "use overload that accepts a CoordinateSpaceProtocol instead")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, message: "use overload that accepts a CoordinateSpaceProtocol instead")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, message: "use overload that accepts a CoordinateSpaceProtocol instead")
    @available(watchOS, introduced: 6.0, deprecated: 100000.0, message: "use overload that accepts a CoordinateSpaceProtocol instead")
    @available(visionOS, introduced: 1.0, deprecated: 100000.0, message: "use overload that accepts a CoordinateSpaceProtocol instead")
    @_disfavoredOverload public func frame(in coordinateSpace: CoordinateSpace) -> CGRect {
        fatalError("TODO")
    }
    
    @available(visionOS 1.0, *)
    @available(iOS, unavailable)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    public func transform(in coordinateSpace: some CoordinateSpaceProtocol) -> AffineTransform3D? {
        fatalError("TODO")
    }
    
    mutating func asCurrent<T>(do block: () throws -> T) rethrows -> T {
        let old = _threadGeometryProxyData()
        
        _setThreadGeometryProxyData(&self)
        
        do {
            let result = try block()
            _setThreadGeometryProxyData(old)
            return result
        } catch {
            _setThreadGeometryProxyData(old)
            throw error
        }
    }
}

extension GeometryProxy {
    public func bounds(of coordinateSpace: NamedCoordinateSpace) -> CGRect? {
        fatalError("TODO")
    }
    
    public func frame(in coordinateSpace: some CoordinateSpaceProtocol) -> CGRect {
        fatalError("TODO")
    }
}

extension GeometryProxy {
    public var containerCornerInsets: RectangleCornerInsets {
        fatalError("TODO")
    }
}

@available(*, unavailable)
extension GeometryProxy: Sendable {
}
