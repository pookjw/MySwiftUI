#warning("TODO")
public import ObjectiveC
private import _MySwiftUIShims

@_spi(Internal)
@objc(MySwiftUICoreGlue2)
open class CoreGlue2: NSObject {
    @safe static nonisolated(unsafe) var shared: CoreGlue2 = _initializeMyCoreGlue2() as! CoreGlue2
    
    open func configureEmptyEnvironment(_ environmentValues: inout EnvironmentValues) {
        fatalError() // abstract
    }
    
    open func setupPlatformProperties(_ parameters: CoreGlue2.SetupPlatformPropertiesParameters) {
        fatalError() // abstract
    }
    
    open func setSeparatedState(_ parameters: CoreGlue2.SetSeparatedStateParameters) {
        fatalError() // abstract
    }
}

extension CoreGlue2 {
    public struct SetupPlatformPropertiesParameters {
        package var view: AnyObject
        package var kind: PlatformViewDefinition.ViewKind
        package var platform: DisplayList.ViewUpdater.Platform
    }
    
    public struct SetSeparatedStateParameters {
        package var state: SeparatedState
        package var view: AnyObject
        package var identity: _DisplayList_Identity
        package var reason: DisplayList.ViewUpdater.Platform.SeparationReason
        package var platform: DisplayList.ViewUpdater.Platform
    }
}
