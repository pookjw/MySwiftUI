public import CoreGraphics
public import Foundation
public import DeveloperToolsSupport
public import UIKit
public import CoreTransferable
private import RenderBox
internal import AttributeGraph

@frozen public struct Image : Equatable, Sendable {
    package var provider: AnyImageProviderBox
    
    public static func == (lhs: Image, rhs: Image) -> Bool {
        assertUnimplemented()
    }
}

extension Image : View {
    nonisolated public static func _makeView(view: _GraphValue<Image>, inputs: _ViewInputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    nonisolated public static func _makeViewList(view: _GraphValue<Image>, inputs: _ViewListInputs) -> _ViewListOutputs {
        assertUnimplemented()
    }
    
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    nonisolated public static func _viewListCount(inputs: _ViewListCountInputs) -> Int? {
        assertUnimplemented()
    }
    
    @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
    public typealias Body = Never
    
    public var body: Never {
        assertUnimplemented()
    }
}

@usableFromInline
package class AnyImageProviderBox : @unchecked Sendable {
    func resolve(in context: ImageResolutionContext) -> Image.Resolved {
        fatalError("abstract")
    }
    
    func resolveNamedImage(in context: ImageResolutionContext) -> Image.NamedResolved? {
        fatalError("abstract")
    }
    
    func isEqual(to other: AnyImageProviderBox) -> Bool {
        fatalError("abstract")
    }
    
    init() {}
}

extension Image {
    @frozen public enum Orientation : UInt8, CaseIterable, Hashable {
        case up = 0
        case upMirrored = 2
        case down = 6
        case downMirrored = 4
        case left = 1
        case leftMirrored = 3
        case right = 7
        case rightMirrored = 5
    }
}

extension Image {
    struct ResizingInfo {
        private var capInsets: EdgeInsets
        private var mode: Image.ResizingMode
    }
    
    public enum ResizingMode : Sendable {
        case tile
        case stretch
    }

    public func resizable(capInsets: EdgeInsets = EdgeInsets(), resizingMode: Image.ResizingMode = .stretch) -> Image {
        assertUnimplemented()
    }
}

extension Image {
    public enum Interpolation : Sendable {
        case none
        case low
        case medium
        case high
        
        public static func == (a: Image.Interpolation, b: Image.Interpolation) -> Bool {
            assertUnimplemented()
        }
        
        public func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
    }
}

extension Image {
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, *)
    @available(watchOS, unavailable)
    public struct DynamicRange : Hashable, Sendable {
        public static let standard: Image.DynamicRange = Image.DynamicRange(storage: .standard)
        public static let constrainedHigh: Image.DynamicRange = Image.DynamicRange(storage: .constrainedHigh)
        public static let high: Image.DynamicRange = Image.DynamicRange(storage: .high)
        
        private(set) var storage: Image.DynamicRange.Storage
        
        init(storage: Image.DynamicRange.Storage) {
            self.storage = storage
        }
        
        var maxHeadroom: Float {
            switch self.storage {
            case .standard:
                return 1
            case .constrainedHigh:
                return 2
            case .high:
                return .infinity
            }
        }
    }

    @available(iOS 17.0, macOS 14.0, tvOS 17.0, *)
    @available(watchOS, unavailable)
    public func allowedDynamicRange(_ range: Image.DynamicRange?) -> Image {
        assertUnimplemented()
    }
}

extension Image.ResizingMode : Hashable {}
extension Image.Interpolation : Hashable {}
extension Image.Orientation : Sendable {}
extension Image.Orientation : BitwiseCopyable {}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension Image.DynamicRange {
    enum Storage : UInt8, Comparable {
        case standard
        case constrainedHigh
        case high
        
