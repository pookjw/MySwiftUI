// DB20D13822F3237D192A89B71B0DBAEA
internal import FeatureFlags

package struct Solarium: ViewInputPredicate {
    package static func evaluate(inputs: _GraphInputs) -> Bool {
        assertUnimplemented()
    }
    
    package static func isEnabled(for idiom: AnyInterfaceIdiom) -> Bool {
        assertUnimplemented()
    }
}

extension Solarium {
    enum EnablementIdiom: Hashable {
        case iOS
        case macOS
        case tvOS
        case watchOS
    }
    
    enum EnablementLevel: Hashable {
        case disabled
        case compatibility
        case enabled
    }
    
    struct EnablementCriteria: OptionSet {
        let rawValue: Int
    }
    
    struct AllowedInCompatibilityKey: ViewInputBoolFlag {
        
    }
    
    struct SolariumMetrics: ViewInputPredicate {
        static func evaluate(inputs: _GraphInputs) -> Bool {
            assertUnimplemented()
        }
    }
    
    fileprivate struct TVFeatureFlagKey: FeatureFlagsKey {
        let domain: StaticString // TODO
        let feature: StaticString // TODO
    }
    
    struct FeatureFlagKey: FeatureFlagsKey {
        let domain: StaticString // TODO
        let feature: StaticString
    } // TODO
}
