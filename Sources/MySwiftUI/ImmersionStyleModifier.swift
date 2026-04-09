public import MySwiftUICore
private import AttributeGraph

@available(macOS 26.0, visionOS 1.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension Scene {
    nonisolated public func immersionStyle(
        selection: Binding<any ImmersionStyle>,
        in styles: any ImmersionStyle...
    ) -> some Scene {
        var resolved: [_ResolvedImmersionStyle] = []
        for style in styles {
            resolved.append(style._resolved())
        }
        
        // <+572>
        return self
            .modifier(ImmersionStyleModifier(selection: selection, styles: styles))
            .immersiveSpaceTransition(trigger: selection.wrappedValue._resolved())
            .environment(\.allowedImmersionStyles, resolved)
            .environment(\._allowedImmersionStyles, resolved)
    }
}

struct ImmersionStyleModifier : PrimitiveSceneModifier, _GraphInputsModifier {
    fileprivate private(set) var selection: Binding<any ImmersionStyle>
    fileprivate private(set) var styles: [any ImmersionStyle]
    
    static func _makeInputs(modifier: _GraphValue<ImmersionStyleModifier>, inputs: inout _GraphInputs) {
        let observation = ImmersionStyleChangeObservation(
            seed: 0,
            modifier: modifier.value,
            transaction: inputs.transaction
        )
        
        let observationAttribute = Attribute(observation)
        observationAttribute.flags.formUnion(.transactional)
        
        // <+228>
        inputs[SceneUpdateTransitionAnimationInput.self] = OptionalAttribute(observationAttribute)
        
        // <+260>
        inputs[ImmersionStyleSelectionInput.self] = OptionalAttribute(modifier.value[keyPath: \.selection])
        
        // <+320>
        inputs[AllowedImmersionStylesInput.self] = OptionalAttribute(modifier.value[keyPath: \.styles])
    }
}

fileprivate struct ImmersionStyleChangeObservation : StatefulRule {
    private(set) var seed: UInt // 0x0
    private(set) var previousImmersionStyle: ImmersionStyle? // 0x8
    @Attribute private(set) var modifier: ImmersionStyleModifier // 0x30
    @Attribute private(set) var transaction: Transaction // 0x34
    
    typealias Value = ImmersiveSpaceSceneUpdateTransition
    
    mutating func updateValue() {
        // self -> x20 -> x19
        // sp + 0x60
        let modifier = self.modifier
        // x29 - 0x70
        let selection = modifier.selection.wrappedValue
        
        let style: ImmersiveSpaceSceneUpdateTransition.Style
        if let previousImmersionStyle /* sp + 0x60 */ {
            // <+124>
            // sp + 0x38
            let copy_1 = previousImmersionStyle
            // sp + 0x60
            let prevResolved = copy_1._resolved()
            // sp + 0x8
            let newResolved = selection._resolved()
            
            if prevResolved.initialImmersionLevel == newResolved.initialImmersionLevel {
                // <+248>
                // <+268>
                style = .animated(nil)
            } else {
                // <+276>
                let transaction = Graph.withoutUpdate { 
                    return self.transaction
                }
                
                if transaction.disablesAnimations {
                    style = .notAnimated
                } else {
                    style = .animated(transaction.animation)
                }
            }
        } else {
            // <+260>
            style = .animated(nil)
        }
        
        var seed = self.seed
        self.value = ImmersiveSpaceSceneUpdateTransition(style: style, seed: seed)
        self.seed = seed &+ 1
    }
}
