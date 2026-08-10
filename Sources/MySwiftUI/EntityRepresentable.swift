// BB8F5ECFA8AF74AE8152DD1EB3C8CC7B
package import Spatial
@_spi(Internal) package import MySwiftUICore
package import RealityKit
internal import UIKit
private import AttributeGraph
private import os.log
private import _RealityFoundationPrivate
private import CoreRE
private import RealitySystemSupport

nonisolated(unsafe) var currentEntityHostTransaction: Transaction? = nil

fileprivate let isFirstPartyBundle: Bool = {
    guard let bundleIdentifier = Bundle.main.bundleIdentifier else {
        return false
    }
    
    return bundleIdentifier.hasPrefix("com.apple.")
}()

package protocol EntityRepresentable : View {
    associatedtype EntityType : RealityKit::Entity
    associatedtype Coordinator
    
    nonisolated func makeEntity(context: EntityRepresentableContext<Self>) -> Self.EntityType
    nonisolated func updateEntity(_ entity: Self.EntityType, context: EntityRepresentableContext<Self>)
    static func dismantleEntity(_ entity: Self.EntityType, coordinator: Self.Coordinator)
    nonisolated func makeCoordinator() -> Self.Coordinator
    func _sizeThatFits(in size: _ProposedSize3D, entity: Self.EntityType) -> Size3D
    func _identifiedViewTree(in type: Self.EntityType) -> _IdentifiedViewTree
    func _gatherEntitiesWithGesture(from entity: RealityKit::Entity) -> [any EntityWithGesture]
}

extension EntityRepresentable {
    package static func dismantleEntity(_ type: Self.EntityType, coordinator: Self.Coordinator) {
        // nop
    }
    
    package func _sizeThatFits(in size: _ProposedSize3D, entity: Self.EntityType) -> Size3D {
        assertUnimplemented()
    }
    
    package func _identifiedViewTree(in type: Self.EntityType) -> _IdentifiedViewTree {
        assertUnimplemented()
    }
    
    package func _gatherEntitiesWithGesture(from entity: RealityKit::Entity) -> [any EntityWithGesture] {
        assertUnimplemented()
    }
    
