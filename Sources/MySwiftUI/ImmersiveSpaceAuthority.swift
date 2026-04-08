@_spi(Internal) internal import MySwiftUICore
internal import UIKit
internal import AttributeGraph
private import os.log

final class ImmersiveSpaceAuthority {
    @safe nonisolated(unsafe) static let shared = ImmersiveSpaceAuthority()
    
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
    
    private(set) var currentImmersiveSpace: SceneActivationState? = nil // 0x18
    private var immersiveSpaceBeingReplaced: SceneActivationState? = nil // 0x338
    var isRequestingSwiftUIScene: Bool = false // 0x653
    private(set) weak var currentRemoteSessionInfo: RemoteScenes.SessionInfo? = nil // 0x658
    weak var immersiveSpaceScene: UIScene? = nil // 0x660
    private var sceneCreationContinuations: [CheckedContinuation<SceneNavigationStrategy_Phone.Result, Never>] = [] // 0x668
    private var sceneDestructionContinuations: [CheckedContinuation<Void, Never>] = [] // 0x670
    private(set) var _immersion = Immersion() // 0x678
    
    init() {
    }
    
    func sceneConnected(scene: UIScene, namespace: SceneList.Namespace, item: SceneList.Item) {
        /*
         self -> x20 -> x29 - 0x150
         scene -> x0 -> x20
         namespace -> x1/x2/x3 -> x29 - 0x168
         item -> x4 -> x19
         */
        // <+312>
        guard case .immersiveSpace(let _) = item.value else {
            return
        }
        
        assertUnimplemented()
    }
    
    func sceneDisconnected(scene: UIScene, namespace: SceneList.Namespace, item: SceneList.Item) {
        /*
         scene -> dead
         namespace -> x0/x1/x2 -> x29 - 0x188 / x29 - 0x190 / x29 - 0x17c
         item -> x3 -> x27
         */
        // <+384>
        guard case .immersiveSpace(_) = item.value else {
            return
        }
        
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
    
    func sceneRequested(
        namespace: SceneList.Namespace,
        item: SceneList.Item,
        forRemoteSessionInfo remoteSessionInfo: RemoteScenes.SessionInfo?,
        continuation: CheckedContinuation<SceneNavigationStrategy_Phone.Result, Never>
    ) {
        // <+328>
        guard case .immersiveSpace(let configuration) = item.value else {
            return
        }
        
        // <+360>
        Log.immersiveSpace.log(level: .info, "ImmersiveSpace (\(item.identifyingDescription) is requested")
        
        // <+684>
        self.currentImmersiveSpace = .requested(namespace: namespace, item: item)
        NotificationCenter.default.post(name: ImmersiveSpaceAuthority.didChangeCurrentImmersiveSpace, object: self)
        self.currentRemoteSessionInfo = remoteSessionInfo
        self.sceneCreationContinuations.append(continuation)
    }
    
    func sceneDestructionRequested(namespace: SceneList.Namespace, item: SceneList.Item, continuation: CheckedContinuation<(), Never>) {
        assertUnimplemented()
    }
}
