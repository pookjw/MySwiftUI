// 278B8B6E01D480C09D89EEF65D03A530
internal import MySwiftUICore
private import AttributeGraph
private import CoreGraphics

protocol EntityViewFactory : PrimitiveView, UnaryView {
    associatedtype EntityType
    
    func makeEntity() -> Self.EntityType
    func updateEntity(_ entity: inout Self.EntityType, context: _EntityViewFactory_Context) -> _EntityViewFactory_Geometry
    var features: DisplayList.Features { get }
    static var shadowApplicationIsRecursive: Bool { get }
    static var wantsHitTestGeometry: Bool { get }
    var hostingComponent: AttachmentHostingComponent? { get }
}

extension EntityViewFactory {
    static nonisolated func makeLeafView(view: _GraphValue<Self>, inputs: _ViewInputs) -> _ViewOutputs {
        /*
         view -> x0 -> x29 - 0xf0
         inputs -> x1 -> x24
         */
        // <+452>
        // x29 - 0xb0
        var outputs = _ViewOutputs()
        // x29 - 0x98
        let identity = inputs.pushIdentity()
        
        if inputs.preferences.contains(DisplayList.Key.self) {
            // <+544>
            let child = EntityFactoryChild(
                factory: view.value,
                environment: inputs.environment,
                tracker: PropertyList.Tracker()
            )
            
            let factoryAttribute = Attribute(child)
            
            let leafDisplayList = LeafDisplayList<Self>(
                identity: identity,
                view: factoryAttribute,
                position: inputs.animatedPosition(),
                size: inputs.animatedSize(),
                containerPosition: inputs.containerPosition,
                depth: inputs.animatedDepth(),
                options: inputs[DisplayList.Options.self],
                contentSeed: DisplayList.Seed()
            )
            
            let displayListAttribute = Attribute(leafDisplayList)
            outputs[DisplayList.Key.self] = displayListAttribute
        }
        
        // <+1232>
        if inputs.preferences.contains(ViewRespondersKey.self) {
            let filter = LeafResponder3DFilter(
                size: inputs.animatedSize(),
                depth: inputs.animatedDepth(),
                position: inputs.animatedPosition(),
                transform: inputs.transform,
                identity: identity,
                responder: LeafViewResponder3D(
                    inputs: inputs,
                    viewSubgraph: .current!
                )
            )
            
            let respondersAttribute = Attribute(filter)
            outputs[ViewRespondersKey.self] = respondersAttribute
        }
        
        return outputs
    }
    
    var hostingComponent: AttachmentHostingComponent? {
        assertUnimplemented()
    }
}

struct _EntityViewFactory_Context {
    // TODO
}

struct _EntityViewFactory_Geometry {
    // TODO
}

fileprivate struct EntityFactoryChild<T : EntityViewFactory> : AsyncAttribute, StatefulRule {
    @Attribute private(set) var factory: T
    @Attribute private(set) var environment: EnvironmentValues
    let tracker: PropertyList.Tracker
    
    typealias Value = ResolvedEntityFactory<T>
    
    func updateValue() {
        assertUnimplemented()
    }
}

fileprivate struct ResolvedEntityFactory<T : EntityViewFactory> {
    private var factory: T
    private var pointScale: PointScale
    private var castsShadows: Bool
    private var redactionReasons: RedactionReasons
    private var isContainedInPlatter: Bool
    
    init(factory: T, pointScale: PointScale, castsShadows: Bool, redactionReasons: RedactionReasons, isContainedInPlatter: Bool) {
        assertUnimplemented()
    }
}

fileprivate struct LeafDisplayList<T : EntityViewFactory> : CustomStringConvertible, StatefulRule {
    let identity: _DisplayList_Identity // 0x0
    @Attribute var view: ResolvedEntityFactory<T> // 0x24 (field)
    @Attribute var position: CGPoint // 0x28 (field)
    @Attribute var size: ViewSize // 0x2c (field)
    @Attribute var containerPosition: CGPoint // 0x30 (field)
    @Attribute var depth: ViewDepth // 0x34 (field)
    let options: DisplayList.Options // 0x38 (field)
    var contentSeed: DisplayList.Seed // 0x3c (field)
    
    init(
        identity: _DisplayList_Identity,
        view: Attribute<ResolvedEntityFactory<T>>,
        position: Attribute<CGPoint>,
        size: Attribute<ViewSize>,
        containerPosition: Attribute<CGPoint>,
        depth: Attribute<ViewDepth>,
        options: DisplayList.Options,
        contentSeed: DisplayList.Seed
    ) {
        self.identity = identity
        self._view = view
        self._position = position
        self._size = size
        self._containerPosition = containerPosition
        self._depth = depth
        self.options = options
        self.contentSeed = contentSeed
    }
    
    typealias Value = DisplayList
    
    func updateValue() {
        assertUnimplemented()
    }
    
    var description: String {
        assertUnimplemented()
    }
}
