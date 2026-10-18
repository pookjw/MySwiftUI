internal import MRUIKit
internal import _UIKitPrivate
internal import FrontBoardServices
private import MySwiftUICore

final class ImmersiveSpaceSceneBuilder : _MRUIApplicationImmersiveSpaceSceneRequestBuilder {
    override init() {
        assertUnimplemented()
    }
    
    override func buildWorkspaceRequestOptions(for request: __UISceneSessionActivationRequest, withContinuation continuation: @escaping (FBSWorkspaceSceneRequestOptions?, (any Error)?) -> Void) {
        assertUnimplemented()
    }
    
    // TODO
}
