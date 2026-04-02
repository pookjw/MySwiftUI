// DB20D13822F3237D192A89B71B0DBAEA
internal import FeatureFlags
private import Synchronization
private import _MySwiftUIShims

package struct Solarium : ViewInputPredicate {
    fileprivate static let cachedValues = Mutex<[Solarium.EnablementIdiom: (Solarium.EnablementLevel, Solarium.EnablementCriteria)]>([:])
    
    package static func evaluate(inputs: _GraphInputs) -> Bool {
        assertUnimplemented()
    }
    
    package static func isEnabled(for idiom: AnyInterfaceIdiom) -> Bool {
        let enablementIdiom = Solarium.EnablementIdiom(idiom)
        return Solarium.isEnabled(enablementIdiom)
    }
    
    package static func isEnabled(_ idiom: Solarium.EnablementIdiom) -> Bool {
        let value = Solarium.computeValues(idiom)
        return value.0 == .enabled
    }
    
    fileprivate static func computeValues(_ idiom: Solarium.EnablementIdiom) -> (Solarium.EnablementLevel, Solarium.EnablementCriteria) {
        return Solarium.cachedValues.withLock { values in
            // $s7SwiftUI8SolariumV13computeValues33_DB20D13822F3237D192A89B71B0DBAEALLyAC15EnablementLevelO_AC0N8CriteriaVtAC0N5IdiomOFZAG_AItSDyAkG_AItGzYuYTXEfU_
            if let existing = values[idiom] {
                return existing
            }
            
            // w20
            let enabled: Bool
            let semantics: Semantics
            if case .tvOS = idiom {
                if isFeatureEnabled(Solarium.FeatureFlagKey()) {
                    enabled = isFeatureEnabled(Solarium.TVFeatureFlagKey())
                } else {
                    enabled = false
                }
                
                // <+444>
                semantics = .v7
            } else {
                enabled = isFeatureEnabled(Solarium.FeatureFlagKey())
                
                if case .watchOS = idiom {
                    // <+412>
                    semantics = .v5
                } else {
                    // <+444>
                    semantics = .v7
                }
            }
            
            // <+468>
            // w0
            let flag: Bool
            if isLinkedOnOrAfter(semantics) {
                flag = true
            } else {
                flag = Solarium.IgnoreSolariumLinkedOnCheckUserDefault.isEnabled
            }
            
            // <+572>
            // w8
            let hardwareSupportsSolarium = Solarium.SolariumHardwareSupport.hardwareSupportsSolarium
            
            var criteria: Solarium.EnablementCriteria = []
            let w25: Solarium.EnablementCriteria
            if flag {
                // <+604>
                criteria = .linkerCheck
                
                if hardwareSupportsSolarium {
                    criteria = [.linkerCheck, .hardwareSupport]
                    
                    if enabled {
                        // <+604>
                        w25 = [.featureFlag, .linkerCheck, .hardwareSupport]
                        criteria = w25
                    } else {
                        // <+704>
                        w25 = [.linkerCheck, .hardwareSupport]
                    }
                } else {
                    // <+660>
                    if enabled {
                        // <+664>
                        w25 = [.featureFlag, .linkerCheck]
                        criteria = w25
                    } else {
                        // <+744>
                        w25 = [.linkerCheck]
                    }
                }
            } else {
                // <+636>
                if hardwareSupportsSolarium {
                    // <+640>
                    criteria = [.hardwareSupport]
                    
                    if enabled {
                        w25 = [.featureFlag, .hardwareSupport]
                        criteria = w25
                    } else {
                        // <+724>
                        w25 = [.hardwareSupport]
                    }
                } else {
                    if enabled {
                        // <+676>
                        w25 = [.featureFlag]
                        criteria = w25
                        // <+684>
                    } else {
                        // <+764>
                        w25 = []
                    }
                }
            }
            
            let w26: Solarium.EnablementLevel
            if (idiom == .watchOS) || isLinkedOnOrAfter(.v8) || Solarium.IgnoreSolariumOptOutUserDefault.isEnabled {
                if w25.contains(.linkerCheck) {
                    if (~w25.rawValue & Solarium.EnablementCriteria.featureFlag.union(.hardwareSupport).rawValue == 0) {
                        // <+884>
                        w26 = .enabled
                    } else {
                        w26 = .disabled
                    }
                    // <+1028>
                } else {
                    // <+976>
                    if (~w25.rawValue & Solarium.EnablementCriteria.featureFlag.union(.hardwareSupport).rawValue == 0) {
                        // <+992>
                        w26 = .compatibility
                    } else {
                        w26 = .disabled
                    }
                    // <+1028>
                }
            } else {
                // <+892>
                let designRequiresCompatibility = infoPlist("UIDesignRequiresCompatibility", default: false)
                var supportsSolarium: Bool!
                
                let flag: Bool // true -> <+976>, false -> <+1000>
                if designRequiresCompatibility {
                    // <+976>
                    flag = true
                } else {
                    // <+940>
                    let _supportsSolarium = infoPlist("SupportsSolarium", default: true)
                    
                    if w25.contains(.linkerCheck) {
                        // <+1000>
                        supportsSolarium = _supportsSolarium
                        flag = false
                    } else {
                        // <+976>
                        flag = true
                    }
                }
                
                if flag {
                    // <+976>
                    if (~w25.rawValue & Solarium.EnablementCriteria.featureFlag.union(.hardwareSupport).rawValue == 0) {
                        // <+992>
                        w26 = .compatibility
                    } else {
                        w26 = .disabled
                    }
                    // <+1028>
                } else {
                    // <+1000>
                    if (~w25.rawValue & Solarium.EnablementCriteria.featureFlag.union(.hardwareSupport).rawValue == 0) {
                        if supportsSolarium {
                            // <+884>
                            w26 = .enabled
                        } else {
                            // <+992>
                            w26 = .compatibility
                        }
                    } else {
                        w26 = .disabled
                    }
                }
            }
            
            // <+1028>
            values[idiom] = (w26, w25)
            return (w26, criteria)
        }
    }
}

