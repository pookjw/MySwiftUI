private import AttributeGraph

@frozen public struct ModifiedContent<Content, Modifier> {
    public typealias Body = Never
    
    public var content: Content
    public var modifier: Modifier
    
    @inlinable public nonisolated init(content: Content, modifier: Modifier) {
        self.content = content
        self.modifier = modifier
    }
}

extension ModifiedContent: Equatable where Content: Equatable, Modifier: Equatable {
}

extension ModifiedContent: Sendable where Content: Sendable, Modifier: Sendable {
}

extension ModifiedContent: Animatable where Content: Animatable, Modifier: Animatable {
    public var animatableData: AnimatablePair<Content.AnimatableData, Modifier.AnimatableData> {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
}

extension ModifiedContent: View where Content: View, Modifier: ViewModifier {
    public static nonisolated func _makeView(view: _GraphValue<ModifiedContent<Content, Modifier>>, inputs: _ViewInputs) -> _ViewOutputs {
        let modifier: _GraphValue<Modifier> = view[{ value in
            return PointerOffset<Self, Modifier>.of(&value.modifier)
        }]
        
        let result = Modifier.makeDebuggableView(modifier: modifier, inputs: inputs) { [view = UncheckedSendable(view)] graph, inputs in
            // $s7SwiftUI15ModifiedContentVA2A4ViewRzAA0E8ModifierR_rlE05_makeE04view6inputsAA01_E7OutputsVAA11_GraphValueVyACyxq_GG_AA01_E6InputsVtFZAjA01_K0V_APtcfU0_TA
            let view: _GraphValue<Content> = view.value[{ value in
                return PointerOffset<Self, Content>.of(&value.content)
            }]
            
            return Content.makeDebuggableView(view: view, inputs: inputs)
        }
        
        return result
    }
    
    public static nonisolated func _makeViewList(view: _GraphValue<ModifiedContent<Content, Modifier>>, inputs: _ViewListInputs) -> _ViewListOutputs {
        let modifier: _GraphValue<Modifier> = view[{ value in
            return PointerOffset<Self, Modifier>.of(&value.modifier)
        }]
        
        return Modifier.makeDebuggableViewList(modifier: modifier, inputs: inputs) { graph, inputs in
            // $s7SwiftUI15ModifiedContentVA2A4ViewRzAA0E8ModifierR_rlE05_makeE4List4view6inputsAA01_eH7OutputsVAA11_GraphValueVyACyxq_GG_AA01_eH6InputsVtFZAjA01_L0V_APtcfU0_TA
            let view: _GraphValue<Content> = view[{ value in
                return PointerOffset<Self, Content>.of(&value.content)
            }]
            
            return Content.makeDebuggableViewList(view: view, inputs: inputs)
        }
    }
    
    public static nonisolated func _viewListCount(inputs: _ViewListCountInputs) -> Int? {
        fatalError("TODO")
    }
    
    @MainActor @preconcurrency public var body: ModifiedContent<Content, Modifier>.Body {
        fatalError("TODO")
    }
}

extension ModifiedContent: ViewModifier where Content: ViewModifier, Modifier: ViewModifier {
    public static nonisolated func _makeView(modifier: _GraphValue<ModifiedContent<Content, Modifier>>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        fatalError("TODO")
    }
    
    public static nonisolated func _makeViewList(modifier: _GraphValue<ModifiedContent<Content, Modifier>>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        fatalError("TODO")
    }
    
    public static nonisolated func _viewListCount(inputs: _ViewListCountInputs, body: (_ViewListCountInputs) -> Int?) -> Int? {
        fatalError("TODO")
    }
}

extension ModifiedContent: DynamicViewContent where Content: DynamicViewContent, Modifier: ViewModifier {
  public var data: Content.Data {
      fatalError("TODO")
  }
    
  public typealias Data = Content.Data
}

extension ModifiedContent: VisualEffect where Content: VisualEffect, Modifier: VisualEffect {
    public static func _makeVisualEffect(effect: _GraphValue<Self>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        fatalError("TODO")
    }
}

extension ModifiedContent: CustomHoverEffect where Content: CustomHoverEffect, Modifier: CustomHoverEffect {
    public static func _makeCustomHoverEffect(effect: _GraphValue<ModifiedContent<Content, Modifier>>, inputs: _CustomHoverEffectInputs, body: @escaping (_CustomHoverEffectInputs) -> _CustomHoverEffectOutputs) -> _CustomHoverEffectOutputs {
        fatalError("TODO")
    }
}

extension ModifiedContent: HoverEffectContent where Content: HoverEffectContent, Modifier: HoverEffectContent {
    public static func _makeHoverEffectContent(effect: _GraphValue<ModifiedContent<Content, Modifier>>, inputs: _HoverEffectContentInputs, body: @escaping (_HoverEffectContentInputs) -> _HoverEffectContentOutputs) -> _HoverEffectContentOutputs {
        fatalError("TODO")
    }
}

extension ModifiedContent: CustomViewDebugReflectable {
    // TODO
}
