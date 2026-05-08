// 47701A835A1B253AFF3923CF965CEFD6
internal import MySwiftUICore
private import AttributeGraph

protocol PubliclyPrimitiveView : PrimitiveView {
    associatedtype InternalBody : View
    
    var internalBody: Self.InternalBody {
        get
    }
}

extension PubliclyPrimitiveView {
    nonisolated public static func _makeView(view: _GraphValue<Self>, inputs: _ViewInputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    nonisolated public static func _makeViewList(view: _GraphValue<Self>, inputs: _ViewListInputs) -> _ViewListOutputs {
        let makeBody = MakeBody(view: view.value)
        let internalView = _GraphValue(makeBody)
        return Self.InternalBody.makeDebuggableViewList(view: internalView, inputs: inputs)
    }
    
    nonisolated static func defaultMakeView(view: _GraphValue<Self>, inputs: _ViewInputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    nonisolated public static func _viewListCount(inputs: _ViewListCountInputs) -> Int? {
        assertUnimplemented()
    }
    
    nonisolated static func defaultViewListCount(inputs: _ViewListCountInputs) -> Int? {
        assertUnimplemented()
    }
}

fileprivate struct MakeBody<Content : PubliclyPrimitiveView> : Rule {
    @Attribute private(set) var view: Content
    
    static var initialValue: Content.InternalBody? {
        return nil
    }
    
    var value: Content.InternalBody {
        assertUnimplemented()
    }
}
