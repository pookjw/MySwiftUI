// 63347F5D9A046616B0D46410809E3D2B
internal import UIKit
private import MySwiftUICore
internal import RealityKit
private import Combine
private import _UIKitPrivate
private import MRUIKit

final class AttachmentRegistrationManager {
    @safe static nonisolated(unsafe) let shared = AttachmentRegistrationManager()
    
    var registrations: [Registration]
    private var registeredSceneIdentifiers: Set<AttachmentRegistrationManager.SceneRegistration>
    private var activeScenes: Set<HashableWeakBox<UIWindowScene>>
    private let manager: AttachmentManager
    
    init() {
        self.registrations = [
            Registration(
                setGuts: { (_: inout _AttachmentComponent, _) in
                    // $s7SwiftUI12RegistrationV7setGuts03getE0ACyxz_AA019AttachmentComponentE0Vtc_AGSgxctc10RealityKit0H0RzlufcyAI6EntityC_AGtcfU0_AA01_gH0V_Tg503$s7a4UI29gc45ManagerC13registrationsSayAA0D0VGvpfiyAA01_C9h9Vz_AA0cG4E6VtcfU_Tf3nnpf_n
                    assertUnimplemented()
                },
                getGuts: { (_: _AttachmentComponent) in
                    // $s7SwiftUI12RegistrationV7setGuts03getE0ACyxz_AA019AttachmentComponentE0Vtc_AGSgxctc10RealityKit0H0RzlufcAhI6EntityCcfU_AA01_gH0V_Tg503$s7a4UI29gc37ManagerC13registrationsSayAA0D0VGvpfiq3C13hE17VSgAA01_cG0VcfU0_Tf3nnpf_n
                    assertUnimplemented()
                }
            ),
            Registration(
                setGuts: { (_: inout _PopoverComponent, _) in
                    // $s7SwiftUI12RegistrationV7setGuts03getE0ACyxz_AA019AttachmentComponentE0Vtc_AGSgxctc10RealityKit0H0RzlufcyAI6EntityC_AGtcfU0_AA08_PopoverH0V_Tg503$s7a4UI12c5V7gete6AcA019gh12E0VSgxc_tc10i28Kit0G0Rzlufcyxz_AFtcfU_AA08_lV5V_Tg5Tf3nnpf_n
                    assertUnimplemented()
                },
                getGuts: { (_: _PopoverComponent) in
                    // $s7SwiftUI12RegistrationV7setGuts03getE0ACyxz_AA019AttachmentComponentE0Vtc_AGSgxctc10RealityKit0H0RzlufcAhI6EntityCcfU_AA08_PopoverH0V_Tg503$s7a5UI17_lh7V16hostc14AA0F0VvgZAA010g2D4E9VSgACcfU_Tf3nnpf_n
                    assertUnimplemented()
                }
            )
        ]
        
        self.registeredSceneIdentifiers = []
        self.activeScenes = []
        self.manager = .shared
    }
    
    @MainActor func registerSceneIfNeeded(_ windowScene: UIWindowScene) {
        // <+180>
        _ = windowScene._sceneIdentifier
        let reScene = windowScene.reScene
        let sceneRef = RealityKit.__SceneRef.__fromCore(reScene)
        let scene = RealityKit.Scene.__fromCore(sceneRef)
        
        let count = self.registrations.count
        
        for registration in self.registrations {
            let sceneIdentifier = windowScene._sceneIdentifier
            let sceneRegistration = SceneRegistration(sceneID: sceneIdentifier, componentID: ObjectIdentifier(registration.componentType))
            let inserted = registeredSceneIdentifiers.insert(sceneRegistration)
            
            if inserted.inserted {
                self.manager.setupWithScene(scene, registration: registration)
            }
        }
        
        // <+608>
        self.activeScenes.insert(HashableWeakBox(windowScene))
        
        if self.registrations.count != count {
            self.registerSceneIfNeeded(windowScene)
        }
    }
    
    func registerExternalAttachment(_ registration: Registration) {
        assertUnimplemented()
    }
}

extension AttachmentRegistrationManager {
    struct SceneRegistration: Hashable {
        fileprivate let sceneID: String
        fileprivate let componentID: ObjectIdentifier
    }
}