        static func < (lhs: Storage, rhs: Storage) -> Bool {
            return lhs.rawValue < rhs.rawValue
        }
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension Image.DynamicRange : ProtobufEnum {
    package var protobufValue: UInt {
        assertUnimplemented()
    }
    
    package init?(protobufValue: UInt) {
        assertUnimplemented()
    }
}

extension Image {
    package struct Resolved {
        private(set) var image: GraphicsImage { // 0x0
            didSet {
                assertUnimplemented()
            }
        }
        //        private var label: AccessibilityImageLabel? // 0x70
        //        private var _basePlatformItemImage: EquatableOptionalObject<AnyObject> // 0x90
        //        private var _layoutMetrics: IndirectOptional<Image.LayoutMetrics> // 0x98
        private var decorative: Bool // 0xa0
        //        private var backgroundShape: SymbolVariants.Shape? // 0xa1
        private var backgroundCornerRadius: Float? // 0xa4
        private var styleResolverMode: _ShapeStyle_ResolverMode // 0xb0
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

extension Image {
    public enum TemplateRenderingMode : Sendable {
        case template
        case original
        
        public static func == (a: Image.TemplateRenderingMode, b: Image.TemplateRenderingMode) -> Bool {
            assertUnimplemented()
        }
        
        public func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
    }
    
    @available(macOS 11.0, *)
    public enum Scale : Hashable, Sendable {
        case small
        case medium
        case large
        
        public static func == (a: Image.Scale, b: Image.Scale) -> Bool {
            assertUnimplemented()
        }
        
        public func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
    }
}

extension Image {
    public static let _mainNamedBundle: Bundle? = { assertUnimplemented() }()
}

extension Image {
    public init(_ name: String, bundle: Bundle? = nil) {
        assertUnimplemented()
    }
    
    public init(_ name: String, bundle: Bundle? = nil, label: Text) {
        assertUnimplemented()
    }
    
    public init(decorative name: String, bundle: Bundle? = nil) {
        assertUnimplemented()
    }
    
    @available(macOS 11.0, *)
    public init(systemName: String) {
        assertUnimplemented()
    }
    
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public init(_internalSystemName systemName: String) {
        assertUnimplemented()
    }
}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
extension Image {
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    public init(systemName: String, variableValue: Double?) {
        assertUnimplemented()
    }
    
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    public init(_internalSystemName systemName: String, variableValue: Double?) {
        assertUnimplemented()
    }
    
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    public init(_ name: String, variableValue: Double?, bundle: Bundle? = nil) {
        assertUnimplemented()
    }
    
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    public init(_ name: String, variableValue: Double?, bundle: Bundle? = nil, label: Text) {
        assertUnimplemented()
    }
    
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    public init(decorative name: String, variableValue: Double?, bundle: Bundle? = nil) {
        assertUnimplemented()
    }
}

extension Image {
    @available(*, deprecated, message: "Use .renderingMode(.original)")
    public init(_systemName systemName: String, colorPalette: [Color]? = nil) {
        assertUnimplemented()
    }
    
    @available(*, deprecated, message: "Use .renderingMode(.original)")
    public init(_internalSystemName systemName: String, colorPalette: [Color]? = nil) {
        assertUnimplemented()
    }
}

extension Image {
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    public init(_ resource: ImageResource) {
        assertUnimplemented()
    }
}

extension Image {
    public init(_ cgImage: CGImage, scale: CGFloat, orientation: Image.Orientation = .up, label: Text) {
        assertUnimplemented()
    }
    
    public init(decorative cgImage: CGImage, scale: CGFloat, orientation: Image.Orientation = .up) {
        assertUnimplemented()
    }
}

extension Image {
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    public init(size: CGSize, label: Text? = nil, opaque: Bool = false, colorMode: ColorRenderingMode = .nonLinear, renderer: @escaping (inout GraphicsContext) -> Void) {
        assertUnimplemented()
    }
}

extension Image {
    public func interpolation(_ interpolation: Image.Interpolation) -> Image {
        assertUnimplemented()
    }
    
    public func antialiased(_ isAntialiased: Bool) -> Image {
        assertUnimplemented()
    }
}

extension Image {
    public func renderingMode(_ renderingMode: Image.TemplateRenderingMode?) -> Image {
        assertUnimplemented()
    }
}

extension Image {
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    public func symbolRenderingMode(_ mode: SymbolRenderingMode?) -> Image {
        assertUnimplemented()
    }
}

extension Image {
    @available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
    public func symbolVariableValueMode(_ mode: SymbolVariableValueMode?) -> Image {
        assertUnimplemented()
    }
}

extension Image {
    @available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
    public func symbolColorRenderingMode(_ mode: SymbolColorRenderingMode?) -> Image {
        assertUnimplemented()
    }
}

extension Image.TemplateRenderingMode : Hashable {}

extension EnvironmentValues {
    @available(macOS 11.0, *)
    public var imageScale: Image.Scale {
        get { assertUnimplemented() }
        set { assertUnimplemented() }
    }
    
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, *)
    @available(watchOS, unavailable)
    public var allowedDynamicRange: Image.DynamicRange? {
        get { assertUnimplemented() }
        set { assertUnimplemented() }
    }
    
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    public var symbolRenderingMode: SymbolRenderingMode? {
        get { assertUnimplemented() }
        set { assertUnimplemented() }
    }
    
    @available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
    public var symbolVariableValueMode: SymbolVariableValueMode? {
        get { assertUnimplemented() }
        set { assertUnimplemented() }
    }
    
    @available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
    public var symbolColorRenderingMode: SymbolColorRenderingMode? {
        get { assertUnimplemented() }
        set { assertUnimplemented() }
    }
}

extension View {
    @available(macOS 11.0, *)
    @inlinable nonisolated public func imageScale(_ scale: Image.Scale) -> some View {
        environment(\.imageScale, scale)
    }
    
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, *)
    @available(watchOS, unavailable)
    @_alwaysEmitIntoClient nonisolated public func allowedDynamicRange(_ range: Image.DynamicRange?) -> some View {
        environment(\.allowedDynamicRange, range)
    }
    
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    @inlinable nonisolated public func symbolRenderingMode(_ mode: SymbolRenderingMode?) -> some View {
        environment(\.symbolRenderingMode, mode)
    }
    
