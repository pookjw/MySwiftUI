// CE1D93D8ECBBEB5FE2E32E69A123E7CB
private import AttributeGraph

extension View {
    static nonisolated func makeView(view: _GraphValue<Self>, inputs: _ViewInputs) -> _ViewOutputs {
        // x29 = sp + 0x360
        /*
         view = w27
         Self = x21
         */
        // sp + 0x2a0
        let inputs_1 = inputs
        // sp + 0x240 / x24 + x25 + w26 + w28
        let fields = DynamicPropertyCache.fields(of: self.self)
        
        // <+124>
        // sp + 0x240
        var inputs_2 = inputs_1
        // sp + 0x180
        let fields_1 = fields
        // view -> sp + 0xc0
        // sp + 0x1e0
        _ = inputs_1
        
        // <+184>
        let body = makeBody(view: view, inputs: &inputs_2.base, fields: fields_1)
        
        if let buffer = body.1 {
            buffer.traceMountedProperties(to: view, fields: fields_1)
        }
        
        // <+284>
        // inlined
        return Body.makeDebuggableView(view: body.0, inputs: inputs)
    }
}

extension View {
    fileprivate static nonisolated func makeBody(
        view: _GraphValue<Self>, // x2
        inputs: inout _GraphInputs, // x3
        fields: DynamicPropertyCache.Fields // x4
    ) -> (_GraphValue<Self.Body>, _DynamicPropertyBuffer?) {
        /*
         x29 = sp + 0x70
         
         view = x25 / sp + 0x2c
         inputs = x20
         fields = x24 / sp + 0x10
         Self = x19
         */
        let kind = MetadataKind(TypeID(Self.self))
        
        switch kind {
        case .struct, .enum, .optional, .tuple:
            return ViewBodyAccessor<Self>().makeBody(container: view, inputs: &inputs, fields: fields)
        default:
            var message = "views must be value types (either a struct or an enum); "
            message.append(_typeName(Self.self, qualified: false))
            fatalError(message)
        }
    }
}

struct ViewBodyAccessor<Container: View>: BodyAccessor {
    typealias Body = Container.Body
    
    init() {}
    
    func updateBody(of container: Container, changed: Bool) {
        setBody { [unchecked = UncheckedSendable(container)] in
            return MainActor.assumeIsolated { 
                return UncheckedSendable(unchecked.value.body)
            }.value
        }
    }
}
