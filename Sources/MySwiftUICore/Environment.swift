// 24E0E088473ED74681D096110CC5FC9A
public import os.log
public import Observation
private import AttributeGraph

@frozen @propertyWrapper public struct Environment<Value>: DynamicProperty {
    @usableFromInline
    @frozen internal enum Content: @unchecked Sendable {
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
                    os_log(.fault, log: Log.runtimeIssuesLog, """
                    Accessing Environment<\(Value.self)>'s value outside of \
                    being installed on a View. \
                    This will always read the default value \
                    and will not update.
                    """)
                } else {
                    os_log(.fault, log: Log.runtimeIssuesLog, """
                    Accessing Environment's value outside of being \
                    installed on a View. \
                    This will always read the default value \
                    and will not update.
                    """)
                }
                
                os_log(.fault, log: Log.runtimeIssuesLog, """
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
        fatalError("TODO")
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
            let box = FullEnvironmentBox<Value>(
                environment: inputs.environment,
                keyPath: nil,
                value: nil,
                tracker: PropertyList.Tracker()
            )
            
            buffer.append(box, fieldOffset: fieldOffset)
        }
    }
    
    public init(_ objectType: Value.Type) where Value : AnyObject, Value : Observable {
        fatalError("TODO")
    }
    
    public init<T>(_ objectType: T.Type) where Value == T?, T : AnyObject, T : Observable {
        fatalError("TODO")
    }
}

extension Environment: Sendable where Value: Sendable {
}

fileprivate struct FullEnvironmentBox<Value>: DynamicPropertyBox {
    @Attribute private(set) var environment: EnvironmentValues
    private(set) var keyPath: KeyPath<EnvironmentValues, Value>?
    private(set) var value: EnvironmentValues?
    private(set) var tracker: PropertyList.Tracker
    
    func destroy() {
        fatalError("TODO")
    }
    
    func reset() {
        fatalError("TODO")
    }
    
    mutating func update(property: inout Environment<Value>, phase: _GraphInputs.Phase) -> Bool {
        fatalError("TODO")
    }
    
    func getState<T>(type: T.Type) -> Binding<T>? {
        fatalError("TODO")
    }
}

fileprivate struct EnvironmentBox<Value>: DynamicPropertyBox {
    @Attribute private(set) var environment: EnvironmentValues
    private(set) var keyPath: KeyPath<EnvironmentValues, Value>?
    private(set) var value: Value?
    private(set) var hadObservation: Bool
    
    func destroy() {
        // nop
    }
    
    func reset() {
        fatalError("TODO")
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
            let resolved = MainActor.assumeIsolated { [unchecked = UncheckedSendable(keyPath)] in
                let value = ObservationCenter.current._withObservationStashed { 
                    // $s7SwiftUI14EnvironmentBox33_24E0E088473ED74681D096110CC5FC9ALLV6update8property5phaseSbAA0C0VyxGz_AA12_GraphInputsV5PhaseVtFxyXEfU_
                    return environment[keyPath: unchecked.value]
                }
                return UncheckedSendable(value)
            }.value
            
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
        fatalError("TODO")
    }
}
