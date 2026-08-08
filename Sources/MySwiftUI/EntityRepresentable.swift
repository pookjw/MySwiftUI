// BB8F5ECFA8AF74AE8152DD1EB3C8CC7B
package import Spatial
@_spi(Internal) package import MySwiftUICore
package import RealityKit
internal import UIKit
private import AttributeGraph

package protocol EntityRepresentable : View {
    associatedtype EntityType
    associatedtype Coordinator
    
    func makeEntity(context: EntityRepresentableContext<Self>) -> Self.EntityType
    func updateEntity(_ type: Self.EntityType, context: EntityRepresentableContext<Self>)
    static func dismantleEntity(_ type: Self.EntityType, coordinator: Self.Coordinator)
    func makeCoordinator() -> Self.Coordinator
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
    package func makeCoordinator() -> Void {
        // nop
    }
}

package struct EntityRepresentableContext<T : EntityRepresentable> {
    let coordinator: T.Coordinator
    private var preferenceBridge: PreferenceBridge?
    private(set) var transaction: Transaction
    private(set) var environment: EnvironmentValues
    private var phase: _GraphInputs.Phase
    private var gestureProxy: GestureProxy
    
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
        assertUnimplemented()
    }
}

package protocol EntityWithGesture : Gesture {
    var gestureResponder: AnyObject? { get set }
}

fileprivate final class GestureProxy {
    private var connectionCommands: [GestureProxy.GestureConnectionCommand]
    
    init() {
        assertUnimplemented()
    }
}

extension GestureProxy {
    enum GestureConnectionCommand {
        case add(UIGestureRecognizer)
        case remove(UIGestureRecognizer)
    }
}

final class EntityHost<T> : RealityKit::Entity {
    // TODO
}

fileprivate struct PlatformEntityChild<T : EntityRepresentable> : RemovableAttribute, ObservedAttribute, StatefulRule {
    @Attribute private var view: T
    @Attribute private var environment: EnvironmentValues
    @Attribute private var transaction: Transaction
    @Attribute private var phase: _GraphInputs.Phase
    private let bridge: PreferenceBridge
    private let hostGraphBridge: HostedEntityGraphBridge
    private let hostingComponent: AttachmentHostingComponent
    private var links: _DynamicPropertyBuffer
    private var coordinator: T.Coordinator?
    private var entityHost: EntityHost<T>?
    private var resetSeed: UInt32
    
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
        assertUnimplemented()
    }
    
    typealias Value = ModifiedContent<EntityLeafView<T>, AccessibilityPlatformEntityModifier>
    
    func updateValue() {
        assertUnimplemented()
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

fileprivate struct EntityLeafView<T : EntityRepresentable> : LeafViewLayout3D, EntityViewFactory {
    typealias EntityType = T.EntityType
    
    let content: T
    private let hostingComponent: AttachmentHostingComponent?
    private var platformHost: EntityHost<T>
    private let context: EntityRepresentableContext<T>
    
    init(
        content: T,
        hostingComponent: AttachmentHostingComponent?,
        platformHost: EntityHost<T>,
        context: EntityRepresentableContext<T>
    ) {
        assertUnimplemented()
    }
    
    nonisolated static func _makeView(view: _GraphValue<EntityLeafView<T>>, inputs: _ViewInputs) -> _ViewOutputs {
        assertUnimplemented()
    }
}

struct AccessibilityPlatformEntityModifier : PrimitiveViewModifier, MultiViewModifier {
    private let entity: RealityKit::Entity?
    
    nonisolated static func _makeView(modifier: _GraphValue<AccessibilityPlatformEntityModifier>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    nonisolated static func _makeViewList(modifier: _GraphValue<AccessibilityPlatformEntityModifier>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        assertUnimplemented()
    }
}

protocol EntityViewFactory : PrimitiveView, UnaryView {
    associatedtype EntityType
    
    // TODO
}

fileprivate struct PlatformEntityIdentifiedViews<T : EntityRepresentable> : Rule {
    @Attribute private(set) var leafView: EntityLeafView<T>
    
    var value: _IdentifiedViewTree {
        assertUnimplemented()
    }
}
