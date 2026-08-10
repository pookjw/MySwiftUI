// 9642BAB01CB0C7550D2DEC01406856AE
internal import Foundation
private import RealityKit
internal import MySwiftUICore
internal import MRUIKit
private import CoreRE

final class HostedEntityGraphBridge : NSObject, MRUIEntityTraitDelegatePrivate, MRUIEntityPreferenceHostDelegate {
    weak var entity: RealityKit::Entity? = nil {
        didSet {
            self.setup()
        }
    } // 0x8
    
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
        guard let entity else {
            return
        }
        
        let reEntity = unsafe unsafeBitCast(
            entity.__coreEntity.__as(OpaquePointer.self),
            to: CoreRE::Entity.self
        )
        
        assertUnimplemented()
    }
}
