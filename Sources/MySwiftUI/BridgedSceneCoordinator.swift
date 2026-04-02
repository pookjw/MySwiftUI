private import _UIKitPrivate
private import UIKit
private import MySwiftUICore

struct BridgedSceneCoordinator {
    // $s7SwiftUI23BridgedSceneCoordinatorV6shared_WZ
    static let shared = BridgedSceneCoordinator()
    
    private init() {
        _UIWorkspaceSceneRequestOptionsFactory
            .shared()
            ._registerBuilder(
                ImmersiveSpaceSceneBuilder(),
                forRole: .immersiveSpaceApplication
            )
        
        _UIWorkspaceSceneRequestOptionsFactory
            .shared()
            ._registerBuilder(
                CompositorServicesImmersiveSpaceSceneBuilder(),
                forRole: CompositorServicesImmersiveSpaceSceneBuilder._uiSceneSessionRole
            )
        
            _UIWorkspaceSceneRequestOptionsFactory
                .shared()
                ._registerBuilder(
                    VolumeSceneBuilder(),
                    forRole: .windowApplicationVolumetric
                )
    }
    
    func register<T : UIHostingSceneDelegate>(_: T.Type) {
        assertUnimplemented()
    }
}
