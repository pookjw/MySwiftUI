// A4C1D658B3717A3062FEFC91A812D6EB
internal import AttributeGraph
private import Observation
private import _ObservationPrivate

protocol BodyAccessor {
    associatedtype Container
    associatedtype Body
    
    func updateBody(of container: Self.Container, changed: Bool)
}

extension BodyAccessor {
    func makeBody(
        container: _GraphValue<Self.Container>, // x2
        inputs: inout _GraphInputs, // x3
        fields: DynamicPropertyCache.Fields // x4
    ) -> (_GraphValue<Self.Body>, _DynamicPropertyBuffer?) {
        /*
         container = x27
         inputs = x21
         fields = x26
         Self = x23
         */
        
        guard Self.Body.self != Never.self else {
            fatalError("\(type(of: self)) may not have Body == Never")
        }
        
        return unsafe withUnsafePointer(to: inputs) { pointer -> (_GraphValue<Self.Body>, _DynamicPropertyBuffer?) in
            let flags: any RuleThreadFlags.Type
            if unsafe fields.behaviors.contains(.allowsAsync) {
                flags = AsyncThreadFlags.self
            } else {
                flags = MainThreadFlags.self
            }
            
            func project<T: RuleThreadFlags>(flags: T.Type) -> (_GraphValue<Self.Body>, _DynamicPropertyBuffer?) {
                var buffer = unsafe _DynamicPropertyBuffer(fields: fields, container: container, inputs: &inputs)
                if buffer.isEmpty {
                    buffer.destroy()
                    let rule = StaticBody<Self, T>(accessor: self, container: container.value)
                    let graph = _GraphValue<Self.Body>(Attribute(rule))
                    return (graph, buffer)
                } else {
                    let rule = unsafe DynamicBody<Self, T>(accessor: self, _container: container.value, phase: pointer.pointee.phase, links: buffer, resetSeed: 0)
                    let graph = _GraphValue<Self.Body>(Attribute(rule))
                    return (graph, buffer)
                }
            }
            
            return _openExistential(flags, do: project)
        }
    }
    
    func setBody(_ body: () -> Self.Body) {
        let body = traceRuleBody(type(of: self), body: body)
        
        unsafe withUnsafePointer(to: body) { pointer in
            unsafe Graph.setOutputValue(pointer)
        }
    }
}

protocol BodyAccessorRule {
    static var container: Any.Type { get }
    static func value<T>(as: T.Type, attribute: AnyAttribute) -> T?
    static func buffer<T>(as: T.Type, attribute: AnyAttribute) -> _DynamicPropertyBuffer?
    static func metaProperties<T>(as: T.Type, attribute: AnyAttribute) -> [(String, AnyAttribute)]
}

fileprivate struct MainThreadFlags: RuleThreadFlags {
    static var flags: AnyAttribute.Flags {
        return .unknown3
    }
}

fileprivate struct AsyncThreadFlags: RuleThreadFlags {
    static var flags: AnyAttribute.Flags {
        return .unknown5
    }
}

fileprivate protocol RuleThreadFlags {
    static var flags: AnyAttribute.Flags { get }
}

fileprivate struct EmbeddedDynamicPropertyBox<T: DynamicProperty>: DynamicPropertyBox {
    func update(property: inout T, phase: _GraphInputs.Phase) -> Bool {
        fatalError("TODO")
    }
}

fileprivate struct StaticBody<T: BodyAccessor, U: RuleThreadFlags>: CustomStringConvertible, BodyAccessorRule, StatefulRule {
    typealias Value = T.Body
    
    var description: String {
        fatalError("TODO")
    }
    
    private let accessor: T
    private var _container: Attribute<T.Container>
    
    init(accessor: T, container: Attribute<T.Container>) {
        self.accessor = accessor
        self._container = container
    }
    
    var container: T.Container {
        return _container.value
    }
    
    func updateValue() {
        // self = sp + 0x80
        let observationCenter = ObservationCenter.current
        let currentAttribute = Attribute<T.Body>(identifier: .current!)
        
        observationCenter._withObservation(attribute: currentAttribute) {
            // $s7SwiftUI10StaticBody33_A4C1D658B3717A3062FEFC91A812D6EBLLV11updateValueyyFyyXEfU_
            accessor.updateBody(of: container, changed: true)
        }
    }
    
    static var container: Any.Type {
        fatalError("TODO")
    }
    
    static func value<Value>(as: Value.Type, attribute: AnyAttribute) -> Value? {
        fatalError("TODO")
    }
    
    static func buffer<V>(as: V.Type, attribute: AnyAttribute) -> _DynamicPropertyBuffer? {
        fatalError("TODO")
    }
    
    static func metaProperties<V>(as: V.Type, attribute: AnyAttribute) -> [(String, AnyAttribute)] {
        fatalError("TODO")
    }
}

fileprivate struct DynamicBody<T: BodyAccessor, U: RuleThreadFlags>: CustomStringConvertible, ObservedAttribute, BodyAccessorRule, StatefulRule {
    typealias Value = T.Body
    
    let accessor: T
    private(set) var _container: Attribute<T.Container> // 0x34 (offset map)
    @Attribute private(set) var phase: _GraphInputs.Phase // 0x38 (offset map)
    private(set) var links: _DynamicPropertyBuffer // 0x3c (offset map)
    private(set) var resetSeed: UInt32 // 0x40 (offset map)
    
    var container: T.Container {
        return _container.value
    }
    
    var description: String {
        fatalError("TODO")
    }
    
    mutating func destroy() {
        links.destroy()
    }
    
    mutating func updateValue() {
        /*
         self -> x21
         */
        if resetSeed != phase.resetSeed {
            links.reset()
            resetSeed = phase.resetSeed
        }
        
        // <+528>
        // sp, (w20 -> sp + 0xcf)
        var (container, containerChanged) = _container.changedValue(options: [])
        
        let observationCenter = ObservationCenter.current
        let attribute = Attribute<T.Body>(identifier: .current!)
        observationCenter._withObservation(attribute: attribute) {
            // $s7SwiftUI11DynamicBody33_A4C1D658B3717A3062FEFC91A812D6EBLLV11updateValueyyFyyXEfU_
            /*
             containerChanged -> x23
             */
            withUnsafeMutablePointer(to: &container) { pointer in
                // $s7SwiftUI11DynamicBody33_A4C1D658B3717A3062FEFC91A812D6EBLLV11updateValueyyFyyXEfU_ySpy9ContainerQzGXEfU_TA
                let result = self.links.update(container: pointer, phase: self.phase)
                if result {
                    containerChanged = true
                }
            }
            
            if containerChanged {
                containerChanged = true
            } else {
                if self.hasValue {
                    containerChanged = Graph.currentAttributeWasModified
                } else {
                    containerChanged = true
                }
            }
            
            // <+400>
            CustomEventTrace.dynamicBodyUpdate(buffer: self.links, hasValue: self.hasValue, bodyChanged: containerChanged)
            
            // <+800>
            self.accessor.updateBody(of: container, changed: containerChanged)
        }
    }
    
    static var container: Any.Type {
        fatalError("TODO")
    }
    
    static func value<Value>(as: Value.Type, attribute: AnyAttribute) -> Value? {
        fatalError("TODO")
    }
    
    static func buffer<V>(as: V.Type, attribute: AnyAttribute) -> _DynamicPropertyBuffer? {
        fatalError("TODO")
    }
    
    static func metaProperties<V>(as: V.Type, attribute: AnyAttribute) -> [(String, AnyAttribute)] {
        fatalError("TODO")
    }
}
