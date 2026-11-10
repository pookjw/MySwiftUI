private import _MySwiftUICoreShims
public import QuartzCore
public import RenderBox
private import _QuartzCorePrivate

@_spi(Internal)
public struct PlatformDrawableOptions : Equatable, Sendable {
    var base: RasterizationOptions
    
    init(base: RasterizationOptions) {
        self.base = base
    }
    
    package var isAccelerated: Bool {
        return self.base.flags.contains(.isAccelerated)
    }
    
    package var isOpaque: Bool {
        return self.base.flags.contains(.isOpaque)
    }
    
    package var rendersAsynchronously: Bool {
        return self.base.flags.contains(.rendersAsynchronously)
    }
    
    package var rendersFirstFrameAsynchronously: Bool {
        return self.base.flags.contains(.rendersFirstFrameAsync)
    }
    
    package var caLayerContentsFormat: CALayerContentsFormat {
        var format: CALayerContentsFormat = self.base.flags.contains(.rgbaContext) ? .RGBA8Uint : .automaticSPI
        format = self.base.flags.contains(.alphaOnly) ? .a8 : format
        return format
    }
    
    package func update(rbLayer: AnyObject) {
        let casted = rbLayer as! RBLayer
        casted.colorMode = self.base.resolvedColorMode
        casted.rendersAsynchronously = self.base.flags.contains(.rendersAsynchronously)
        casted.maxDrawableCount = Int(self.base.maxDrawableCount)
        casted.allowsDisplayCompositing = self.base.flags.contains(.prefersDisplayCompositing)
        casted.allowsPackedDrawable = self.base.flags.contains(.allowsPackedDrawable)
        casted.setPromotesFramebuffer(!self.base.flags.contains(.fixedPixelFormat))
        casted.displayHeadroomLimit = self.base.allowedDynamicRange?.maxHeadroom ?? .infinity
    }
}

@_spi(Internal)
public protocol PlatformDrawable : AnyObject {
    var options: PlatformDrawableOptions { get set }
    static var allowsContentsMultiplyColor: Bool { get }
    func update(content: PlatformDrawableContent?, required: Bool) -> Bool
    func makeAsyncUpdate(content: PlatformDrawableContent, required: Bool, layer: CALayer, bounds: CGRect) -> (() -> Void)?
    func setContentsScale(_ contentsScale: CGFloat)
    func drawForTesting(in displayList: RBDisplayList)
}
