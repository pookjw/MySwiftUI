// 9642BAB01CB0C7550D2DEC01406856AE
internal import Foundation
private import RealityKit
internal import MySwiftUICore
internal import MRUIKit
private import _RealityFoundationPrivate
private import CoreRE

final class EntityHost<T : EntityRepresentable> : RealityKit::Entity {
    private nonisolated(unsafe) var environment: EnvironmentValues // 0x18
    private var viewPhase: _GraphInputs.Phase // 0x28
    private var hoverEffectConfigured: Bool = false // 0x2c
    private var modifiedInputTargetComponents: Set<UInt64> = [] // 0x30
    private let hoverEffectGroupID = HoverEffectComponent.GroupID() // 0x38
    let representedEntity: T.EntityType // 0x40
    @safe private nonisolated(unsafe) let graphBridge: HostedEntityGraphBridge
    
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
        graphBridge.setup()
        
        self.addChild(representedEntity, preservingWorldTransform: false)
        self.updateEnvironment(environment, viewPhase: viewPhase)
        
        self.components[_RealityFoundationPrivate::__EntityInfoComponent.self] = nil
        
        unsafe unsafeBitCast(self.coreEntity, to: CoreRE::Entity.self)
            .hide()
        
        let _ = EntityHostResponder(
            for: self.__coreEntity.__as(OpaquePointer.self),
            in: view
        )
        
        
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency required init() {
        fatalError("init() has not been implemented")
    }
    
    nonisolated func updateEnvironment(_: EnvironmentValues, viewPhase: _GraphInputs.Phase) {
        assertUnimplemented()
    }
    
    // TODO
}

final class HostedEntityGraphBridge : NSObject, MRUIEntityTraitDelegatePrivate, MRUIEntityPreferenceHostDelegate {
    fileprivate weak var entity: RealityKit::Entity? = nil
    private var traitEnvironment: MRUIEntityTraitEnvironment? = nil
    private(set) var preferenceImporter: MRUIPreferenceImporter
    private var overrideEnvironment: EnvironmentValues? = nil
    private var viewPhase = _GraphInputs.Phase()
    
    init(graph: ViewGraph) {
        self.preferenceImporter = MRUIPreferenceImporter(graph: graph)
        super.init()
    }
    
    func updateOverrideEnvironment(_: EnvironmentValues?, viewPhase: _GraphInputs.Phase) {
        assertUnimplemented()
    }
    
    func writePreferences(to outputs: inout _ViewOutputs, inputs: _ViewInputs) {
        assertUnimplemented()
    }
    
    fileprivate func setup() {
        assertUnimplemented()
    }
}
