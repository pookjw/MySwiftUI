#warning("TODO")
internal import CoreGraphics

public struct _RendererConfiguration {
    public var renderer: Renderer
    public var minFrameInterval: Double = 0
    private(set) var contentsScale: CGFloat? = nil
    
    init(renderer: _RendererConfiguration.Renderer) {
        self.renderer = renderer
    }
}

extension _RendererConfiguration {
    public enum Renderer {
        case `default`
        indirect case rasterized(_RendererConfiguration.RasterizationOptions)
    }
}

extension _RendererConfiguration {
    public struct RasterizationOptions {
        public var colorMode: ColorRenderingMode
        public var rbColorMode: Int32?
        public var rendersAsynchronously: Bool
        public var isOpaque: Bool
        public var drawsPlatformViews: Bool
        public var prefersDisplayCompositing: Bool
        public var maxDrawableCount: Int
        
        public init() {
            fatalError("TODO")
        }
    }
}

struct RasterizationOptions: Equatable {
    // TODO
    
    init(_ options: _RendererConfiguration.RasterizationOptions) {
        fatalError("TODO")
    }
}
