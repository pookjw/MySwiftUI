package import CoreGraphics

package struct GraphicsImage : Equatable, ProtobufEncodableMessage, ProtobufDecodableMessage {
    var contents: GraphicsImage.Contents? // 0x0
    private var scale: CGFloat // 0x10
    private(set) var unrotatedPixelSize: CGSize // 0x18
    private(set) var orientation: Image.Orientation // 0x28
    var maskColor: Color.ResolvedHDR? // 0x2c
    private var resizingInfo: Image.ResizingInfo? // 0x48
    private var isAntialiased: Bool // 0x69
    private var interpolation: Image.Interpolation // 0x6a
    private var allowedDynamicRange: Image.DynamicRange // 0x6b
    private var isTemplate: Bool
    var bitmapOrientation: Image.Orientation
    var headroom: Float
    var pixelSize: CGSize
    var size: CGSize
    var styleResolverMode: _ShapeStyle_ResolverMode

    init(contents: GraphicsImage.Contents?, scale: CGFloat, unrotatedPixelSize: CGSize, orientation: Image.Orientation, isTemplate: Bool, resizingInfo: Image.ResizingInfo?, antialiased: Bool, interpolation: Image.Interpolation) {
        assertUnimplemented()
    }

    package static func == (a: GraphicsImage, b: GraphicsImage) -> Bool {
        assertUnimplemented()
    }

    package func encode(to encoder: inout ProtobufEncoder) throws {
        assertUnimplemented()
    }

    package init(from decoder: inout ProtobufDecoder) throws {
        assertUnimplemented()
    }

    package func redact(in environment: EnvironmentValues) {
        assertUnimplemented()
    }

    package func render(at size: CGSize, prefersMask: Bool = false) -> CGImage? {
        assertUnimplemented()
    }

    func slicesAndTiles(at size: CGSize?) -> Image.ResizingInfo? {
        assertUnimplemented()
    }

    package func withRBImage(image: (AnyObject) -> Void, color: (Color.ResolvedHDR) -> Void) {
        assertUnimplemented()
    }
}

extension GraphicsImage {
    enum Contents : Equatable {
        static func == (lhs: GraphicsImage.Contents, rhs: GraphicsImage.Contents) -> Bool {
            assertUnimplemented()
        }
        
        case cgImage(CGImage)
        case ioSurface(IOSurfaceRef)
        case vectorGlyph(ResolvedVectorGlyph)
        // case vectorLayer(VectorImageLayer)
        case color(Color.ResolvedHDR)
        // case named(NamedImage.Key)
    }
}
