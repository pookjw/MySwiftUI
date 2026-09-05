private import _MySwiftUIShims
public import QuartzCore
public import RenderBox

@_spi(Internal)
public struct PlatformDrawableOptions : Equatable {
    var base: RasterizationOptions
    
    init(base: RasterizationOptions) {
        self.base = base
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
