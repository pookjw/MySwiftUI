// 24E0E088473ED74681D096110CC5FC9A
public import os.log
public import Observation
private import AttributeGraph

@frozen @propertyWrapper public struct Environment<Value> : DynamicProperty {
    @usableFromInline
    @frozen internal enum Content : @unchecked Sendable {
        case keyPath(KeyPath<EnvironmentValues, Value>)
        case value(Value)
    }
    
    @usableFromInline
    internal var content: Environment<Value>.Content
    
    @inlinable public init(_ keyPath: KeyPath<EnvironmentValues, Value>) {
        content = .keyPath(keyPath)
    }
    
    @inlinable public var wrappedValue: Value {
        get {
            switch content {
            case let .value(value):
                return value
            case let .keyPath(keyPath):
                if #available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *) {
                    unsafe os_log(.fault, log: Log.runtimeIssuesLog, """
                    Accessing Environment<\(Value.self)>'s value outside of \
                    being installed on a View. \
                    This will always read the default value \
                    and will not update.
                    """)
                } else {
                    unsafe os_log(.fault, log: Log.runtimeIssuesLog, """
                    Accessing Environment's value outside of being \
                    installed on a View. \
                    This will always read the default value \
                    and will not update.
                    """)
                }
                
                unsafe os_log(.fault, log: Log.runtimeIssuesLog, """
                Accessing Environment's value outside of being \
                installed on a View. \
                This will always read the default value \
                and will not update.
                """)
                
                return EnvironmentValues()[keyPath: keyPath]
            }
        }
    }
    
    @usableFromInline
    internal func error() -> Never {
        assertUnimplemented()
    }
    
    public static func _makeProperty<V>(in buffer: inout _DynamicPropertyBuffer, container: _GraphValue<V>, fieldOffset: Int, inputs: inout _GraphInputs) {
        if Value.self != EnvironmentValues.self {
            // <+124>
            let box = EnvironmentBox<Value>(
                environment: inputs.environment,
                keyPath: nil,
                value: nil,
                hadObservation: false
            )
            
            buffer.append(box, fieldOffset: fieldOffset)
        } else {
            // <+248>
            let box = FullEnvironmentBox(
                environment: inputs.environment,
                keyPath: nil,
                value: nil,
                tracker: PropertyList.Tracker()
            )
            
            buffer.append(box, fieldOffset: fieldOffset)
        }
    }
    
    public init(_ objectType: Value.Type) where Value : AnyObject, Value : Observable {
        let key = EnvironmentObjectKey<Value>()
        self.init(\EnvironmentValues[forceUnwrapping: key])
    }
    
    public init<T>(_ objectType: T.Type) where Value == T?, T : AnyObject, T : Observable {
        assertUnimplemented()
    }
}

extension Environment : Sendable where Value : Sendable {
}

fileprivate struct FullEnvironmentBox : DynamicPropertyBox {
    @Attribute private(set) var environment: EnvironmentValues // 0x0
    private(set) var keyPath: KeyPath<EnvironmentValues, EnvironmentValues>? // 0x8
    private(set) var value: EnvironmentValues? // 0x10
    private(set) var tracker: PropertyList.Tracker // 0x20
    
    func destroy() {
        assertUnimplemented()
    }
    
    func reset() {
        assertUnimplemented()
    }
    
    mutating func update(property: inout Environment<EnvironmentValues>, phase: _GraphInputs.Phase) -> Bool {
        // x23
        guard case .keyPath(let incomingKeyPath) = property.content else {
            return false
        }
        
        /*
         self -> x20 -> x24
         property -> x0 -> x19
         */
        // sp + 0x18 / sp + 0x28
        let (env, envChanged) = self.$environment.changedValue(options: [])
        
        // x26 -> sp
        let keyPath = self.keyPath
        // incomingKeyPath -> x23 -> sp + 0x8
        
        // true -> <+336> / false -> <+532>
        let flag: Bool
        var updated: Bool!
        
        if let keyPath {
            if incomingKeyPath == keyPath {
                // <+232>
                if envChanged {
                    // <+336>
                    flag = true
                } else {
                    // <+532>
                    updated = false
                    flag = false
                }
            } else {
                // <+316>
                self.keyPath = incomingKeyPath
                // <+336>
                flag = true
            }
        } else {
            // <+260>
            // <+320>
            self.keyPath = incomingKeyPath
            // <+336>
            flag = true
        }
        
        if flag {
            // <+336>
            // sp + 0x8
            let resolved = env[keyPath: incomingKeyPath]
            
            // true -> <+384> / false -> <+508>
            let flag: Bool
            if self.value != nil {
                if self.tracker.hasDifferentUsedValues(env.plist) {
                    // <+384>
                    flag = true
                } else {
                    // <+508>
                    flag = false
                }
            } else {
                // <+384>
                flag = true
            }
            
            if flag {
                // <+384>
                self.tracker.reset()
                // <+408>
                self.value = EnvironmentValues(resolved.plist, tracker: self.tracker)
                updated = true
            } else {
                // <+508>
                updated = false
            }
            
            // <+532>
        }
        
        // <+532>
        property.content = .value(self.value!)
        return updated
    }
    
    func getState<T>(type: T.Type) -> Binding<T>? {
        assertUnimplemented()
    }
}

