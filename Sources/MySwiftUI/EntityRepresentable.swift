// BB8F5ECFA8AF74AE8152DD1EB3C8CC7B
public import Spatial
@_spi(Internal) public import MySwiftUICore
#if UseMyRealityKit
public import MyRealityKit
#else
public import RealityKit
#endif
internal import UIKit

@_spi(Reality) public protocol EntityRepresentable : View {
    associatedtype EntityType
    associatedtype Coordinator
    
    func makeEntity(context: EntityRepresentableContext<Self>) -> Self.EntityType
    func updateEntity(_ type: Self.EntityType, context: EntityRepresentableContext<Self>)
    static func dismantleEntity(_ type: Self.EntityType, coordinator: Self.Coordinator)
    func makeCoordinator() -> Self.Coordinator
    func _sizeThatFits(in size: _ProposedSize3D, entity: Self.EntityType) -> Size3D
    func _identifiedViewTree(in type: Self.EntityType) -> _IdentifiedViewTree
    func _gatherEntitiesWithGesture(from entity: RE_Entity_Exported) -> [any EntityWithGesture]
}

extension EntityRepresentable {
    public static func dismantleEntity(_ type: Self.EntityType, coordinator: Self.Coordinator) {
        // nop
    }
    
    public func _sizeThatFits(in size: _ProposedSize3D, entity: Self.EntityType) -> Size3D {
        assertUnimplemented()
    }
    
    public func _identifiedViewTree(in type: Self.EntityType) -> _IdentifiedViewTree {
        assertUnimplemented()
    }
    
    public func _gatherEntitiesWithGesture(from entity: RE_Entity_Exported) -> [any EntityWithGesture] {
        assertUnimplemented()
    }
    
    public nonisolated static func _makeView(view: _GraphValue<Self>, inputs: _ViewInputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    public nonisolated static func _makeViewList(view: _GraphValue<Self>, inputs: _ViewListInputs) -> _ViewListOutputs {
        assertUnimplemented()
    }
    
    public var body: Never {
        bodyError()
    }
}

extension EntityRepresentable where Coordinator == Void {
    public func makeCoordinator() -> Void {
        // nop
    }
}

@_spi(Reality) public struct EntityRepresentableContext<T : EntityRepresentable> {
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

@_spi(Reality) public protocol EntityWithGesture : Gesture {
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

final class EntityHost<T> : RE_Entity {
    // TODO
}
