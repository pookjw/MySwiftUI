internal import CoreGraphics

package protocol AnyViewFactory {
    var viewType: Any.Type {
        get
    }
    
    func encoding() -> (id: String, data: any (Decodable & Encodable))?
}

extension AnyViewFactory {
    package func encoding() -> (id: String, data: any (Decodable & Encodable))? {
        assertUnimplemented()
    }
}

protocol PlatformViewFactory : AnyViewFactory {
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
    var features: DisplayList.Features {
        return [.required]
    }
}

protocol PlatformLayerFactory : AnyViewFactory {
    
}

protocol _DisplayList_ViewFactory : AnyViewFactory {
    
}
