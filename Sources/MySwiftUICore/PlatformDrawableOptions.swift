private import _MySwiftUICoreShims
public import QuartzCore
public import RenderBox

@_spi(Internal)
public struct PlatformDrawableOptions : Equatable {
    var base: RasterizationOptions
    
    init(base: RasterizationOptions) {
        self.base = base
    }
    
    public var isAccelerated: Bool {
        assertUnimplemented()
    }
    
    public var isOpaque: Bool {
        assertUnimplemented()
    }
    
    public var rendersAsynchronously: Bool {
        assertUnimplemented()
    }
    
    public var rendersFirstFrameAsynchronously: Bool {
        assertUnimplemented()
    }
    
    public var caLayerContentsFormat: CALayerContentsFormat {
        assertUnimplemented()
    }
    
    public func update(rbLayer: OpaquePointer) {
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