    package nonisolated static func _makeView(view: _GraphValue<Self>, inputs: _ViewInputs) -> _ViewOutputs {
        /*
         view -> x0 -> x29 - 0x158
         inputs -> x1 -> x20
         Self -> x2 -> x22 -> x29 - 0xc0
         */
        // <+1080>
        // x29 - 0xd0
        let fields = unsafe DynamicPropertyCache.fields(of: Self.self)
        // x27
        var copy_1 = inputs
        // x29 - 0x138
        let identity = _DisplayList_Identity()
        // x29 - 0xd8
        let preferenceBridge = PreferenceBridge()
        // x29 - 0x160
        let attachmentPreferenceBridge = AttachmentPreferenceBridge()
        // x28
        let hostedEntityGraphBridge = HostedEntityGraphBridge(graph: .current)
        
        // <+1572>
        // copy_1 -> x27 -> x22
        // x21 (x29 - 0xe8)
        let component = AttachmentHostingComponent(
            inputs: copy_1,
            bridge: preferenceBridge,
            attachmentBridge: attachmentPreferenceBridge,
            subgraph: .current!,
            graphHost: .currentHost,
            id: identity
        )
        
        // <+1744>
        // component -> x21 -> x25
        // x26 (x29 - 0x208)
        let copy_2 = unsafe fields
        // view -> x29 - 0x158 -> x27
        // x23 (x29 - 0x1f0)
        let copy_3 = view
        
        // copy_1 -> x22 -> x19
        // x22 (x29 - 0xc8)
        let links = unsafe _DynamicPropertyBuffer(
            fields: copy_2,
            container: copy_3,
            inputs: &copy_1.base
        )
        
        // <+1908>
        // x26 (x29 - 0x1c0)
        let child = PlatformEntityChild<Self>(
            view: view.value,
            environment: copy_1.environment,
            transaction: copy_1.transaction,
            phase: copy_1.viewPhase,
            bridge: preferenceBridge,
            hostGraphBridge: hostedEntityGraphBridge,
            hostingComponent: component,
            links: links,
            coordinator: nil,
            entityHost: nil,
            resetSeed: 0
        )
        
        // <+2136>
        let childAttribute = Attribute(child)
        // x23 (x29 - 0x108)
        let childValue = _GraphValue(childAttribute)
        
        unsafe links.traceMountedProperties(
            to: view,
            fields: fields
        )
        
        do {
            let newFlags: AnyAttribute.Flags = [.transactional, .removable]
            var flags = childAttribute.flags
            flags.subtract(.all)
            flags.formUnion(newFlags)
            childAttribute.flags = flags
        }
        
        // <+2420>
        // childValue -> x23 -> x22
        // x24 (x29 - 0xf8)
        let contentValue = childValue[\.content]
        // w21
        let contentAttribute = contentValue.value
        
        // x27 (x29 - 0x1a8)
        var copy_4 = copy_1
        copy_4.preferences.remove(_IdentifiedViewsKey.self)
        
        // <+2620>
        // x26 (x29 - 0x168)
        var outputs = ModifiedContent<EntityLeafView<Self>, AccessibilityPlatformEntityModifier>.makeDebuggableView(
            view: childValue,
            inputs: copy_4
        )
        
        outputs.preferences.makePreferenceWriter(
            inputs: copy_1.preferences,
            key: _IdentifiedViewsKey.self,
            value: {
                // $s7SwiftUI19EntityRepresentablePAAE9_makeView4view6inputsAA01_F7OutputsVAA11_GraphValueVyxG_AA01_F6InputsVtFZ09AttributeJ00M0VyAA011_IdentifiedF4TreeOGyXEfu_TA
                return Attribute(PlatformEntityIdentifiedViews(leafView: contentAttribute))
            }()
        )
        
        // <+2828>
        hostedEntityGraphBridge
            .preferenceImporter
            .writePreferences(
                to: &outputs,
                inputs: copy_1
            )
        
        preferenceBridge.wrapOutputs(&outputs.preferences, inputs: copy_1)
        
        // <+2960>
        attachmentPreferenceBridge.wrapOutputs(&outputs.preferences, inputs: copy_1)
        
        // <+3020>
        return outputs
    }
    
    package nonisolated static func _makeViewList(view: _GraphValue<Self>, inputs: _ViewListInputs) -> _ViewListOutputs {
        return _ViewListOutputs.unaryViewList(view: view, inputs: inputs)
    }
    
    package var body: Never {
        bodyError()
    }
}

extension EntityRepresentable where Coordinator == Void {
    package nonisolated func makeCoordinator() -> Void {
        // nop
    }
}

package struct EntityRepresentableContext<T : EntityRepresentable> {
    let coordinator: T.Coordinator
    private var preferenceBridge: PreferenceBridge? // 0x24 (field)
    private(set) var transaction: Transaction // 0x28 (field)
    private(set) var environment: EnvironmentValues // 0x2c (field)
    private var phase: _GraphInputs.Phase // 0x30 (field)
    private var gestureProxy: GestureProxy // 0x34 (field)
    
    func addGestureRecognizer(_ gestureRecognizer: UIGestureRecognizer) {
        assertUnimplemented()
    }
    
    func removeGestureRecognizer(_ gestureRecognizer: UIGestureRecognizer) {
        assertUnimplemented()
    }
    
    fileprivate func updateHost(_ host: EntityHost<T>) {
        assertUnimplemented()
    }
    
    fileprivate init(
        coordinator: T.Coordinator,
        preferenceBridge: PreferenceBridge?,
        transaction: Transaction,
        environment: EnvironmentValues,
        phase: _GraphInputs.Phase,
        gestureProxy: GestureProxy
    ) {
        self.coordinator = coordinator
        self.preferenceBridge = preferenceBridge
        self.transaction = transaction
        self.environment = environment
        self.phase = phase
        self.gestureProxy = gestureProxy
    }
}

package protocol EntityWithGesture : Gesture {
    var gestureResponder: AnyObject? { get set }
}

fileprivate final class GestureProxy {
    private var connectionCommands: [GestureProxy.GestureConnectionCommand]
    
    init() {
        self.connectionCommands = []
    }
}

