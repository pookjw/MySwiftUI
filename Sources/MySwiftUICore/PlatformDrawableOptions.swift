private import _MySwiftUICoreShims
public import QuartzCore
public import RenderBox

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
        assertUnimplemented()
    }
    
    package var rendersAsynchronously: Bool {
        assertUnimplemented()
    }
    
    package var rendersFirstFrameAsynchronously: Bool {
        assertUnimplemented()
    }
    
    package var caLayerContentsFormat: CALayerContentsFormat {
        assertUnimplemented()
    }
    
    package func update(rbLayer: AnyObject) {
        assertUnimplemented()
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
