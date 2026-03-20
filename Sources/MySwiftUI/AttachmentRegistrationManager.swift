// 63347F5D9A046616B0D46410809E3D2B
internal import UIKit
private import MySwiftUICore
private import RealityKit
private import Combine

final class AttachmentRegistrationManager {
    @safe static nonisolated(unsafe) let shared = AttachmentRegistrationManager()
    
    var registrations: [Registration]
    private var registeredSceneIdentifiers: Set<AttachmentRegistrationManager.SceneRegistration>
    private var activeScenes: Set<HashableWeakBox<UIWindowScene>>
    private let manager: AttachmentManager
    
    init() {
        assertUnimplemented()
    }
    
    func registerSceneIfNeeded(_ windowScene: UIWindowScene) {
        assertUnimplemented()
    }
    
    func registerExternalAttachment(_ registration: Registration) {
        assertUnimplemented()
    }
}

extension AttachmentRegistrationManager {
    struct SceneRegistration: Hashable {
        private let sceneID: String
        private let componentID: ObjectIdentifier
    }
}

struct Registration {
    private let componentType: any RealityKit.Component.Type
//    private let getGuts: (RealityKit.Entity) -> AttachmentComponentGuts?
//    private let setGuts: (RealityKit.Entity, AttachmentComponentGuts) -> Void
}

fileprivate final class AttachmentManager {
    private var attachmentState: [AttachmentManager.PhaseKey: PhaseHolder]
    private var bag: Set<AnyCancellable>
    private var mergingDisabled: Bool?
    private var asyncFlushingDisabled: Bool?
    private var queue: [AttachmentManager.EventAction]
    
    init() {
        assertUnimplemented()
    }
}

extension AttachmentManager {
    struct EventAction {
        // TODO
    }
    
    struct PhaseKey: Hashable {
        let aID: UInt64
        let typeID: ObjectIdentifier
    }
}

fileprivate final class PhaseHolder {
    // TODO
}