extension GestureProxy {
    enum GestureConnectionCommand {
        case add(UIGestureRecognizer)
        case remove(UIGestureRecognizer)
    }
}

fileprivate struct PlatformEntityChild<T : EntityRepresentable> : RemovableAttribute, ObservedAttribute, StatefulRule {
    @Attribute private var view: T // 0x0
    @Attribute private var environment: EnvironmentValues // 0x4
    @Attribute private var transaction: Transaction // 0x8
    @Attribute private var phase: _GraphInputs.Phase // 0xc
    private let bridge: PreferenceBridge // 0x10
    private let hostGraphBridge: HostedEntityGraphBridge // 0x18
    private let hostingComponent: AttachmentHostingComponent // 0x38 (field)
    private var links: _DynamicPropertyBuffer // 0x3c (field)
    private var coordinator: T.Coordinator? // 0x40 (field)
    private var entityHost: EntityHost<T>? // 0x44 (field)
    private var resetSeed: UInt32 // 0x48 (field)
    
    init(
        view: Attribute<T>,
        environment: Attribute<EnvironmentValues>,
        transaction: Attribute<Transaction>,
        phase: Attribute<_GraphInputs.Phase>,
        bridge: PreferenceBridge,
        hostGraphBridge: HostedEntityGraphBridge,
        hostingComponent: AttachmentHostingComponent,
        links: _DynamicPropertyBuffer,
        coordinator: T.Coordinator?,
        entityHost: EntityHost<T>?,
        resetSeed: UInt32
    ) {
        self._view = view
        self._environment = environment
        self._transaction = transaction
        self._phase = phase
        self.bridge = bridge
        self.hostGraphBridge = hostGraphBridge
        self.hostingComponent = hostingComponent
        self.links = links
        self.coordinator = coordinator
        self.resetSeed = resetSeed
    }
    
    typealias Value = ModifiedContent<EntityLeafView<T>, AccessibilityPlatformEntityModifier>
    
    mutating func updateValue() {
        // self -> x20 -> x28
        // <+940>
        if self.resetSeed != self.phase.resetSeed {
            self.destroyEntity()
            self.links.reset()
            self.resetSeed = self.phase.resetSeed
        }
        
        // <+1104>
        // x24 (x29 - 0x80)
        var view = self.view
        
        withUnsafeMutablePointer(to: &view) { pointer in
            let _ = unsafe self.links.update(
                container: UnsafeMutableRawPointer(pointer),
                phase: self.phase
            )
        }
        
        // x29 - 0x68
        let transaction = Graph.withoutUpdate {
            // $s7SwiftUI19PlatformEntityChild33_BB8F5ECFA8AF74AE8152DD1EB3C8CC7BLLV11updateValueyyFAA11TransactionVyXEfU_
            if self.coordinator == nil {
                self.coordinator = view.makeCoordinator()
            }
            
            return self.transaction
        }
        
        // <+1276>
        // x29 - 0x168
        let oldTransaction = unsafe currentEntityHostTransaction
        unsafe currentEntityHostTransaction = transaction
        // transaction -> x29 - 0x68 -> x29 - 0xa8
        
        // x29 - 0xd8
        let context: EntityRepresentableContext<T>
        if self.entityHost != nil {
            // <+1320>
            // entityHost -> x29 - 0x188
            // x23
            var (env, envChanged) = self.$environment.changedValue(options: [])
            
            var bridge: PreferenceBridge
            // true -> <+1468> / false -> <+1504>
            let flag: Bool
            if let _bridge = env.preferenceBridge {
                bridge = self.bridge
                
                if bridge === _bridge {
                    // <+3056>
                    if envChanged {
                        // <+1468>
                        flag = true
                    } else {
                        // <+1504>
                        flag = false
                    }
                } else {
                    // <+1440>
                    bridge = self.bridge
                    env.preferenceBridge = bridge
                    envChanged = true
                    // <+1468>
                    flag = true
                }
            } else {
                // <+1440>
                bridge = self.bridge
                env.preferenceBridge = bridge
                envChanged = true
                // <+1468>
                flag = true
            }
            
            if flag {
                // <+1468>
                Graph.withoutUpdate { 
                    // $s7SwiftUI19PlatformEntityChild33_BB8F5ECFA8AF74AE8152DD1EB3C8CC7BLLV11updateValueyyFyyXEfU1_
                    self.entityHost!.updateEnvironment(env, viewPhase: self.phase)
                }
            }
            
            // <+1504>
            context = EntityRepresentableContext<T>(
                coordinator: self.coordinator!,
                preferenceBridge: bridge,
                transaction: transaction,
                environment: env,
                phase: self.phase,
                gestureProxy: GestureProxy()
            )
            
            // <+2364>
        } else {
            // <+1764>
            // x22 (x29 - 0x170)
            var env = self.environment
            let bridge = self.bridge
            env.preferenceBridge = bridge
            
            context = EntityRepresentableContext<T>(
                coordinator: self.coordinator!,
                preferenceBridge: bridge,
                transaction: transaction,
                environment: env,
                phase: self.phase,
                gestureProxy: GestureProxy()
            )
            
            self.entityHost = self.withObservation { 
                // $s7SwiftUI19PlatformEntityChild33_BB8F5ECFA8AF74AE8152DD1EB3C8CC7BLLV11updateValueyyFAA0D4HostCyxGSgyXEfU0_TA
                return Graph.withoutUpdate { 
                    // $s7SwiftUI19PlatformEntityChild33_BB8F5ECFA8AF74AE8152DD1EB3C8CC7BLLV11updateValueyyFAA0D4HostCyxGSgyXEfU0_AIyXEfU_
                    // <+292>
                    let entity = view.makeEntity(context: context)
                    
                    if (entity.parent != nil) || (entity.scene != nil) {
                        // <+444>
                        unsafe os_log(.fault, log: .runtimeIssuesLog, "Entity%s returned from %s.makeEntity(context:) was already parented to another entity. This is not supported and may lead to unexpected behavior. SwiftUI adds entities to internally-managed entity hierarchies.", entity.name, _typeName(T.self, qualified: false))
                    }
                    
                    // <+920>
                    let host = EntityHost<T>(
                        entity,
                        environment: env,
                        graphBridge: self.hostGraphBridge,
                        view: view,
                        viewPhase: self.phase
                    )
                    
                    context.updateHost(host)
                    return host
                }
            }
            
            // <+2364>
        }
        
        // <+2364>
        self.withObservation { 
            // $s7SwiftUI19PlatformEntityChild33_BB8F5ECFA8AF74AE8152DD1EB3C8CC7BLLV11updateValueyyFyyXEfU2_TA
            Graph.withoutUpdate { 
                // $s7SwiftUI19PlatformEntityChild33_BB8F5ECFA8AF74AE8152DD1EB3C8CC7BLLV11updateValueyyFyyXEfU2_yyXEfU_
                view.updateEntity(
                    self.entityHost!.representedEntity,
                    context: context
                )
                
                context.updateHost(self.entityHost!)
            }
        }
        
        // <+2560>
        let copy = view
        let hostingComponent = self.hostingComponent
        let entityHost = self.entityHost!
        
        self.value = EntityLeafView(
            content: copy,
            hostingComponent: hostingComponent,
            platformHost: entityHost,
            context: context
        )
            .accessibility(entity: entityHost)
        
        unsafe currentEntityHostTransaction = oldTransaction
    }
    
    func destroy() {
        assertUnimplemented()
    }
    
    static func willRemove(attribute: AnyAttribute) {
        assertUnimplemented()
    }
    
    static func didReinsert(attribute: AnyAttribute) {
        assertUnimplemented()
    }
    
    func destroyEntity() {
        assertUnimplemented()
    }
}

