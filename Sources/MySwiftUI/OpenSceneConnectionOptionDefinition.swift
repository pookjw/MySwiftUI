internal import _UIKitPrivate
internal import UIKit
private import MySwiftUICore

enum OpenSceneConnectionOptionDefinition : UISceneConnectionOptionDefinition {
    typealias Payload = OpenScenePayload
    typealias SceneType = Never
    typealias SceneDelegate = Never
    typealias SceneDelegateMethod = Never
    
    static var sceneDelegateMethod: (SceneDelegate) -> SceneDelegateMethod {
        assertUnimplemented()
    }
    
    static func invokeSceneDelegate(_ sceneDelegateMethod: SceneDelegateMethod, scene: SceneType, payload: Payload) {
        assertUnimplemented()
    }
    
    static func didFinishHandling(payload: Payload, for scene: SceneType) {
        assertUnimplemented()
    }
    
    static func didFailHandling(error: Error, sceneSession: UISceneSession, payload: Payload?) {
        assertUnimplemented()
    }
}

struct OpenScenePayload {
    var namespace: SceneList.Namespace
    var sceneID: SceneID
    var data: Data?
}

extension OpenScenePayload : Equatable, Decodable, Encodable, CustomStringConvertible {
    static func == (lhs: OpenScenePayload, rhs: OpenScenePayload) -> Bool {
        assertUnimplemented()
    }
    
    init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
    
    func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    var description: String {
        assertUnimplemented()
    }
}
