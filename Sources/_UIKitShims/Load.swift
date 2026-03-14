private import ObjectiveC.runtime
private import UIKit
@_spi(Internal) private import MySwiftUICore

@_cdecl("uiKitShims_onDyldLoaded")
func onDyldLoaded() {
    swizzle_setupDefaultEnvironmentWithScreen()
}

private nonisolated(unsafe) var original_setupDefaultEnvironmentWithScreen: IMP!
private func swizzle_setupDefaultEnvironmentWithScreen() {
    assert(original_setupDefaultEnvironmentWithScreen == nil)
    
    let method = class_getClassMethod(UIApplication.self, Selector(("_setupDefaultEnvironmentWithScreen:")))!
    original_setupDefaultEnvironmentWithScreen = method_getImplementation(method)
    
    let custom: (@convention(c) (AnyClass, Selector, AnyObject) -> Void) = { `self`, _cmd, screen in
        let casted = unsafeBitCast(original_setupDefaultEnvironmentWithScreen, to: (@convention(c) (AnyClass, Selector, AnyObject) -> Void).self)
        
        casted(self, _cmd, screen)
        setupDefaultEnvironmentWithScreen(screen: MyUIScreen(screen: screen))
    }
    
    method_setImplementation(method, unsafeBitCast(custom, to: IMP.self))
}

private func setupDefaultEnvironmentWithScreen(screen: MyUIScreen) {
    // screen -> x0 -> x23
    // <+388>
    var environment = ViewGraphHost.defaultEnvironment
    let traitCollection = screen.traitCollection
    
    if let idiom = ViewGraphHost.Idiom(_uiIdiom: traitCollection.userInterfaceIdiom) {
        // <+516>
        environment.viewGraphIdiom = idiom
    }
    
    // <+584>
    let assetConfiguration = ViewGraphHost.AssetCatalogConfiguration(
        referenceBounds: screen._referenceBounds,
        pointsPerInch: screen._pointsPerInch,
        preferredArtworkSubtype: 0
    )
    environment.viewGraphAssetCatalogConfiguration = assetConfiguration
    
    let urlAction = OpenURLAction.defaultSystemAction { _, _ in
        fatalError("TODO")
    }
    environment.setDefaultOpenURL(urlAction)
    
    ViewGraphHost.defaultEnvironment = environment
}