fileprivate struct EntityLeafView<T : EntityRepresentable> : @preconcurrency LeafViewLayout3D, EntityViewFactory {
    typealias EntityType = T.EntityType
    
    let content: T
    let hostingComponent: AttachmentHostingComponent?
    private var platformHost: EntityHost<T>
    private let context: EntityRepresentableContext<T>
    
    nonisolated init(
        content: T,
        hostingComponent: AttachmentHostingComponent?,
        platformHost: EntityHost<T>,
        context: EntityRepresentableContext<T>
    ) {
        assertUnimplemented()
    }
    
    nonisolated static func _makeView(view: _GraphValue<EntityLeafView<T>>, inputs: _ViewInputs) -> _ViewOutputs {
        var outputs = Self.makeLeafView(view: view, inputs: inputs)
        Self.makeLeafLayout(&outputs, view: view, inputs: inputs)
        return outputs
    }
    
    func makeEntity() -> T.EntityType {
        assertUnimplemented()
    }
    
    func updateEntity(_ entity: inout T.EntityType, context: _EntityViewFactory_Context) -> _EntityViewFactory_Geometry {
        assertUnimplemented()
    }
    
    var features: DisplayList.Features {
        assertUnimplemented()
    }
    
    static var shadowApplicationIsRecursive: Bool {
        assertUnimplemented()
    }
    
    static var wantsHitTestGeometry: Bool {
        assertUnimplemented()
    }
    
    func depthThatFits(in proposedSize: _ProposedSize3D) -> CGFloat {
        assertUnimplemented()
    }
    
    func spacing() -> Spacing {
        assertUnimplemented()
    }
    
    func sizeThatFits(in proposedSize: _ProposedSize) -> CGSize {
        assertUnimplemented()
    }
}

