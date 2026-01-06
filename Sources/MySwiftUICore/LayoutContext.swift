// BA60BF7120E939C5C25B2A488163D4AC
internal import AttributeGraph
internal import Spatial

@dynamicMemberLookup
struct SizeAndSpacingContext {
    var context: AnyRuleContext
    private var owner: AnyAttribute
    @Attribute private var environment: EnvironmentValues
    
    init(_ context: PlacementContext3D) {
        fatalError("TODO")
    }
    
    init(context: AnyRuleContext, owner: AnyAttribute?, environment: Attribute<EnvironmentValues>) {
        self.context = context
        self.owner = owner
        self._environment = environment
    }
    
    init(_ context: PlacementContext) {
        fatalError("TODO")
    }
    
    subscript<Value>(dynamicMember dynamicMember: KeyPath<EnvironmentValues, Value>) -> Value {
        get {
            fatalError("TODO")
        }
    }
    
    func update<T>(_ block: () -> T) -> T {
        fatalError("TODO")
    }
}

@dynamicMemberLookup
struct PlacementContext {
    private var context: AnyRuleContext
    private var owner: AnyAttribute
    @Attribute private var environment: EnvironmentValues
    private let parentSize: PlacementContext.ParentSize
    
    var proposedSize: _ProposedSize {
        fatalError("TODO")
    }
    
    var size: CGSize {
        fatalError("TODO")
    }
    
    init(base: SizeAndSpacingContext, parentSize: ViewSize) {
        fatalError("TODO")
    }
    
    init(
        context: AnyRuleContext,
        owner: AnyAttribute?,
        size: Attribute<ViewSize>,
        environment: Attribute<EnvironmentValues>,
        transform: Attribute<ViewTransform>,
        position: Attribute<CGPoint>,
        safeAreaInsets: OptionalAttribute<SafeAreaInsets>
    ) {
        fatalError("TODO")
    }
    
    init(
        context: AnyRuleContext,
        size: Attribute<ViewSize>,
        environment: Attribute<EnvironmentValues>,
        transform: Attribute<ViewTransform>,
        position: Attribute<CGPoint>,
        safeAreaInsets: OptionalAttribute<SafeAreaInsets>
    ) {
        fatalError("TODO")
    }
    
    subscript<Value>(dynamicMember dynamicMember: KeyPath<EnvironmentValues, Value>) -> Value {
        get {
            fatalError("TODO")
        }
    }
}

extension PlacementContext {
    fileprivate enum ParentSize {
        case eager(ViewSize)
        case lazy(Attribute<ViewSize>)
    }
}

@dynamicMemberLookup
struct PlacementContext3D {
    private var base: PlacementContext
    private var _depth: ViewDepth
    
    // init은 존재하지 않는데 만든다면 fileprivate일듯
    
    var proposedSize: _ProposedSize3D {
        fatalError("TODO")
    }
    
    var depth: CGFloat {
        fatalError("TODO")
    }
    
    var proposedDepth: CGFloat? {
        fatalError("TODO")
    }
    
    var size: Size3D {
        fatalError("TODO")
    }
    
    subscript<Value>(dynamicMember dynamicMember: KeyPath<EnvironmentValues, Value>) -> Value {
        get {
            fatalError("TODO")
        }
    }
}
