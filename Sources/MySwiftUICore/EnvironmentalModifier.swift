// A1B6966B83442495FADFE75F475ECBE2
internal import AttributeGraph

public protocol EnvironmentalModifier : ViewModifier where Self.Body == Never {
  associatedtype ResolvedModifier : ViewModifier
  nonisolated func resolve(in environment: EnvironmentValues) -> Self.ResolvedModifier
  nonisolated static var _requiresMainThread: Bool { get }
  nonisolated static var _tracksEnvironmentDependencies: Bool { get }
}

extension EnvironmentalModifier {
    public nonisolated static func _makeView(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        /*
         modifier -> x0 -> w22
         inputs -> x1 -> x25
         body -> x2/x3 -> sp + 0x20
         */
        // x19 + 0x180 (sp + 0x220)
        let copy_1 = inputs
        // x29 - 0xd0 (sp + 0x280)
        let fields = unsafe DynamicPropertyCache.fields(of: Self.self)
        // x19 + 0xc0 (sp + 0x160)
        let copy_2 = unsafe fields
        // x19 + 0x120 (sp + 0x1c0)
        var copy_3 = inputs
        // x29 - 0xd0 (sp + 0x280)
        let _ = copy_1
        
        // sp + 0x100 -> w28 / x29 - 0xd0 (sp + 0x280)
        let (value, buffer) = unsafe self.makeResolvedModifier(
            modifier: modifier,
            inputs: &copy_3.base,
            fields: copy_2
        )
        
        let outputs = Self.ResolvedModifier.makeDebuggableView(modifier: value, inputs: copy_3, body: body)
        
        if let buffer {
            unsafe buffer.traceMountedProperties(to: value, fields: fields)
        }
        
        return outputs
    }
    
    public nonisolated static func _makeViewList(modifier: _GraphValue<Self>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        /*
         modifier -> x0 -> w25
         inputs -> x1 -> x24
         body -> x2/x3 -> sp + 0x20
         */
        // sp + 0x68 -> x22/x21/w19/w26
        let fields = unsafe DynamicPropertyCache.fields(of: Self.self)
        // sp + 0x68
        var copy_1 = inputs
        // sp + 0x38
        let copy_2 = unsafe fields
        
        // sp + 0x24 / sp + 0x50
        let (value, buffer) = unsafe self.makeResolvedModifier(
            modifier: modifier,
            inputs: &copy_1.base,
            fields: copy_2
        )
        
        let outputs = Self.ResolvedModifier.makeDebuggableViewList(
            modifier: value,
            inputs: copy_1,
            body: body
        )
        
        if let buffer {
            unsafe buffer.traceMountedProperties(to: value, fields: fields)
        }
        
        return outputs
    }
    
    public nonisolated static var _requiresMainThread: Bool {
        return true
    }
    
    public nonisolated static var _tracksEnvironmentDependencies: Bool {
        return true
    }
    
    fileprivate nonisolated static func makeResolvedModifier(
        modifier: _GraphValue<Self>,
        inputs: inout _GraphInputs,
        fields: DynamicPropertyCache.Fields
    ) -> (_GraphValue<ResolvedModifier>, _DynamicPropertyBuffer?) {
        /*
         return pointer -> x0/x1 -> x23/x22
         modifier -> x2 -> w27
         inputs -> x3 -> x21
         fields -> x4 -> x26/x25/w20/w28
         */
        let kind = MetadataKind(TypeID(Self.self))
        
        switch kind {
        case .struct, .enum, .optional, .tuple:
            // sp + 0x68
            var copy_1 = unsafe fields
            
            if unsafe copy_1.behaviors.contains(.requiresMainThread) {
                // <+284>
            } else {
                if isLinkedOnOrAfter(.v4) {
                    // <+528>
                    unsafe copy_1.behaviors.formUnion(.requiresMainThread)
                }
            }
            
            // <+300>
            let accessor = EnvironmentalBodyAccessor<Self>(
                environment: inputs.environment,
                tracksDependencies: self._tracksEnvironmentDependencies
            )
            
            return unsafe accessor.makeBody(
                container: modifier,
                inputs: &inputs,
                fields: copy_1
            )
        default:
            var message = "Environmental modifiers must be value types: "
            message.append(_typeName(Self.self, qualified: false))
            fatalError(message)
        }
    }
}

fileprivate struct EnvironmentalBodyAccessor<T : EnvironmentalModifier> : BodyAccessor {
    @Attribute private var environment: EnvironmentValues
    private let tracker: PropertyList.Tracker
    private let tracksDependencies: Bool
    
    init(environment: Attribute<EnvironmentValues>, tracksDependencies: Bool) {
        self.tracker = PropertyList.Tracker()
        self._environment = environment
        self.tracksDependencies = tracksDependencies
    }
    
    typealias Container = T
    typealias Body = T.ResolvedModifier
    
    func updateBody(of container: T, changed: Bool) {
        assertUnimplemented()
    }
}
