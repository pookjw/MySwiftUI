// CE8713EF1F659E3933681417E097F9F6

#warning("TODO")
@_spi(Internal) internal import MySwiftUICore
internal import Foundation

@_objcRuntimeName(MySwiftUIGlue2) final class MySwiftUIGlue2: CoreGlue2 {
    override func setupPlatformProperties(_ parameters: CoreGlue2.SetupPlatformPropertiesParameters) {
        _setupPlatformProperties(parameters.view, kind: parameters.kind, platform: parameters.platform)
    }
}

extension MySwiftUIGlue2 {
    fileprivate func _setupPlatformProperties(_ view: AnyObject, kind: PlatformViewDefinition.ViewKind, platform: DisplayList.ViewUpdater.Platform) {
        /*
         self = x19
         kind = x25
         */
        guard case .drawing = kind else {
            return
        }
        
        fatalError("TODO")
    }
}