    @available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
    @_alwaysEmitIntoClient nonisolated public func symbolVariableValueMode(_ mode: SymbolVariableValueMode?) -> some View {
        environment(\.symbolVariableValueMode, mode)
    }
    
    @available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
    @_alwaysEmitIntoClient nonisolated public func symbolColorRenderingMode(_ mode: SymbolColorRenderingMode?) -> some View {
        environment(\.symbolColorRenderingMode, mode)
    }
}

package struct ImageResolutionContext {
    private var environment: EnvironmentValues // 0x0
    private var symbolAnimator: RBSymbolAnimator? = nil // 0x10
    private var textStyle: Text.Style? // 0x18 (offset field)
    private var transaction: OptionalAttribute<Transaction> // 0x1c (offset field)
    private var symbolRenderingOptions = SymbolRenderingOptions(renderingMode: nil, variableValueMode: nil, colorMode: nil) // 0x20 (offset field)
    private var allowedDynamicRange: Image.DynamicRange? // 0x24 (offset field)
    var options: ImageResolutionContext.Options = [.inferSymbolRenderingMode] // 0x28 (offset field)
    
    init(
        environment: EnvironmentValues,
        textStyle: Text.Style?,
        transaction: OptionalAttribute<Transaction> = OptionalAttribute()
    ) {
        self.environment = environment
        self.textStyle = textStyle
        self.transaction = transaction
    }
}

extension ImageResolutionContext {
    struct Options : OptionSet {
        static var inferSymbolRenderingMode: ImageResolutionContext.Options {
            return ImageResolutionContext.Options(rawValue: 1 << 0)
        }
        
        static var isArchived: ImageResolutionContext.Options {
            return ImageResolutionContext.Options(rawValue: 1 << 1)
        }
        
        static var useCatalogReferences: ImageResolutionContext.Options {
            return ImageResolutionContext.Options(rawValue: 1 << 2)
        }
        
        static var animationsDisabled: ImageResolutionContext.Options {
            return ImageResolutionContext.Options(rawValue: 1 << 3)
        }
        
        static var preservesVectors: ImageResolutionContext.Options {
            return ImageResolutionContext.Options(rawValue: 1 << 4)
        }
        
        let rawValue: UInt8
    }
}

extension Image {
    package enum Location {
        case bundle(Bundle)
        case system
        case privateSystem
    }
}

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, *)
@available(macOS, unavailable)
extension Image {
    public init(uiImage: UIImage) {
        assertUnimplemented()
    }
}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
extension Image : Transferable {
    public static var transferRepresentation: some TransferRepresentation {
        ProxyRepresentation(exporting: { (_: Image) -> Data in
            assertUnimplemented()
        })
    }
}
