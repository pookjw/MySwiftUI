// 93C51C71D9D4CBAB391E78A2AAC640D6
public import MySwiftUICore
private import AttributeGraph

@frozen public struct EquatableView<Content> : View where Content : Equatable, Content : View {
    @safe public nonisolated(unsafe) var content: Content
    
    @inlinable public nonisolated init(content: Content) {
        self.content = content
    }
    
    nonisolated public static func _makeView(view: _GraphValue<EquatableView<Content>>, inputs: _ViewInputs) -> _ViewOutputs {
        let view = EquatableView.Child(view: view.value)
        return Content.makeDebuggableView(view: _GraphValue(view), inputs: inputs)
    }
    
    public typealias Body = Never
}

@available(*, unavailable)
extension EquatableView : Sendable {
}

extension View where Self : Equatable {
    @inlinable nonisolated public func equatable() -> EquatableView<Self> {
        return EquatableView(content: self)
    }
}

extension EquatableView : UnaryView, PrimitiveView {}

extension EquatableView {
    fileprivate struct Child : AsyncAttribute, Rule {
        static var comparisonMode: AGComparisonMode {
            return .unknown3
        }
        
        @Attribute private(set) var view: EquatableView<Content>
        
        var value: Content {
            return self.view.content
        }
    }
}
