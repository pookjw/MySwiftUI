internal import CoreGraphics
internal import RenderBox

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
        public var colorMode: ColorRenderingMode // 0x0
        public var rbColorMode: Int32? // 0x4
        public var rendersAsynchronously: Bool // 0x9
        public var isOpaque: Bool // 0xa
        public var drawsPlatformViews: Bool // 0xb
        public var prefersDisplayCompositing: Bool // 0xc
        public var maxDrawableCount: Int // 0x10
        
        public init() {
            self.colorMode = .nonLinear
            self.rbColorMode = nil
            self.rendersAsynchronously = false
            self.isOpaque = true
            self.drawsPlatformViews = true
            self.prefersDisplayCompositing = false
            self.maxDrawableCount = 3
        }
    }
}

package struct RasterizationOptions : Equatable {
    private var rbColorMode: RBColorMode // 0x0
    private var colorMode: ColorRenderingMode // 0x4
    private(set) var allowedDynamicRange: Image.DynamicRange? // 0x5
    private var flags: RasterizationOptions.Flags // 0x8
    private var maxDrawableCount: Int8 // 0xc
    
    init(colorMode: ColorRenderingMode, allowedDynamicRange: Image.DynamicRange?, flags: RasterizationOptions.Flags) {
        assertUnimplemented()
    }
    
    init(_ options: _RendererConfiguration.RasterizationOptions) {
        var flags = RasterizationOptions.Flags.defaultFlags
        
        self.allowedDynamicRange = nil
        self.colorMode = options.colorMode
        
        if let rbColorMode = options.rbColorMode {
            self.rbColorMode = unsafe RBColorMode(rawValue: rbColorMode).unsafelyUnwrapped
        } else {
            self.rbColorMode = .invalid
        }
        
        if options.isOpaque {
            flags.formUnion([.isAccelerated, .isOpaque])
        } else {
            flags.formUnion([.isAccelerated])
        }
        
        if options.rendersAsynchronously {
            flags.formUnion(.rendersAsynchronously)
        }
        
        if options.prefersDisplayCompositing {
            flags.formUnion(.prefersDisplayCompositing)
        }
        
        self.flags = flags
        self.maxDrawableCount = Int8(truncatingIfNeeded: options.maxDrawableCount)
    }
    
    var colorSpace: RBColorSpace {
        assertUnimplemented()
    }
}

extension RasterizationOptions {
    struct Flags : OptionSet {
        static var isAccelerated: RasterizationOptions.Flags {
            return RasterizationOptions.Flags(rawValue: 1 << 0)
        }
        
        static var isOpaque: RasterizationOptions.Flags {
            return RasterizationOptions.Flags(rawValue: 1 << 1)
        }
        
        static var rendersAsynchronously: RasterizationOptions.Flags {
            return RasterizationOptions.Flags(rawValue: 1 << 2)
        }
        
        static var prefersDisplayCompositing: RasterizationOptions.Flags {
            return RasterizationOptions.Flags(rawValue: 1 << 3)
        }
        
        static var rendersFirstFrameAsync: RasterizationOptions.Flags {
            return RasterizationOptions.Flags(rawValue: 1 << 4)
        }
        
        static var allowsPackedDrawable: RasterizationOptions.Flags {
            return RasterizationOptions.Flags(rawValue: 1 << 5)
        }
        
        static var alphaOnly: RasterizationOptions.Flags {
            return RasterizationOptions.Flags(rawValue: 1 << 6)
        }
        
        static var requiresLayer: RasterizationOptions.Flags {
            return RasterizationOptions.Flags(rawValue: 1 << 7)
        }
        
        static var rgbaContext: RasterizationOptions.Flags {
            return RasterizationOptions.Flags(rawValue: 1 << 8)
        }
        
        static var highRes: RasterizationOptions.Flags {
            return RasterizationOptions.Flags(rawValue: 1 << 9)
        }
        
        static var fixedPixelFormat: RasterizationOptions.Flags {
            return RasterizationOptions.Flags(rawValue: 1 << 10)
        }
        
        static let defaultFlags: RasterizationOptions.Flags = [.allowsPackedDrawable, requiresLayer]
        
        let rawValue: UInt32
    }
}
