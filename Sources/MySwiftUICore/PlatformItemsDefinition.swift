@_spi(Internal) open class PlatformItemsDefinition {
    open class var system: PlatformSystemDefinition {
        preconditionFailure() // abstract
    }
    
    open class func addAccessibilityKey(inputs: inout _ViewInputs) {
        // noop
    }
    
    open class func combineAccessibilityProperites(_ properties: inout PlatformItemsDefinition.CombineAccessibilityProperties) {
        // noop
    }
    
    open class func makePlatformImage(_ image: PlatformItemsDefinition.MakePlatformImage) -> AnyObject? {
        return nil
    }
    
    public init() {
    }
    
    static nonisolated(unsafe) var uiKit: PlatformItemsDefinition.Type?
    static nonisolated(unsafe) var appKit: PlatformItemsDefinition.Type?
    
    public static func setDefinition(_ definition: PlatformItemsDefinition.Type, system: PlatformSystemDefinition) {
        if system == .uiKit {
            if unsafe PlatformItemsDefinition.uiKit == nil {
                unsafe PlatformItemsDefinition.uiKit = definition
            }
        } else if system == .appKit {
            if unsafe PlatformItemsDefinition.appKit == nil {
                unsafe PlatformItemsDefinition.appKit = definition
            }
        }
    }
}

extension PlatformItemsDefinition {
    @_spi(Internal) public struct CombineAccessibilityProperties {
        // TODO
    }
    
    @_spi(Internal) public struct MakePlatformImage {
        // TODO
    }
}
