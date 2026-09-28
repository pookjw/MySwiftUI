package import QuartzCore

package protocol AnyViewFactory {
    var viewType: Any.Type {
        get
    }
    
    func encoding() -> (id: String, data: any (Decodable & Encodable))?
}

extension AnyViewFactory {
    package var viewType: Any.Type {
        assertUnimplemented()
    }
    
    
    package func encoding() -> (id: String, data: any (Decodable & Encodable))? {
        assertUnimplemented()
    }
}

package protocol PlatformViewFactory : AnyViewFactory {
    func makePlatformView() -> AnyObject?
    func updatePlatformView(_ view: inout AnyObject)
    func renderPlatformView(in context: GraphicsContext, size: CGSize, renderer: DisplayList.GraphicsRenderer)
    
    var features: DisplayList.Features {
        get
    }
    
    var capabilities: DisplayList.PlatformViewCapabilities {
        get
    }
}

extension PlatformViewFactory {
    package var features: DisplayList.Features {
        return [.required]
    }
    
    package var capabilities: DisplayList.PlatformViewCapabilities {
        assertUnimplemented()
    }
    
    package func renderPlatformView(in context: GraphicsContext, size: CGSize, renderer: DisplayList.GraphicsRenderer) {
        assertUnimplemented()
    }
}

package protocol PlatformLayerFactory : AnyViewFactory {
    var platformLayerType : CALayer.Type { get }
    func updatePlatformLayer(_ layer: CALayer)
    func renderPlatformLayer(in context: GraphicsContext, size: CGSize, renderer: DisplayList.GraphicsRenderer)
    var capabilities: DisplayList.PlatformViewCapabilities { get }
}

package protocol _DisplayList_ViewFactory : AnyViewFactory {
    func makeView() -> AnyView
    var identity: _DisplayList_Identity { get }
}

extension _DisplayList_ViewFactory {
    package var identity: _DisplayList_Identity {
        assertUnimplemented()
    }
}
