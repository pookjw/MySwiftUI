internal import MySwiftUICore
internal import AttributeGraph
internal import Observation

struct TransformScrollStorageModifier<T : ScrollEnvironmentTransform> : _GraphInputsModifier, PrimitiveViewModifier {
    private(set) var transform: T
    
    static func _makeInputs(modifier: _GraphValue<TransformScrollStorageModifier<T>>, inputs: inout _GraphInputs) {
        /*
         modifier -> x0 -> x20
         inputs -> x1 -> x19
         */
        // <+176>
        modifier.value.transform
        inputs.environment
        assertUnimplemented()
    }
}

protocol ScrollEnvironmentTransform {
    func update(properties: inout ScrollEnvironmentProperties)
}

struct ScrollEnvironmentProperties : Equatable {
    private var isEnabled: Bool // 0x0
    private var isClippingEnabled: Bool // 0x1
    private var clipDisabledBehavior: ScrollClipDisabledBehavior // 0x2
    private var dismissKeyboardMode: ScrollDismissesKeyboardMode.Role // 0x3
    private var scrollBehavior: ResolvedScrollBehavior? // 0x8
    private var decelerationRate: ScrollDecelerationRate // 0x50
    private var layoutDirection: LayoutDirection // 0x51
    private var options: ScrollEnvironmentProperties.Options // 0x52
    private var indicatorFlashSeed: UInt32 // 0x54
    private var accessoryEdge: Edge? // 0x58
    private var accessoryVisibility: Visibility // 0x59
    private var edgeEffectStyle: [Edge : ScrollEdgeEffectStyle] // 0x60
    private var edgeEffectHidden: [Edge : Bool] // 0x68
    private var edgeEffectDisabled: Bool // 0x70
    private var verticalIndicator: ScrollIndicatorConfiguration // 0x78
    private var verticalBounceBehavior: ScrollBounceBehavior.Role // 0x89
    private var horizontalIndicator: ScrollIndicatorConfiguration // 0x90
    private var horizontalBounceBehavior: ScrollBounceBehavior.Role // 0xa1
    private var allowedAutoScrollAxes: Axis.Set? // 0xa2
    private var autoScrollAllowsPaginated: Bool // 0xa4
    private var isContainedInPlatter: Bool // 0xa5
    private var crownScrollingAxis: Axis? // 0xa6
    private var handGestureShortcutPaginationDirection: HandGestureShortcutPaginationDirection // 0xa7
    private var navigationBarScrollMetrics: NavigationBarScrollMetrics? // 0xa8
    private var gradientMaskLengths: EdgeInsets // 0xc8
    private var gradientMaskEdgeInsets: EdgeInsets // 0xe8
    
    static func == (lhs: ScrollEnvironmentProperties, rhs: ScrollEnvironmentProperties) -> Bool {
        assertUnimplemented()
    }
    
    init(environment: EnvironmentValues) {
        assertUnimplemented()
    }
}

extension ScrollEnvironmentProperties {
    struct Options : OptionSet {
        let rawValue: Int8
    }
}

struct TransformScrollStorageEnvironment<T : ScrollEnvironmentTransform> : StatefulRule {
    @Attribute private var environment: EnvironmentValues
    @Attribute private var transform: T
    private var storage: ScrollEnvironmentStorage?
    private var oldProperties: ScrollEnvironmentProperties
    
    init(
        environment: Attribute<EnvironmentValues>,
        transform: Attribute<T>,
        storage: ScrollEnvironmentStorage?,
        oldProperties: ScrollEnvironmentProperties
    ) {
        assertUnimplemented()
    }
    
    typealias Value = EnvironmentValues
    
    func updateValue() {
        assertUnimplemented()
    }
}

@Observable
final class ScrollEnvironmentStorage {
    private var baseProperties: ScrollEnvironmentProperties
    private var transform: ScrollEnvironmentTransform?
    
    init(_ baseProperties: ScrollEnvironmentProperties, transform: ScrollEnvironmentTransform?) {
        assertUnimplemented()
    }
}
