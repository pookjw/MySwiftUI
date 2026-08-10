// B2E20BEC96D7E01EE3D55A38320E6294
private import CoreGraphics

package struct SystemHoverEffect {
    private var info: SystemHoverEffect.Info?
    private var isEnabled: Bool
}

extension SystemHoverEffect {
    package enum Style {
        case automatic
        case highlight
        case lift
        case spotlight
        case pointerHidden
        case manipulation
    }
    
    package struct Info : Equatable {
        package var style: SystemHoverEffect.Style
        private var background: Bool
    }
    
    struct Resolved {
        private var info: SystemHoverEffect.Info
        private var isEnabled: Bool
    }
}

struct SystemHoverEffectStyleMetrics {
    private var highlightOpacity: Double
    private var increaseFocusStateOpacity: Double
    private var defaultBrightnessMultiplier: CGFloat
}

extension EnvironmentValues {
    package var isHoverEffectEnabled: Bool {
        get {
            return !self[EnvironmentValues.HoverEffectStateKey.self].leafContext.isDisabled
        }
        set {
            var value = self[EnvironmentValues.HoverEffectStateKey.self]
            if !newValue && !value.leafContext.isDisabled {
                value.leafContext.isDisabled = true
            }
            self[EnvironmentValues.HoverEffectStateKey.self] = value
        }
        _modify {
            var value = self.isHoverEffectEnabled
            yield &value
            self.isHoverEffectEnabled = value
        } 
    }
    
    fileprivate struct HoverEffectStateKey : EnvironmentKey {
        @safe static let defaultValue = HoverEffectContext.State()
    }
}

struct HoverEffectContext {
    // TODO
}

extension HoverEffectContext {
    enum Source {
        case effect(_DisplayList_Identity)
        case view(Namespace.ID)
        case none
    }
    
    enum Value {
//        case matchGroup(HoverEffectGroupInfo)
//        case transition(HoverEffectTransitionInfo)
//        case delay(HoverEffectDelayInfo)
//        case activationDelay(HoverEffectDelayInfo)
//        case overridePhase(HoverEffectPhaseInfo)
//        case blendFactor(Double)
//        case accessibilityOptions(HoverEffectAccessibilityOptions)
//        case allowedTouchTypes(Set<TouchType>)
//        case activationBehavior(HoverEffectActivationBehaviorInfo)
        case disabled(Bool)
        case identity
    }
    
    struct Properties {
        fileprivate var isDisabled: Bool = false // 0x0
        private var sceneIdentifier: String? = nil // 0x8
//        private var accessibilityOptions: HoverEffectAccessibilityOptions? // 0x18
//        private var allowedTouchTypes: Set<TouchType>? // 0x28
//        private var animations: [HoverEffectPhaseInfo : Animation] // 0x30
//        private var hasOverriddenAnimations: Bool // 0x38
//        private var delays: [HoverEffectPhaseInfo : Double] // 0x40
//        private var activationDelays: [HoverEffectPhaseInfo : Double] // 0x48
//        private var overridePhase: HoverEffectPhaseInfo? // 0x50
        private var blendFactor: Double = 1.0 // 0x58
//        private var activationBehavior: HoverEffectActivationBehaviorInfo? // 0x60
        
        init() {
        }
    }
    
    struct Group {
        private var source: HoverEffectContext.Source
//        private var info: HoverEffectGroupInfo
//        private var properties: HoverEffectContext.GroupProperties
    }
    
    struct State {
        private var groups: [HoverEffectContext.Group]
        fileprivate var leafContext: HoverEffectContext.Properties
        
        init() {
            self.groups = []
            self.leafContext = HoverEffectContext.Properties()
        }
    }
    
    struct GroupProperties {
        private var isDisabled: Bool
//        private var activationBehavior: HoverEffectActivationBehaviorInfo?
//        private var allowedTouchTypes: Set<TouchType>?
//        private var accessibilityOptions: HoverEffectAccessibilityOptions?
        private var sceneIdentifier: String?
    }
}
