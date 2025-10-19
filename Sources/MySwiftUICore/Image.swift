#warning("TODO")

public struct Image: View {
    public var body: Never {
        fatalError("TODO")
    } // TODO
}

extension Image {
    @frozen public enum Orientation : UInt8, CaseIterable, Hashable {
        case up
        case upMirrored
        case down
        case downMirrored
        case left
        case leftMirrored
        case right
        case rightMirrored
    }
    
    struct ResizingInfo {
        private var capInsets: EdgeInsets
        private var mode: Image.ResizingMode
    }
    
    public enum ResizingMode : Sendable {
        case tile
        case stretch
    }
    
    enum Interpolation {
        case none
        case low
        case medium
        case high
    }
    
    struct DynamicRange {
        private var storage: Image.DynamicRange.Storage
    }
}

extension Image.ResizingMode: Hashable {}

extension Image.DynamicRange {
    enum Storage {
        case standard
        case constrainedHigh
        case high
    }
}

extension Image {
    package struct Resolved {
        private var image: GraphicsImage
//        private var label: AccessibilityImageLabel?
//        private var _basePlatformItemImage: EquatableOptionalObject<AnyObject>
//        private var _layoutMetrics: IndirectOptional<Image.LayoutMetrics>
        private var decorative: Bool
//        private var backgroundShape: SymbolVariants.Shape?
        private var backgroundCornerRadius: Float?
        private var styleResolverMode: _ShapeStyle_ResolverMode
    }
}

extension Image {
    package struct NamedResolved {
        private var name: String
//        private var location: Image.Location
        private var value: Float?
//        private var symbolRenderingMode: SymbolRenderingMode.Storage?
        private var isTemplate: Bool
        private var environment: EnvironmentValues
    }
}
