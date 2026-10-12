internal import CoreGraphics

package struct GraphicsImage {
    var contents: GraphicsImage.Contents? // 0x0
    private var scale: CGFloat // 0x10
    private(set) var uprotatedPixelSize: CGSize // 0x18
    private(set) var orientation: Image.Orientation // 0x28
    private(set) var maskColor: Color.ResolvedHDR? // 0x2c
    private var resizingInfo: Image.ResizingInfo? // 0x48
    private var isAntialiased: Bool // 0x69
    private var interpolation: Image.Interpolation // 0x6a
    private var allowedDynamicRange: Image.DynamicRange // 0x6b
}

extension GraphicsImage {
    enum Contents {
        case cgImage(CGImage)
        case ioSurface(IOSurfaceRef)
        case vectorGlyph(ResolvedVectorGlyph)
//        case vectorLayer(VectorImageLayer)
        case color(Color.ResolvedHDR)
//        case named(NamedImage.Key)
    }
}
