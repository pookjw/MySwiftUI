@_cdecl("uiKitShims_onDyldLoaded")
func onDyldLoaded() {
    swizzle_setupDefaultEnvironmentWithScreen()
    swizzle_uncachedSolariumEnabledForCurrentDeviceIdiom()
}
