private import _UIKitPrivate
private import ObjectiveC.runtime
private import MySwiftUICore

private nonisolated(unsafe) var original_uncachedSolariumEnabledForCurrentDeviceIdiom: IMP!
func swizzle_uncachedSolariumEnabledForCurrentDeviceIdiom() {
    unsafe assert(original_uncachedSolariumEnabledForCurrentDeviceIdiom == nil)
    
    let method = unsafe class_getClassMethod(_UIKitFeatures.self, #selector(getter: _UIKitFeatures.uncachedSolariumEnabledForCurrentDeviceIdiom))!
    unsafe original_uncachedSolariumEnabledForCurrentDeviceIdiom = unsafe method_getImplementation(method)
    
    let custom: (@convention(c) @MainActor (AnyClass, Selector) -> Bool) = { `self`, _cmd in
#if SwiftUICompataibility
        let casted = unsafe unsafeBitCast(original_uncachedSolariumEnabledForCurrentDeviceIdiom, to: (@convention(c) @MainActor (AnyClass, Selector) -> Bool).self)
        let result = casted(self, _cmd)
        let msuiResult = msui_uncachedSolariumEnabledForCurrentDeviceIdiom()
        assert(result == msuiResult)
        return result
        #else
        
        #endif
    }
    
    unsafe method_setImplementation(method, unsafeBitCast(custom, to: IMP.self))
}

@MainActor private func msui_uncachedSolariumEnabledForCurrentDeviceIdiom() -> Bool {
    let idiom = UIDevice.current.userInterfaceIdiom
    let enablementIdiom: Solarium.EnablementIdiom
    switch idiom {
    case .phone, .pad:
        enablementIdiom = .iOS
    case .tv:
#if os(tvOS)
        enablementIdiom = .tvOS
#else
        enablementIdiom = .iOS
#endif
    case .carPlay:
        enablementIdiom = .iOS
    case .watch:
        enablementIdiom = .watchOS
    case .mac:
        enablementIdiom = .macOS
    default:
        enablementIdiom = .iOS
    }
    
    return Solarium.isEnabled(enablementIdiom)
}
