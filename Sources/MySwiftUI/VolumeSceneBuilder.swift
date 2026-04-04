private import MySwiftUICore
internal import _UIKitPrivate
internal import FrontBoardServices

final class VolumeSceneBuilder : _UIApplicationVolumetricSceneRequestBuilder {
    override init() {
        assertUnimplemented()
    }
    
    override func _customizeInitialClientSettings(_ settings: UIMutableApplicationSceneClientSettings, using request: __UISceneSessionActivationRequest) {
        assertUnimplemented()
    }
    
    override func _customizeWorkspaceRequestOptions(_ options: UISceneRequestOptions, using request: __UISceneSessionActivationRequest) {
        assertUnimplemented()
    }
    
    override func buildWorkspaceRequestOptions(for request: __UISceneSessionActivationRequest, withContinuation continuation: @escaping (FBSWorkspaceSceneRequestOptions?, (any Error)?) -> Void) {
        assertUnimplemented()
    }
}
