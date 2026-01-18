internal import CoreGraphics

protocol PlatformGroupFactory: AnyViewFactory {
    func makePlatformGroup() -> AnyObject?
    
    func needsUpdateFor(newValue: PlatformGroupFactory) -> Bool
    
    func updatePlatformGroup(_: inout AnyObject)
    
    func platformGroupContainer(_: AnyObject) -> AnyObject
    
    func renderPlatformGroup(_: DisplayList, in: GraphicsContext, size: CGSize, renderer: DisplayList.GraphicsRenderer)
    
    var features: DisplayList.Features {
        get
    }
    
    var groupHasContent: Bool {
        get
    }
}
