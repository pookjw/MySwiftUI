// 9642BAB01CB0C7550D2DEC01406856AE
internal import Foundation
private import RealityKit
internal import MySwiftUICore
internal import MRUIKit

final class HostedEntityGraphBridge : NSObject, MRUIEntityTraitDelegatePrivate, MRUIEntityPreferenceHostDelegate {
    weak var entity: RealityKit::Entity? = nil
    var traitEnvironment: MRUIEntityTraitEnvironment? = nil
    var preferenceImporter: MRUIPreferenceImporter
    var overrideEnvironment: EnvironmentValues? = nil
    var viewPhase = _GraphInputs.Phase()
    
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
