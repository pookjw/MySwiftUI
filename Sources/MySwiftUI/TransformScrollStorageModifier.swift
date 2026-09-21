internal import MySwiftUICore
internal import AttributeGraph

struct TransformScrollStorageModifier<T : ScrollEnvironmentTransform> : _GraphInputsModifier, PrimitiveViewModifier {
    private(set) var transform: T
    
    static func _makeInputs(modifier: _GraphValue<TransformScrollStorageModifier<T>>, inputs: inout _GraphInputs) {
        /*
         modifier -> x0 -> x20
         inputs -> x1 -> x19
         */
        // <+176>
        let environment = TransformScrollStorageEnvironment(
            environment: inputs.environment,
            transform: modifier.value.transform,
            storage: nil
        )
        
        inputs.environment = Attribute(environment)
    }
}

protocol ScrollEnvironmentTransform {
    func update(properties: inout ScrollEnvironmentProperties)
}

struct ScrollEnvironmentProperties : Equatable {
    private var isEnabled: Bool = true // 0x0
    private var isClippingEnabled: Bool = true // 0x1
    private var clipDisabledBehavior: ScrollClipDisabledBehavior = .automatic // 0x2
    private var dismissKeyboardMode: ScrollDismissesKeyboardMode.Role = .automatic // 0x3
    private var scrollBehavior: ResolvedScrollBehavior? = nil // 0x8
    private var decelerationRate: ScrollDecelerationRate = .automatic // 0x50
    private var layoutDirection: LayoutDirection = .leftToRight // 0x51 (0x28 - offset field)
    private var options: ScrollEnvironmentProperties.Options = [] // 0x52 (0x2c - offset field)
    private var indicatorFlashSeed: UInt32 = 0 // 0x54 (0x30 - offset field)
    private var accessoryEdge: Edge? = nil // 0x58 (0x34 - offset field)
    private var accessoryVisibility: Visibility = .automatic // 0x59 (0x38 - offset field)
    private var edgeEffectStyle: [Edge : ScrollEdgeEffectStyle] = [:] // 0x60 (0x3c - offset field)
    private var edgeEffectHidden: [Edge : Bool] = [:] // 0x68 (0x40 - offset field)
    private var edgeEffectDisabled: Bool = false // 0x70 (0x44 - offset field)
    private var verticalIndicator = ScrollIndicatorConfiguration(
        visibility: .automatic,
        options: [],
        style: ScrollIndicatorStyle(value: .automatic)
    ) // 0x78 (0x48 - offset field)
    private var verticalBounceBehavior: ScrollBounceBehavior.Role = .automatic // 0x89 (0x4c - offset field)
    private var horizontalIndicator = ScrollIndicatorConfiguration(
        visibility: .automatic,
        options: [],
        style: ScrollIndicatorStyle(value: .automatic)
    ) // 0x90 (0x50 - offset field)
    private var horizontalBounceBehavior: ScrollBounceBehavior.Role = .automatic // 0xa1 (0x54 - offset field)
    private var allowedAutoScrollAxes: Axis.Set? = Axis.Set(rawValue: 0) // 0xa2 (0x58 - offset field)
    private var autoScrollAllowsPaginated: Bool = false // 0xa4 (0x5c - offset field)
    private var isContainedInPlatter: Bool = false // 0xa5 (0x60 - offset field)
    private var crownScrollingAxis: Axis? = .vertical // 0xa6 (0x64 - offset field)
    private var handGestureShortcutPaginationDirection: HandGestureShortcutPaginationDirection = .forward // 0xa7 (0x68 - offset field)
    private var navigationBarScrollMetrics: NavigationBarScrollMetrics? // 0xa8 (0x6c - offset field)
    private var gradientMaskLengths: EdgeInsets = .zero // 0xc8 (0x70 - offset field)
    private var gradientMaskEdgeInsets: EdgeInsets = .zero // 0xe8 (0x74 - offset field)
    
    static func == (lhs: ScrollEnvironmentProperties, rhs: ScrollEnvironmentProperties) -> Bool {
        assertUnimplemented()
    }
    
    init(environment: EnvironmentValues) {
        /*
         environment -> x0 -> x22
         return pointer -> x8 -> x19
         */
        // <+480>
        self = environment.scrollStorage.properties
        self.layoutDirection = environment.layoutDirection
        
        if !self.isEnabled {
            self.verticalIndicator.visibility = .never
            self.horizontalIndicator.visibility = .never
        }
    }
    
    @inline(always) // 원래 없음
    fileprivate init() {}
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
        oldProperties: ScrollEnvironmentProperties = ScrollEnvironmentProperties()
    ) {
        self._environment = environment
        self._transform = transform
        self.storage = storage
        self.oldProperties = oldProperties
    }
    
    typealias Value = EnvironmentValues
    
    func updateValue() {
        assertUnimplemented()
    }
}
