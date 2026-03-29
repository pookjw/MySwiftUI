internal import MySwiftUICore
private import Foundation
private import UIKit

@MainActor
final class ScenePresentationBridge {
    private var presentedSceneValueSeed = VersionSeedTracker<PresentedSceneValueKey>(seed: .invalid) // 0x10
    private let encoder = JSONEncoder() // 0x18
    weak var host: ViewRendererHost? = nil // 0x20
    
    init() {}
    
    final func preferencesDidChange(_ preferenceValues: PreferenceValues) {
        /*
         self -> x20 -> x19
         preferenceValues -> x0 -> x20
         */
        // x23
        let value = preferenceValues[PresentedSceneValueKey.self]
        let matches = self.presentedSceneValueSeed.seed.matches(value.seed)
        
        guard !matches else {
            return
        }
        
        // <+280>
        self.presentedSceneValueSeed.seed = value.seed
        
        let block: (AnyHashable?) -> Void = { [self] value in
            // $s7SwiftUI23ScenePresentationBridgeC20preferencesDidChangeyyAA16PreferenceValuesVFys11AnyHashableVSgXEfU_
            /*
             value -> x0 -> x22
             self -> x1 -> x21
             */
            guard
                let host,
                let uiView = host.uiView,
                let window = uiView.window,
                let windowScene = window.windowScene,
                let _: UISceneSession? = windowScene.session,
                let _ = value as? (any Codable)
            else {
                return
            }
            
            // <+240>
            assertUnimplemented()
        }
        
        block(value.value)
    }
}

struct PresentedSceneValueKey: HostPreferenceKey {
    typealias Value = AnyHashable?
    
    static func reduce(value: inout AnyHashable?, nextValue: () -> AnyHashable?) {
        assertUnimplemented()
    }
}