extension Solarium {
    package enum EnablementIdiom : Hashable {
        case iOS
        case macOS
        case tvOS
        case watchOS
        
        init(_ idiom: AnyInterfaceIdiom) {
            // idiom -> x0 -> x20/x21
            if AnyInterfaceIdiom(idiom: .mac) == idiom {
                self = .macOS
            } else if AnyInterfaceIdiom(idiom: .touchBar) == idiom {
                self = .macOS
            } else if AnyInterfaceIdiom(idiom: .tv) == idiom {
                self = .tvOS
            } else if AnyInterfaceIdiom(idiom: .watch) == idiom {
                self = .watchOS
            } else {
                self = .iOS
            }
        }
    }
    
    enum EnablementLevel : Hashable {
        case disabled
        case compatibility
        case enabled
    }
    
    struct EnablementCriteria : OptionSet {
        static var featureFlag: Solarium.EnablementCriteria {
            return Solarium.EnablementCriteria(rawValue: 1 << 0)
        }
        
        static var linkerCheck: Solarium.EnablementCriteria {
            return Solarium.EnablementCriteria(rawValue: 1 << 1)
        }
        
        static var hardwareSupport: Solarium.EnablementCriteria {
            return Solarium.EnablementCriteria(rawValue: 1 << 2)
        }
        
        let rawValue: Int
    }
    
    struct AllowedInCompatibilityKey : ViewInputBoolFlag {
        
    }
    
    struct SolariumMetrics : ViewInputPredicate {
        static func evaluate(inputs: _GraphInputs) -> Bool {
            assertUnimplemented()
        }
    }
    
    fileprivate struct TVFeatureFlagKey : FeatureFlagsKey {
        let domain: StaticString = "SwiftUI"
        let feature: StaticString = "SolariumTV"
    }
    
    struct FeatureFlagKey : FeatureFlagsKey {
        let domain: StaticString = "SwiftUI"
        let feature: StaticString = "Solarium"
    }
    
    fileprivate struct IgnoreSolariumLinkedOnCheckUserDefault : UserDefaultKeyedFeature {
        static let key: String = "com.apple.SwiftUI.IgnoreSolariumLinkedOnCheck"
        @safe nonisolated(unsafe) static var cachedValue: Bool?
    }
    
    fileprivate struct IgnoreSolariumHardwareCheckUserDefault : UserDefaultKeyedFeature {
        static let key: String = "com.apple.SwiftUI.IgnoreSolariumHardwareCheck"
        @safe nonisolated(unsafe) static var cachedValue: Bool?
    }
    
    fileprivate struct FailSolariumHardwareCheckUserDefault : UserDefaultKeyedFeature {
        static let key: String = "com.apple.SwiftUI.FailSolariumHardwareCheck"
        @safe nonisolated(unsafe) static var cachedValue: Bool?
    }
    
    fileprivate struct SolariumHardwareSupport {
        static let hardwareSupportsSolarium: Bool = {
            // $s7SwiftUI8SolariumV0C15HardwareSupport33_DB20D13822F3237D192A89B71B0DBAEALLV016hardwareSupportsC0_WZ
            if _SwiftUIIsAppleInternalBuild() && Solarium.IgnoreSolariumHardwareCheckUserDefault.isEnabled {
                return true
            }
            
            if !_SwiftUIIsAppleInternalBuild() {
                return true
            }
            
            return !Solarium.FailSolariumHardwareCheckUserDefault.isEnabled
        }()
    }
    
    fileprivate struct IgnoreSolariumOptOutUserDefault : UserDefaultKeyedFeature {
        static let key: String = "com.apple.SwiftUI.IgnoreSolariumOptOut"
        @safe nonisolated(unsafe) static var cachedValue: Bool?
    }
}

fileprivate func infoPlist(_ key: String, default defaultValue: Bool) -> Bool {
    guard let infoDictionary = Bundle.main.infoDictionary else {
        return defaultValue
    }
    
    return infoDictionary[key] as? Bool ?? defaultValue
}
