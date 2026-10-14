internal import CoreGraphics

struct IntelligenceLightSourceLayer : Hashable, PlatformViewFactory {
    private var colorScheme: ColorScheme
    private var prefersAudioReactivity: Bool
    
    var viewType: Any.Type {
        assertUnimplemented()
    }
    
    func encoding() -> (id: String, data: any (Decodable & Encodable))? {
        assertUnimplemented()
    }
    
    func makePlatformView() -> AnyObject? {
        assertUnimplemented()
    }
    
    func updatePlatformView(_ view: inout AnyObject) {
        assertUnimplemented()
    }
    
    func renderPlatformView(in context: GraphicsContext, size: CGSize, renderer: DisplayList.GraphicsRenderer) {
        assertUnimplemented()
    }
    
    var features: DisplayList.Features {
        assertUnimplemented()
    }
    
    var capabilities: DisplayList.PlatformViewCapabilities {
        assertUnimplemented()
    }
}
