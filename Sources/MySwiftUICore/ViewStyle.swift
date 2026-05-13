// AC59074524C298808AAD87A4737AEFFC
private import AttributeGraph
private import CoreGraphics

package protocol StyleableView : View {
    associatedtype Configuration
    associatedtype DefaultStyleModifier : StyleModifier
    
    var configuration: Self.Configuration {
        get
    }
    
    static var defaultStyleModifier: Self.DefaultStyleModifier {
        get
    }
    
    static var isScrapeable: Bool {
        get
    }
    
    var scrapeableContent: ScrapeableContent.Content? {
        get
    }
}

extension StyleableView {
    package static var isScrapeable: Bool {
        return false
    }
    
    package var scrapeableContent: ScrapeableContent.Content? {
        assertUnimplemented()
    }
    
    package var body: some View {
        assertUnimplemented()
    }
    
    nonisolated package static func _makeView(view: _GraphValue<Self>, inputs: _ViewInputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    nonisolated package static func _makeViewList(view: _GraphValue<Self>, inputs: _ViewListInputs) -> _ViewListOutputs {
        /*
         view -> x0 -> w25
         */
        // x29 - 0xe0
        var copy_1 = inputs
        let viewType = copy_1.base[StyleableViewContextInput.self]
        
        if Self.self == viewType {
            // <+212>
            let pop = copy_1.base.popLast(StyleInput<Self.Configuration>.self)
            if let pop {
                // <+320>
                let casted = pop._type as! any AnyStyleModifierType.Type
                return casted.makeViewList(
                    view: view,
                    modifier: pop,
                    inputs: copy_1
                )
            } else {
                // <+596>
                let rep = MakeDefaultRepresentation(view: view.value)
                let repValue = _GraphValue(rep)
                return ModifiedContent<Self, Self.DefaultStyleModifier>.makeDebuggableViewList(view: repValue, inputs: copy_1)
            }
        } else {
            // <+104>
            copy_1.base[StyleableViewContextInput.self] = Self.self
            
            if Self.isScrapeable && !copy_1.options.contains(.sectionsConcatenateFooter) && copy_1.options.contains(.resetHeaderStyleContext) {
                // <+168>
                let parentID = copy_1.scrapeableParentID ?? .none
                let localID = ScrapeableID()
                copy_1.scrapeableParentID = localID
                
                let rep = MakeScrapeableResolvedRepresentation(
                    view: view.value,
                    position: OptionalAttribute(),
                    size: OptionalAttribute(),
                    transform: OptionalAttribute(),
                    localID: localID,
                    parentID: parentID
                )
                
                let repAttribute = Attribute(rep)
                repAttribute.flags = .scrapeable
                let repValue = _GraphValue(repAttribute)
                return Self.Body.makeDebuggableViewList(view: repValue, inputs: copy_1)
            } else {
                // <+372>
                let rep = MakeResolvedRepresentation(view: view.value)
                let repValue = _GraphValue(rep)
                return Self.Body.makeDebuggableViewList(view: repValue, inputs: copy_1)
            }
        }
    }
    
    nonisolated package static func _viewListCount(inputs: _ViewListCountInputs) -> Int? {
        assertUnimplemented()
    }
}

fileprivate struct StyleableViewContextInput : ViewInput {
    static var defaultValue: (any StyleableView.Type)? {
        return nil
    }
}

extension _ViewListCountInputs {
    fileprivate mutating func setCurrentStyleableView<T : StyleableView>(_: T.Type) {
        self.customInputs[StyleableViewContextInput.self] = T.self
    }
}

fileprivate struct MakeResolvedRepresentation<T : View> : Rule {
    @Attribute private(set) var view: T
    
    var value: T.Body {
        assertUnimplemented()
    }
}

fileprivate struct MakeScrapeableResolvedRepresentation<T : View> : Rule, ScrapeableAttribute {
    @Attribute private(set) var view: T
    @OptionalAttribute var position: CGPoint?
    @OptionalAttribute var size: ViewSize?
    @OptionalAttribute var transform: ViewTransform?
    let localID: ScrapeableID
    let parentID: ScrapeableID
    
    static func scrapeContent(from attribute: AnyAttribute) -> ScrapeableContent.Item? {
        assertUnimplemented()
    }
    
    var value: T.Body {
        assertUnimplemented()
    }
}

fileprivate struct StyleInput<T> : ViewInput {
    static var defaultValue: Stack<AnyStyleModifier> {
        return Stack()
    }
}

fileprivate struct AnyStyleModifier : GraphReusable {
    private(set) var value: AnyAttribute
    let _type: Any.Type
    
    func makeReusable(indirectMap: IndirectAttributeMap) {
        assertUnimplemented()
    }
    
    func tryToReuse(by: Self, indirectMap: IndirectAttributeMap, testOnly: Bool) -> Bool {
        assertUnimplemented()
    }
}

fileprivate protocol AnyStyleModifierType {
    static func makeView<T : StyleableView>(view: _GraphValue<T>, modifier: AnyStyleModifier, inputs: _ViewInputs) -> _ViewOutputs
    static func makeViewList<T : StyleableView>(view: _GraphValue<T>, modifier: AnyStyleModifier, inputs: _ViewListInputs) -> _ViewListOutputs
    static func viewListCount(inputs: _ViewListCountInputs) -> Int?
}

fileprivate struct StyleModifierType<T : StyleModifier> : AnyStyleModifierType {
    static func makeView<U : StyleableView>(view: _GraphValue<U>, modifier: AnyStyleModifier, inputs: _ViewInputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    static func makeViewList<U : StyleableView>(view: _GraphValue<U>, modifier: AnyStyleModifier, inputs: _ViewListInputs) -> _ViewListOutputs {
        /*
         view -> x0 -> w27
         modifier x1/w2 -> sp + 0x34 / sp + 0x38
         inputs -> x3 -> x19
         */
        // x23/x23/w26/w20
        let fields = DynamicPropertyCache.fields(of: T.Style.self)
        // sp + 0x88
        var copy_1 = inputs
        
        let (_body, buffer) = Self.makeStyleBody(view: view, modifier: modifier, inputs: &copy_1.base, fields: fields)
        let outputs = T.StyleBody.makeDebuggableViewList(view: _body, inputs: copy_1)
        
        if let buffer {
            buffer.traceMountedProperties(to: view, fields: fields)
        }
        
        return outputs
    }
    
    static func viewListCount(inputs: _ViewListCountInputs) -> Int? {
        assertUnimplemented()
    }
    
    static func makeStyleBody<U : StyleableView>(view: _GraphValue<U>, modifier: AnyStyleModifier, inputs: inout _GraphInputs, fields: DynamicPropertyCache.Fields) -> (_GraphValue<T.StyleBody>, _DynamicPropertyBuffer?) {
        if isLinkedOnOrAfter(.v2_3) {
            // <+188>
            let kind = MetadataKind(TypeID(Self.self))
            
            switch kind {
            case .struct, .enum, .optional, .tuple:
                break
            default:
                var message = "styles must be value types (either a struct or an enum); "
                message.append(_typeName(Self.self, qualified: false))
                fatalError(message)
            }
        }
        
        // <+240>
        let styleModifier = Attribute<T>(identifier: modifier.value)
        let container = _GraphValue<T.Style>(
            styleModifier[offset: { modifier in
                return .of(&modifier.style)
            }]
        )
        
        let accessor = StyleBodyAccessor<U, T>(view: view.value, styleModifier: styleModifier)
        return accessor.makeBody(container: view, inputs: &inputs, fields: fields)
    }
}

fileprivate struct MakeDefaultRepresentation<T : StyleableView> : Rule {
    @Attribute private(set) var view: T
    
    var value: ModifiedContent<T, T.DefaultStyleModifier> {
        assertUnimplemented()
    }
}

package protocol StyleModifier : MultiViewModifier, PrimitiveViewModifier {
    associatedtype Style
    associatedtype StyleConfiguration
    associatedtype StyleBody : View
    
    var style: Self.Style { get set }
    init(style: Self.Style)
    @ViewBuilder func styleBody(configuration: Self.StyleConfiguration) -> Self.StyleBody
}

extension StyleModifier {
    nonisolated package static func _makeViewList(modifier: _GraphValue<Self>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        /*
         modifier -> x0 -> w26
         */
        // sp + 0x18
        var copy_1 = inputs
        // sp + 0x8
        let styleInput = copy_1[StyleOverrideInput<Self.Style>.self] ?? AnyStyleModifier(value: modifier.value.identifier, _type: StyleModifierType<Self>.self)
        // <+172>
        copy_1.base.append(styleInput, to: StyleInput<Self.StyleConfiguration>.self)
        return body(_Graph(), copy_1)
    }
    
    nonisolated package static func _viewListCount(inputs: _ViewListCountInputs, body: (_ViewListCountInputs) -> Int?) -> Int? {
        assertUnimplemented()
    }
    
    nonisolated package static func _makeView(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }
}

fileprivate struct StyleOverrideInput<T> : ViewInput {
    static var defaultValue: AnyStyleModifier? {
        return nil
    }
}

fileprivate struct StyleBodyAccessor<T : StyleableView, U : StyleModifier> : BodyAccessor {
    typealias Container = T
    typealias Body = U.StyleBody
    
    @Attribute private(set) var view: T
    @Attribute private(set) var styleModifier: U
    
    func updateBody(of container: T, changed: Bool) {
        assertUnimplemented()
    }
}
