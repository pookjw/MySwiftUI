internal import AttributeGraph

struct LayoutProxy {
    private var context: AnyRuleContext
    private var attributes: LayoutProxyAttributes
    // TODO
}

struct LayoutProxyCollection {
    private var context: AnyRuleContext
    private var attributes: [LayoutProxyAttributes]
    
    init(context: AnyRuleContext, attributes: [LayoutProxyAttributes]) {
        self.context = context
        self.attributes = attributes
    }
    
    var startIndex: Int {
        fatalError("TODO")
    }
    
    var endIndex: Int {
        fatalError("TODO")
    }
    
    subscript(_ index: Int) -> LayoutProxy {
        _read {
            fatalError("TODO")
        }
    }
    
    func requiresTrueDepthLayout() -> Bool {
        fatalError("TODO")
    }
}

struct LayoutProxyAttributes: Equatable {
    @OptionalAttribute private var layoutComputer: LayoutComputer?
    @OptionalAttribute private var traitsList: ViewList?
    
    init(layoutComputer: OptionalAttribute<LayoutComputer>, traitsList: OptionalAttribute<ViewList>) {
        _layoutComputer = layoutComputer
        _traitsList = traitsList
    }
    
    init(traitsList: OptionalAttribute<ViewList>) {
        _layoutComputer = OptionalAttribute()
        _traitsList = traitsList
    }
    
    init(layoutComputer: OptionalAttribute<LayoutComputer>) {
        _layoutComputer = layoutComputer
        _traitsList = OptionalAttribute()
    }
    
    init() {
        _layoutComputer = OptionalAttribute()
        _traitsList = OptionalAttribute()
    }
    
    var isEmpty: Bool {
        return ($layoutComputer == nil) && ($traitsList == nil)
    }
}