struct Registration {
    fileprivate let componentType: any RealityKit.Component.Type
    fileprivate let getGuts: (RealityKit.Entity) -> AttachmentComponentGuts?
    fileprivate let setGuts: (RealityKit.Entity, AttachmentComponentGuts) -> Void
    
    init<T: RealityKit.Component>(
        setGuts: @escaping (inout T, AttachmentComponentGuts) -> Void,
        getGuts: @escaping (T) -> AttachmentComponentGuts?
    ) {
        self.componentType = T.self
        
        self.getGuts = { entity in
            guard let component = entity.components[T.self] else {
                return nil
            }
            
            return getGuts(component)
        }
        
        self.setGuts = { entity, guts in
            guard var component = entity.components[T.self] else {
                return
            }
            
            setGuts(&component, guts)
            entity.components[T.self] = component
        }
    }
}

fileprivate final class AttachmentManager {
    @safe static nonisolated(unsafe) let shared = AttachmentManager()
    
    private var attachmentState: [AttachmentManager.PhaseKey: PhaseHolder] = [:]
    private var bag: Set<AnyCancellable> = []
    private var mergingDisabled: Bool? = nil
    private var asyncFlushingDisabled: Bool? = nil
    private var queue: [AttachmentManager.EventAction] = []
    
    init() {}
    
    @MainActor func setupWithScene(_ scene: RealityKit.Scene, registration: Registration) {
        /*
         self -> x20 -> x19
         scene -> x0 -> x21
         registration -> x1 -> x24
         */
        scene
            .subscribe(to: RealityFoundation.ComponentEvents.DidAdd.self, on: nil, componentType: nil) { _ in
                // $s7SwiftUI17AttachmentManager33_63347F5D9A046616B0D46410809E3D2BLLC14setupWithScene_12registrationy10RealityKit0N0C_AA12RegistrationVtFy0P10Foundation15ComponentEventsO6DidAddVcfU_TA
                assertUnimplemented()
            }
            .store(in: &bag)
        
        scene
            .subscribe(to: RealityFoundation.ComponentEvents.WillRemove.self, on: nil, componentType: nil) { _ in
                // $s7SwiftUI17AttachmentManager33_63347F5D9A046616B0D46410809E3D2BLLC14setupWithScene_12registrationy10RealityKit0N0C_AA12RegistrationVtFy0P10Foundation15ComponentEventsO10WillRemoveVcfU0_TA
                assertUnimplemented()
            }
            .store(in: &bag)
        
        scene
            .subscribe(to: RealityFoundation.ComponentEvents.DidActivate.self, on: nil, componentType: nil) { _ in
                // $s7SwiftUI17AttachmentManager33_63347F5D9A046616B0D46410809E3D2BLLC14setupWithScene_12registrationy10RealityKit0N0C_AA12RegistrationVtFy0P10Foundation15ComponentEventsO11DidActivateVcfU1_TA
                assertUnimplemented()
            }
            .store(in: &bag)
        
        scene
            .subscribe(to: RealityFoundation.ComponentEvents.WillDeactivate.self, on: nil, componentType: nil) { _ in
                // $s7SwiftUI17AttachmentManager33_63347F5D9A046616B0D46410809E3D2BLLC14setupWithScene_12registrationy10RealityKit0N0C_AA12RegistrationVtFy0P10Foundation15ComponentEventsO14WillDeactivateVcfU2_TA
                assertUnimplemented()
            }
            .store(in: &bag)
        
        scene
            .subscribe(to: RealityFoundation.ComponentEvents.DidChange.self, on: nil, componentType: nil) { _ in
                // $s7SwiftUI17AttachmentManager33_63347F5D9A046616B0D46410809E3D2BLLC14setupWithScene_12registrationy10RealityKit0N0C_AA12RegistrationVtFy0P10Foundation15ComponentEventsO9DidChangeVcfU3_TA
                assertUnimplemented()
            }
            .store(in: &bag)
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

struct AttachmentComponentGuts {
    // TODO
}

struct _AttachmentComponent: RealityKit.Component {
    // TODO
}

struct _PopoverComponent: RealityKit.Component {
    // TODO
}
