import QuartzCore

@_spi(MySwiftUICorePrivate)
public struct PlatformDrawableOptions: Equatable {
    public let isAccelerated: Bool
    public let isOpaque: Bool
    public let caLayerContentsFormat: CALayerContentsFormat
    public let rendersAsynchronously: Bool
    public let rendersFirstFrameAsynchronously: Bool
    private let base: RasterizationOptions
    
    public func update(rbLayer: AnyObject) {
        fatalError("TODO")
    }
}
