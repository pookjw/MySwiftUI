// AC59074524C298808AAD87A4737AEFFC
private import AttributeGraph
private import CoreGraphics

package protocol StyleableView : View {
    associatedtype Configuration
    associatedtype DefaultStyleModifier : ViewModifier
    
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

fileprivate struct StyleModifierType : AnyStyleModifierType {
    static func makeView<T>(view: _GraphValue<T>, modifier: AnyStyleModifier, inputs: _ViewInputs) -> _ViewOutputs where T : StyleableView {
        assertUnimplemented()
    }
    
    static func makeViewList<T>(view: _GraphValue<T>, modifier: AnyStyleModifier, inputs: _ViewListInputs) -> _ViewListOutputs where T : StyleableView {
        assertUnimplemented()
    }
    
    static func viewListCount(inputs: _ViewListCountInputs) -> Int? {
        assertUnimplemented()
    }
}

fileprivate struct MakeDefaultRepresentation<T : StyleableView> : Rule {
    @Attribute private(set) var view: T
    
    var value: ModifiedContent<T, T.DefaultStyleModifier> {
        assertUnimplemented()
    }
}
