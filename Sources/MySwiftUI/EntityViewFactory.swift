// 278B8B6E01D480C09D89EEF65D03A530
internal import MySwiftUICore
private import AttributeGraph
private import CoreGraphics
internal import Spatial
internal import RealityKit
private import CoreRE
private import FeatureFlags

protocol EntityViewFactory : PrimitiveView, UnaryView {
    associatedtype EntityType : RealityKit::Entity
    
    nonisolated func makeEntity() -> Self.EntityType
    nonisolated func updateEntity(_ entity: inout Self.EntityType, context: _EntityViewFactory_Context) -> _EntityViewFactory_Geometry
    nonisolated var features: DisplayList.Features { get }
    static nonisolated var shadowApplicationIsRecursive: Bool { get }
    static nonisolated var wantsHitTestGeometry: Bool { get }
    nonisolated var hostingComponent: AttachmentHostingComponent? { get }
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
    private(set) var size: Size3D
    fileprivate private(set) var pointScale: PointScale
}

struct _EntityViewFactory_Geometry {
    let unknown0: Size3D // 0x0
    let unknown1: Size3D // 0x20
    let unknown2: Size3D // 0x40
}

fileprivate struct EntityFactoryChild<T : EntityViewFactory> : AsyncAttribute, StatefulRule {
    @Attribute private(set) var factory: T
    @Attribute private(set) var environment: EnvironmentValues
    let tracker: PropertyList.Tracker
    
    typealias Value = ResolvedEntityFactory<T>
    
    func updateValue() {
        // <+492>
        let (factory, factoryChanged) = self.$factory.changedValue(options: [])
        let (environment, environmentChanged) = self.$environment.changedValue(options: [])
        
        if !factoryChanged && self.hasValue {
            if !environmentChanged {
                return
            }
            
            if !self.tracker.hasDifferentUsedValues(environment.plist) {
                return
            }
            
            // <+712>
        } else {
            // <+712>
        }
        
        // <+712>
        self.tracker.reset()
        let env = EnvironmentValues(environment.plist, tracker: self.tracker)
        
        self.value = ResolvedEntityFactory<T>(
            factory: factory,
            pointScale: env.pointScale,
            castsShadows: env.castsShadows,
            redactionReasons: env.redactionReasons,
            isContainedInPlatter: env.isContainedInPlatter
        )
    }
}

