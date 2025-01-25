import QuartzCore

public protocol PlatformDrawable {
    static var allowsContentsMultiplyColor: Bool { get }
    var options: PlatformDrawableOptions { get set }
    func update(content: PlatformDrawableContent?, required: Bool) -> Bool
    func makeAsyncUpdate(content: PlatformDrawableContent, required: Bool, layer: CALayer, bounds: CGRect) -> () -> ()?
    func setContentsScale(_ scale: CGFloat)
    
#warning("RenderBox")
//    func drawForTesting(in list: RBDisplayList)
}
