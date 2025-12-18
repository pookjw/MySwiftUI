private import _MySwiftUIShims

@_spi(Internal)
public struct PlatformDrawableOptions: Equatable {
    var base: RasterizationOptions
    
    init(base: RasterizationOptions) {
        self.base = base
    }
}

@_spi(Internal)
public protocol PlatformDrawable: AnyObject {
    
}
