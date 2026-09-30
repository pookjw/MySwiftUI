@_spi(Internal) internal import MySwiftUICore

final class UIKitPlatformItemsDefinition : PlatformItemsDefinition {
    override class var system: PlatformSystemDefinition {
        assertUnimplemented()
    }
    
    override class func addAccessibilityKey(inputs: inout _ViewInputs) {
        assertUnimplemented()
    }
    
    override class func combineAccessibilityProperites(_ properties: inout PlatformItemsDefinition.CombineAccessibilityProperties) {
        assertUnimplemented()
    }
    
    override class func makePlatformImage(_ image: PlatformItemsDefinition.MakePlatformImage) -> AnyObject? {
        assertUnimplemented()
    }
    
    override init() {
        assertUnimplemented()
    }
}
