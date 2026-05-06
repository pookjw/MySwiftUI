// AC3F3B54DEA93347066C3491F9AA3DD4
private import AttributeGraph

@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public struct Subview : View, Identifiable {
    private var base: _VariadicView_Children.Element
    
    public struct ID : Hashable {
        public static func == (a: Subview.ID, b: Subview.ID) -> Bool {
            assertUnimplemented()
        }

        public func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }

        public var hashValue: Int {
            assertUnimplemented()
        }
    }
    
    init(_ base: _VariadicView_Children.Element) {
        self.base = base
    }

    public nonisolated var id: Subview.ID { // nonisolated는 원래 없음
        assertUnimplemented()
    }

    public var containerValues: ContainerValues {
        assertUnimplemented()
    }

    nonisolated public static func _makeView(view: _GraphValue<Subview>, inputs: _ViewInputs) -> _ViewOutputs {
        let value = view[{ .of(&$0.base.view )}]
        return _ViewList_View.makeDebuggableView(view: value, inputs: inputs)
    }

    nonisolated public static func _makeViewList(view: _GraphValue<Subview>, inputs: _ViewListInputs) -> _ViewListOutputs {
        var copy = inputs
        let traits = view[{ .of(&$0.base.traits) }]
        let mergeTraits = MergeTraits(overrideTraits: traits.value, baseTraits: OptionalAttribute(copy.$traits))
        copy.$traits = Attribute(mergeTraits)
        return _ViewListOutputs.unaryViewList(view: view, inputs: inputs)
    }

    @available(iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, macOS 15.0, *)
    public typealias Body = Never
}

@available(*, unavailable)
extension Subview : Sendable {}

@available(*, unavailable)
extension Subview.ID : Sendable {}

extension Subview : UnaryView, PrimitiveView {}

fileprivate struct MergeTraits : Rule {
    @Attribute var overrideTraits: ViewTraitCollection
    @OptionalAttribute var baseTraits: ViewTraitCollection?
    
    var value: ViewTraitCollection {
        assertUnimplemented()
    }
}
