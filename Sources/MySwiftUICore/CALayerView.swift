public import QuartzCore
public import Spatial

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct _CALayerView<LayerType> : View where LayerType : CALayer {
    @safe public nonisolated(unsafe) var update: (LayerType) -> Void
    
    @available(iOS 14.0, tvOS 14.0, watchOS 7.0, macOS 11.0, *)
    public typealias Body = Never
}

@available(*, unavailable)
extension _CALayerView : Sendable {
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension _CALayerView {
    nonisolated public init(type: LayerType.Type, onUpdate update: @escaping (LayerType) -> Void) {
        self.update = update
    }
    
    nonisolated public static func _makeView(view: _GraphValue<_CALayerView<LayerType>>, inputs: _ViewInputs) -> _ViewOutputs {
        return self.makeLeafView(view: view, inputs: inputs)
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension _CALayerView where LayerType == CALayer {
    nonisolated public init(onUpdate update: @escaping (LayerType) -> Void) {
        self.update = update
    }
}

extension _CALayerView : @preconcurrency RendererLeafView {
    @_spi(Internal) public func contains(points: UnsafeBufferPointer<Point3D>, size: CGSize) -> BitVector64 {
        assertUnimplemented()
    }
    
    @_spi(Internal) public func contentPath(size: CGSize) -> Path {
        assertUnimplemented()
    }
    
    @_spi(Internal) public func contentPath(size: CGSize, kind: ContentShapeKinds) -> Path {
        assertUnimplemented()
    }
    
    nonisolated static var requiresMainThread: Bool {
        return true
    }
    
    nonisolated func content() -> DisplayList.Content.Value {
        return .platformLayer(self)
    }
}

extension _CALayerView : @preconcurrency PlatformLayerFactory {
    package var viewType: Any.Type {
        assertUnimplemented()
    }
    
    package func encoding() -> (id: String, data: any (Decodable & Encodable))? {
        assertUnimplemented()
    }
    
    package var platformLayerType : CALayer.Type {
        return LayerType.self
    }
    
    package func updatePlatformLayer(_ layer: CALayer) {
        self.update(layer as! LayerType)
    }
    
    package func renderPlatformLayer(in context: GraphicsContext, size: CGSize, renderer: DisplayList.GraphicsRenderer) {
        assertUnimplemented()
    }
    
    package var capabilities: DisplayList.PlatformViewCapabilities {
        assertUnimplemented()
    }
}