fileprivate struct EnvironmentBox<Value> : DynamicPropertyBox {
    @Attribute private(set) var environment: EnvironmentValues
    private(set) var keyPath: KeyPath<EnvironmentValues, Value>?
    private(set) var value: Value?
    private(set) var hadObservation: Bool
    
    func destroy() {
        // nop
    }
    
    func reset() {
        assertUnimplemented()
    }
    
    mutating func update(property: inout Environment<Value>, phase: _GraphInputs.Phase) -> Bool {
        /*
         self -> sp + 0x1a8
         property -> x19
         */
        // <+680>
        // x21
        let copy_1 = property
        
        switch copy_1.content {
        case .keyPath(let keyPath):
            // <+740>
            /*
             property -> sp + 0x110
             keyPath -> x25
             self -> x19
             */
            // (sp + 0x1f8, x27)
            let (environment, changed) = $environment.changedValue(options: [])
            // sp + 0x208
            var updated = changed
            // x23
            let ownKeyPath = self.keyPath
            /*
             keyPath -> sp + 0x1d8 -> sp + 0xf8
             */
            if let ownKeyPath {
                // <+840>
                // ownKeyPath -> sp + 0x1c0
                // w20
                if keyPath != ownKeyPath {
                    // <+1028>
                    updated = true
                } else {
                    // <+940>
                    if changed {
                        // <+1056>
                    } else {
                        // <+956>
                        if hadObservation {
                            // <+1056>
                        } else {
                            // <+976>
                            // <+2284>
                            // x20
                            property.content = .value(value!)
                            return updated
                        }
                    }
                }
            } else {
                // <+1000>
                updated = true
            }
            
            // <+1056>
            // (sp + 0x1b8, w19)
            let resolved = ObservationCenter.current._withObservationStashed { 
                // $s7SwiftUI14EnvironmentBox33_24E0E088473ED74681D096110CC5FC9ALLV6update8property5phaseSbAA0C0VyxGz_AA12_GraphInputsV5PhaseVtFxyXEfU_
                return environment[keyPath: keyPath]
            }
            
            // <+1820>
            // x20
            let copy_1 = resolved.value
            // sp + 0x20 (x27)
            let copy_2 = copy_1
            self.hadObservation = resolved.accessOccurred
            
            // <+1916>
            let isEqual: Bool
            // x24
            if let oldValue = self.value {
                // <+1988>
                isEqual = compareValues(oldValue, copy_2, options: [.unknown0, .unknown1])
            } else {
                // <+2204>
                isEqual = false
            }
            
            if !isEqual {
                // <+2204>
                self.value = copy_2
            }
            
            // <+2280>
            property.content = .value(self.value!)
            return updated
        case .value(_):
            // <+716>
            return false
        }
    }
    
    func getState<T>(type: T.Type) -> Binding<T>? {
        assertUnimplemented()
    }
}
