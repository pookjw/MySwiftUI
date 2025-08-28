#warning("TODO")
internal import CoreGraphics

struct GraphicsImage {
    private var contents: GraphicsImage.Contents?
    private var scale: CGFloat
    private var uprotatedPixelSize: CGSize
    private var orientation: Image.Orientation
    private var maskColor: Color.ResolvedHDR?
    private var resizingInfo: Image.ResizingInfo?
    private var isAntialiased: Bool
    private var interpolation: Image.Interpolation
    private var allowedDynamicRange: Image.DynamicRange
}

extension GraphicsImage {
    enum Contents {
        case cgImage(CGImage)
        case ioSurface(IOSurfaceRef)
//        case vectorGlyph(ResolvedVectorGlyph)
//        case vectorLayer(VectorImageLayer)
//        case color(Color.ResolvedHDR)
//        case named(NamedImage.Key)
    }
}
