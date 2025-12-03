// A4C1D658B3717A3062FEFC91A812D6EB
internal import AttributeGraph

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
            var message = _typeName(Self.self, qualified: false)
            message.append(" may not have Body == Never")
            fatalError(message)
        }
        
        let value = _GraphValue<Self.Body>(Attribute(identifier: container.value.identifier))
        let buffer: _DynamicPropertyBuffer?
        fatalError("TODO")
        return (value, buffer)
    }
    
    func setBody(_ body: () -> Self.Body) {
        fatalError("TODO")
    }
}

protocol BodyAccessorRule {
    static var container: Any.Type { get }
    static func value<T>(as: T.Type, attribute: AnyAttribute) -> T?
    static func buffer<T>(as: T.Type, attribute: AnyAttribute) -> _DynamicPropertyBuffer?
    static func metaProperties<T>(as: T.Type, attribute: AnyAttribute) -> [(String, AnyAttribute)]
}

fileprivate struct MainThreadFlags: RuleThreadFlags {
}

fileprivate struct AsyncThreadFlags: RuleThreadFlags {
}

fileprivate protocol RuleThreadFlags {
}

fileprivate struct EmbeddedDynamicPropertyBox<T: DynamicProperty>: DynamicPropertyBox {
    func update(property: inout T, phase: _GraphInputs.Phase) -> Bool {
        fatalError("TODO")
    }
}

fileprivate struct StaticBody<T, U> {
    private let accessor: T
    //      var _container: 14AttributeGraph0A0Vy9Container7SwiftUI12BodyAccessorQzG
}

fileprivate struct DynamicBody<T, U> {
    let accessor: T
//    var _container: 14AttributeGraph0A0Vy9Container7SwiftUI12BodyAccessorQzG
    @Attribute private var phase: _GraphInputs.Phase
    private var links: _DynamicPropertyBuffer
    private var resetSeed: UInt32
}
