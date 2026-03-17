@_spi(Internal) internal import MySwiftUICore
internal import UIKit
internal import AttributeGraph

final class ImmersiveSpaceAuthority {
    @safe static nonisolated(unsafe) let shared = ImmersiveSpaceAuthority()
    
    static let didChangeCurrentImmersiveSpace = Notification.Name(
        rawValue: "ImmersiveSpaceAuthorityDidChangeCurrentImmersiveSpace"
    )
    
    static let didChangeImmersion = Notification.Name(
        rawValue: "ImmersiveSpaceAuthorityDidChangeImmersion"
    )

    private(set) lazy var remoteDesiredClientOptions: Attribute<ImmersiveSpaceConfigurationAttributes.ClientOptions?> = {
        let graph = AppGraph.shared ?? (GraphHost.currentHost as! AppGraph)
        return graph.rootSubgraph.apply { 
            return Attribute(value: nil)
        }
    }() // 0x10
    
    private var currentImmersiveSpace: SceneActivationState? = nil // 0x18
    private var immersiveSpaceBeingReplaced: SceneActivationState? = nil // 0x338
    private var isRequestingSwiftUIScene: Bool = false // 0x653
    private weak var currentRemoteSessionInfo: RemoteScenes.SessionInfo? = nil // 0x658
    weak var immersiveSpaceScene: UIScene? = nil // 0x660
    private var sceneCreationContinuations: [CheckedContinuation<SceneNavigationStrategy_Phone.Result, Never>] = [] // 0x668
    private var sceneDestructionContinuations: [CheckedContinuation<Void, Never>] = [] // 0x670
    private(set) var _immersion = Immersion() // 0x678
    
    init() {
    }
    
    func sceneConnected(scene: UIScene, namespace: SceneList.Namespace, item: SceneList.Item) {
        assertUnimplemented()
    }
    
    func updateCurrentImmersiveSpaceIfNeeded() {
        assertUnimplemented()
    }
    
    func currentImmersiveSpaceClientOptions() -> ImmersiveSpaceConfigurationAttributes.ClientOptions? {
        assertUnimplemented()
    }
    
    func updateRemoteImmersiveSpace(clientOptions: ImmersiveSpaceConfigurationAttributes.ClientOptions) {
        assertUnimplemented()
    }
    
    func prepareSceneReplacement() {
        assertUnimplemented()
    }
    
    func sceneRequested(namespace: SceneList.Namespace, item: SceneList.Item, forRemoteSessionInfo: RemoteScenes.SessionInfo?, continuation: CheckedContinuation<SceneNavigationStrategy_Phone.Result, Never>) {
        assertUnimplemented()
    }
    
    func sceneDestructionRequested(namespace: SceneList.Namespace, item: SceneList.Item, continuation: CheckedContinuation<(), Never>) {
        assertUnimplemented()
    }
}
