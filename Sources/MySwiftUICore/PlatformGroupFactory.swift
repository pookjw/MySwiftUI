package import CoreGraphics

package protocol PlatformGroupFactory : AnyViewFactory {
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

extension PlatformGroupFactory {
    package func renderPlatformGroup(_ displayList: DisplayList, in context: GraphicsContext, size: CGSize, renderer: DisplayList.GraphicsRenderer) {
        assertUnimplemented()
    }
    
    package var features: DisplayList.Features {
        assertUnimplemented()
    }
    
    package var groupHasContent: Bool {
        assertUnimplemented()
    }
}
