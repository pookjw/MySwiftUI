private import ObjectiveC.runtime
private import UIKit
@_spi(Internal) private import MySwiftUICore
private import _UIKitPrivate

@_cdecl("uiKitShims_onDyldLoaded")
func onDyldLoaded() {
    swizzle_setupDefaultEnvironmentWithScreen()
}

private nonisolated(unsafe) var original_setupDefaultEnvironmentWithScreen: IMP!
private func swizzle_setupDefaultEnvironmentWithScreen() {
    unsafe assert(original_setupDefaultEnvironmentWithScreen == nil)
    
    let method = unsafe class_getClassMethod(UIApplication.self, Selector(("_setupDefaultEnvironmentWithScreen:")))!
    unsafe original_setupDefaultEnvironmentWithScreen = unsafe method_getImplementation(method)
    
    let custom: (@convention(c) (AnyClass, Selector, AnyObject) -> Void) = { `self`, _cmd, screen in
        let casted = unsafe unsafeBitCast(original_setupDefaultEnvironmentWithScreen, to: (@convention(c) (AnyClass, Selector, AnyObject) -> Void).self)
        casted(self, _cmd, screen)
        setupDefaultEnvironmentWithScreen(screen: MyUIScreen(screen: screen))
    }
    
    unsafe method_setImplementation(method, unsafeBitCast(custom, to: IMP.self))
}

private func setupDefaultEnvironmentWithScreen(screen: MyUIScreen) {
    // screen -> x0 -> x23
    // <+388>
    var environment = unsafe ViewGraphHost.defaultEnvironment
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
    
    let urlAction = OpenURLAction.defaultSystemAction { url, completion in
        UIApp!.open(url, options: [:]) { success in
            completion(success)
        }
    }
    environment.setDefaultOpenURL(urlAction)
    
    unsafe ViewGraphHost.defaultEnvironment = environment
}