fileprivate struct ResolvedEntityFactory<T : EntityViewFactory> {
    private(set) var factory: T // 0x0
    private(set) var pointScale: PointScale // 0x24 (field)
    private(set) var castsShadows: Bool // 0x28 (field)
    private var redactionReasons: RedactionReasons // 0x2c (field)
    private(set) var isContainedInPlatter: Bool // 0x30 (field)
    
    init(factory: T, pointScale: PointScale, castsShadows: Bool, redactionReasons: RedactionReasons, isContainedInPlatter: Bool) {
        self.factory = factory
        self.pointScale = pointScale
        self.castsShadows = castsShadows
        self.redactionReasons = redactionReasons
        self.isContainedInPlatter = isContainedInPlatter
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
    
    mutating func updateValue() {
        // <+984>
        // x27 (x29 - 0xe0), x29 - 0x1e8
        let (view, viewChanged) = self.$view.changedValue(options: [])
        // x26 (x29 - 0xa8), w20
        let (size, sizeChanged) = self.$size.changedValue(options: [])
        // x25/x24, w21
        let (depth, depthChanged) = self.$depth.changedValue(options: [])
        
        // <+1200>
        let version = DisplayList.Version(forUpdate: ())
        if viewChanged || sizeChanged || depthChanged {
            self.contentSeed = DisplayList.Seed(version)
        }
        
        // <+1300>
        var d8: CGFloat
        var d9: CGFloat
        do {
            let position = self.position
            d8 = position.x
            d9 = position.y
        }
        
        let d0: CGFloat
        let d1: CGFloat
        do {
            let containerPosition = self.containerPosition
            d0 = containerPosition.x
            d1 = containerPosition.y
        }
        
        d8 = d8 - d0
        d9 = d9 - d1
        
        var d10: CGFloat
        var d11: CGFloat
        do {
            let value = size.value
            d10 = value.width
            d11 = value.height
        }
        
        // <+1444>
        // x29 - 0xc8
        let factory = ViewFactory<T>(
            factory: view,
            size: Size3D(width: d10, height: d11, depth: depth.value),
            identity: self.identity
        )
        
        // <+1564>
        let content = DisplayList.Content(
            .platformView(factory),
            seed: self.contentSeed
        )
        
        let item_1 = DisplayList.Item(
            .content(content),
            frame: CGRect(
                origin: CGPoint(x: d8, y: d9),
                size: size.value
            ),
            identity: self.identity,
            version: version
        )
        
        // <+1908>
        let effect = DisplayList.Effect.platform(.serverResponderID(self.identity.value))
        let displayList_1 = DisplayList(item_1)
        
        var item_2 = DisplayList.Item(
            .effect(effect, displayList_1),
            frame: CGRect(origin: .zero, size: size.value),
            identity: .none,
            version: version
        )
        
        item_2.canonicalize(options: self.options)
        let displayList_2 = DisplayList(item_2)
        self.value = displayList_2
    }
    
    var description: String {
        assertUnimplemented()
    }
}

fileprivate struct ViewFactory<T : EntityViewFactory> : PlatformViewFactory {
    static func removeGroundingShadowComponent(from entity: OpaquePointer) {
        if isFeatureEnabled(RSSFeature.surfaceSnappingVerticalShadows) {
            unsafe unsafeBitCast(entity, to: CoreRE::Entity.self)
                .removeComponent(ofType: .uiShadowConfiguration)
        } else {
            unsafe unsafeBitCast(entity, to: CoreRE::Entity.self)
                .removeComponent(ofType: .projectiveShadowReceiver)
        }
    }
    
    static func addGroundingShadowComponent(to entity: OpaquePointer) {
        assertUnimplemented()
    }
    
    @safe private nonisolated(unsafe) var factory: ResolvedEntityFactory<T> // 0x0
    private var size: Size3D // 0x24 (field)
    private var identity: _DisplayList_Identity // 0x28 (field)
    
    init(factory: ResolvedEntityFactory<T>, size: Size3D, identity: _DisplayList_Identity) {
        self.factory = factory
        self.size = size
        self.identity = identity
    }
    
    func makePlatformView() -> AnyObject? {
        return EntityHostingView<T.EntityType>(
            contentEntity: self.factory.factory.makeEntity(),
            hostingComponent: self.factory.factory.hostingComponent
        )
    }
    
    func updatePlatformView(_ view: inout AnyObject) {
        /*
         self -> x20
         view -> x0 -> x25
         T -> x1 -> x19
         */
        // x25
        let casted = view as! EntityHostingView<T.EntityType>
        var contentEntity = casted.contentEntity
        
        let geometry = self.factory.factory.updateEntity(
            &contentEntity,
            context: _EntityViewFactory_Context(
                size: self.size,
                pointScale: self.factory.pointScale
            )
        )
        
        casted.updateContent(
            entity: contentEntity,
            hostingComponent: self.factory.factory.hostingComponent
        )
        
        self.updateGeometry(geometry, for: contentEntity)
        self.updateProjectiveShadow(for: contentEntity)
        self.updateShareMode(for: contentEntity)
        
        if T.wantsHitTestGeometry {
            self.updateHitTestGeometry(for: contentEntity)
        }
        
        guard let componentType = CoreRE::Component.ClassPtr.selectableSceneContentIdentifier else {
            return
        }
        
        let reEntity = unsafe unsafeBitCast(
            contentEntity.__coreEntity.__as(OpaquePointer.self),
            to: CoreRE::Entity.self
        )
        
        let component = reEntity.getOrAddComponent(ofType: componentType)
        component.selectableSceneContentIdentifier_identifier = self.identity.value
    }
    
    func updateGeometry(_ geometry: _EntityViewFactory_Geometry, for entity: RealityKit::Entity) {
        /*
         self -> x20
         geometry -> x0 -> x21
         entity -> x1 -> x19
         T -> x2 -> x25
         */
        // <+128>
        var x290x90 = geometry.unknown2
        let d2 = geometry.unknown0.depth * 0.5
        x290x90.depth = x290x90.depth + d2
        x290x90.height = -x290x90.height
        
        // x29 - 0x70
        let converted = x290x90.convert(
            from: .points,
            to: .meters,
            scale: self.factory.pointScale
        )
        
        // <+296>
        entity.transform.translation = SIMD3<Float>(
            Float(converted.width),
            Float(converted.height),
            Float(converted.depth)
        )
        
        entity.transform.scale = SIMD3<Float>(
            Float(geometry.unknown1.width),
            Float(geometry.unknown1.height),
            Float(geometry.unknown1.depth)
        )
    }
    
    func updateProjectiveShadow(for entity: RealityKit::Entity) {
        /*
         self -> x20
         entity -> x0 -> x21
         T -> x1 -> x24
         */
        // <+204>
        let shadow: ProjectiveShadow?
        if !self.factory.castsShadows || self.factory.isContainedInPlatter {
            // <+232>
            shadow = nil
        } else {
            // <+252>
            shadow = .default
        }
        
        // <+296>
        let visit: (OpaquePointer) -> Void = { reEntity in
            // $s7SwiftUI11ViewFactory33_278B8B6E01D480C09D89EEF65D03A530LLV22updateProjectiveShadow3fory10RealityKit6EntityC_tFys13OpaquePointerVcfU_
            if shadow == nil {
                unsafe ViewFactory<T>.removeGroundingShadowComponent(from: reEntity)
            } else {
                unsafe ViewFactory<T>.addGroundingShadowComponent(to: reEntity)
            }
        }
        
        let coreEntity = unsafe entity.coreEntity
        
        if T.shadowApplicationIsRecursive {
            unsafe coreEntity.recursively(visit: visit)
        } else {
            unsafe visit(coreEntity)
        }
    }
    
    func updateShareMode(for entity: RealityKit::Entity) {
        assertUnimplemented()
    }
    
    func updateHitTestGeometry(for entity: RealityKit::Entity) {
        assertUnimplemented()
    }
    
    var features: DisplayList.Features {
        return self.factory.factory.features
    }
}