fileprivate struct PlatformEntityIdentifiedViews<T : EntityRepresentable> : Rule {
    @Attribute private(set) var leafView: EntityLeafView<T>
    
    var value: _IdentifiedViewTree {
        assertUnimplemented()
    }
}

final class EntityHost<T : EntityRepresentable> : RealityKit::Entity {
    private nonisolated(unsafe) var environment: EnvironmentValues // 0x18
    private var viewPhase: _GraphInputs.Phase // 0x28
    private var hoverEffectConfigured: Bool = false // 0x2c
    private var modifiedInputTargetComponents: Set<UInt64> = [] // 0x30
    private let hoverEffectGroupID = HoverEffectComponent.GroupID() // 0x38
    let representedEntity: T.EntityType // 0x40
    @safe private nonisolated(unsafe) let graphBridge: HostedEntityGraphBridge
    
    @MainActor @preconcurrency required init() {
        fatalError("init() has not been implemented")
    }
    
    nonisolated func updateEnvironment(_ newEnvironment: EnvironmentValues, viewPhase: _GraphInputs.Phase) {
        /*
         self -> x20 -> x27
         environmentValues -> x0 -> x29 - 0xe0
         viewPhase -> x1 -> x29 - 0xf0
         */
        // <+940>
        let style: SystemHoverEffect.Style?
        if let effect = self.environment.currentSystemHoverEffect {
            style = effect.style
        } else {
            style = nil
        }
        
        // <+1072>
        // x29 - 0x15c
        let isHoverEffectEnabled = self.environment.isHoverEffectEnabled
        assertUnimplemented()
    }
    
    nonisolated init(
       _ representedEntity: T.EntityType,
       environment: EnvironmentValues,
       graphBridge: HostedEntityGraphBridge,
       view: T,
       viewPhase: _GraphInputs.Phase
   ) {
       unsafe self.environment = environment
       self.viewPhase = viewPhase
       self.representedEntity = representedEntity
       self.graphBridge = graphBridge
       
       super.init()
       
       graphBridge.entity = self
       
       self.addChild(representedEntity, preservingWorldTransform: false)
       self.updateEnvironment(environment, viewPhase: viewPhase)
       
       self.components[_RealityFoundationPrivate::__EntityInfoComponent.self] = nil
       
       unsafe unsafeBitCast(self.coreEntity, to: CoreRE::Entity.self)
           .hide()
       
       let reEntity = unsafe self.__coreEntity.__as(OpaquePointer.self)
       let _ = unsafe EntityHostResponder(
           for: reEntity,
           in: view
       )
       
       let inputTargetComponent = unsafe unsafeBitCast(reEntity, to: CoreRE::Entity.self)
           .getOrAddCustomComponent(RCPInputTargetComponentGetCustomComponentType())
       
       RCPInputTargetComponentSetTargetProperties(inputTargetComponent, .unknown2)
       
       if !isLinkedOnOrAfter(.v6) && isFirstPartyBundle {
           // <+992>
           representedEntity.components.set(InputTargetComponent(allowedInputTypes: .all))
       }
   }
}
