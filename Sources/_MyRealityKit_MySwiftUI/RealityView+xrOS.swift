// 587BE5026F01C2416D8EB2E1012BACCA
internal import MySwiftUICore
internal import MyRealityFoundation
internal import CoreGraphics
private import Foundation
internal import Combine
internal import Spatial
private import Observation
internal import UIKit
private import CoreRE

struct _RealityViewAsync<Placeholder : View> : View {
    private let make: @Sendable (inout RealityViewContent) async -> Void // 0x0
    private let update: (@MainActor (inout RealityViewContent) -> Void)? // 0x10
    private let placeholder: Placeholder // 0x28 (field)
    private let proxy: GeometryProxy3D // 0x2c (field)
    private let controller: AttachmentStateControllerBase? // 0x30 (field)
    private weak var model: _RealityViewModel? // 0x34 (field)
    @Environment private var scene: MyRealityFoundation.Scene? // 0x38 (field)
    private var _pointsPerMeter: Environment<CGFloat> // 0x3c (field)
    private var _role: Environment<UISceneSession.Role?> // 0x40 (field)
    private var _uiScene: Environment<UIScene?> // 0x44 (field)
    @Environment private var layoutOption: RealityViewLayoutOption // 0x48 (field)
    @State private var componentAddedSubscription: (any Cancellable)? // 0x4c (field)
    
    func setIdealSize() {
        assertUnimplemented()
    }
    
    var pointsPerMeter: CGFloat {
        assertUnimplemented()
    }
    
    init(
        make: @Sendable @escaping (inout RealityViewContent) async -> Void,
        update: (@MainActor (inout RealityViewContent) -> Void)?,
        placeholder: Placeholder,
        proxy: GeometryProxy3D,
        controller: AttachmentStateControllerBase?,
        model: _RealityViewModel?,
        scene: Environment<MyRealityFoundation.Scene?>,
        pointsPerMeter: Environment<CGFloat>,
        role: Environment<UISceneSession.Role?>,
        uiScene: Environment<UIScene?>,
        layoutOption: Environment<RealityViewLayoutOption>,
        componentAddedSubscription: (any Cancellable)?
    ) {
        self.make = make
        self.update = update
        self.placeholder = placeholder
        self.proxy = proxy
        self.controller = controller
        self.model = model
        self._scene = scene
        self._pointsPerMeter = pointsPerMeter
        self._role = role
        self._uiScene = uiScene
        self._layoutOption = layoutOption
        self._componentAddedSubscription = State(wrappedValue: componentAddedSubscription)
    }
    
    var role: UISceneSession.Role? {
        assertUnimplemented()
    }
    
    var uiScene: UIScene? {
        assertUnimplemented()
    }
    
    var body: some View {
        let _: Void = register()
        
        // <+2484>
        Group {
            // $s19_RealityKit_SwiftUI01_A9ViewAsyncV4bodyQrvg0cD005TupleE0VyAE6ZStackVyAE0E0PAEE5frame7minSize05idealL003maxL09alignmentQrSo8SPSize3DaSg_A2sE11Alignment3DVtFQOyx_Qo_SgG_AkEE10preference3key5valueQrqd__m_5ValueQyd__tAE13PreferenceKeyRd__lFQOyAE15ModifiedContentVyAA13EntityWrapperVAA29TransformInteractionIfEnabled33_587BE5026F01C2416D8EB2E1012BACCALLVG_AA0ae11ConvertibleW0VQo_SgtGSgyXEfU0_TA
            // <+608>
            if let model {
                ZStack(alignment: .center) {
                    // $s19_RealityKit_SwiftUI01_A9ViewAsyncV4bodyQrvg0cD005TupleE0VyAE6ZStackVyAE0E0PAEE5frame7minSize05idealL003maxL09alignmentQrSo8SPSize3DaSg_A2sE11Alignment3DVtFQOyx_Qo_SgG_AkEE10preference3key5valueQrqd__m_5ValueQyd__tAE13PreferenceKeyRd__lFQOyAE15ModifiedContentVyAA13EntityWrapperVAA29TransformInteractionIfEnabled33_587BE5026F01C2416D8EB2E1012BACCALLVG_AA0ae11ConvertibleW0VQo_SgtGSgyXEfU0_AWyXEfU_TA
                    if model.loadingPhase == .loading {
                        self.placeholder
                            .frame(
                                minSize: nil,
                                idealSize: nil,
                                maxSize: Size3D(
                                    width: .infinity,
                                    height: .infinity,
                                    depth: .infinity
                                ),
                                alignment: .back
                            )
                    }
                }
                
                if
                    !RealityViewContent.clientNeedsUninformedMakeClosure ||
                        (model.loadingPhase == .loaded) ||
                        (model.loadingPhase == .connected)
                {
                    // <+1032>
                    EntityWrapper(
                        baseEntity: model.content.baseEntity,
                        updateCallback: self.update ?? { _ in
                            // $s19_RealityKit_SwiftUI0A11ViewContentVIegl_ACytIeglr_TRTA
                            assertUnimplemented()
                        },
                        proxy: self.proxy,
                        model: model,
                        controller: self.controller
                    )
                    .modifier(
                        TransformInteractionIfEnabled(
                            transformInteractionEnabled: model.hasTransformInteractionComponents
                        )
                    )
                    .preference(
                        key: RealityViewConvertibleKey.self,
                        value: [
                            RealityViewConvertible(
                                base: model.content.baseEntity,
                                proxy: self.proxy,
                                role: self.role
                            )
                        ]
                    )
                }
            }
        }
        .task { [weak model] in
            // $s19_RealityKit_SwiftUI01_A9ViewAsyncV4bodyQrvgyyYacfU1_TATu
            assertUnimplemented()
        }
        .onChange(of: self.scene, initial: false) {
            // $s19_RealityKit_SwiftUI01_A9ViewAsyncV4bodyQrvgyycfU2_TA
            assertUnimplemented()
        }
        .onDisappear { 
            // $s19_RealityKit_SwiftUI01_A9ViewAsyncV4bodyQrvgyycfU3_TA
            self.stopObservingRelativeTransform()
        }
    }
    
    @_transparent
    private func register() {
        // self -> x20 -> x22
        guard let model else {
            return
        }
        
        // model -> x19
        // x20
        let role = self.role
        // <+1136>
        model.content.role = role
        // self -> x22 -> x21
        model.content.proxy = self.proxy
        
        // <+1296>
        model.content.model = self.model
        
        // <+1352>
        // self -> x21 -> x20
        model.content.pointsPerMeter = self.pointsPerMeter
        model.content.baseEntity.components.set(RealityViewComponent(model: self.model))
        
        // <+1596>
        // x19
        let coreEntity_1 = unsafeBitCast(model.content.baseEntity.coreEntity, to: CoreRE.Entity.self)
        // x19
        let renderOptionsComponent = coreEntity_1.getOrAddComponent(ofType: .renderOptions)
        
        if
            let role = self.role,
            role == .immersiveSpaceApplication
        {
            // <+1832>
            let coreEntity_2 = unsafeBitCast(model.content.baseEntity.coreEntity, to: CoreRE.Entity.self)
            if let spaceRootComponent = coreEntity_2.getComponent(ofType: .sceneSpaceRoot) {
                spaceRootComponent.sceneSpaceRoot_isSelfInImmersiveSpace = true
                
                // <+1936>
                let coreEntity_3 = unsafeBitCast(model.content.baseEntity.coreEntity, to: CoreRE.Entity.self)
                _ = coreEntity_3.getOrAddComponent(ofType: .immersiveSpaceTracker)
                // <+2028>
            }
            
            // <+2028>
        }
        
        // <+2028>
        renderOptionsComponent.renderOptions_overrideContributeToCombinedVignetting(false, true)
        
        // self -> x22 -> x20
        if self.uiScene is UIWindowScene {
            // <+2100>
            _ = SpatialTrackingManager.shared
            // <+2140>
        }
        
        // <+2140>
        model.content.scene = self.scene
        
        let transformInteractionComponentWasAdded: (any Cancellable)?
        if let scene {
            // <+2184>
            transformInteractionComponentWasAdded = scene.subscribe(
                to: MyRealityFoundation.ComponentEvents.DidActivate.self,
                on: nil,
                componentType: MyRealityFoundation.ManipulationComponent.self
            ) { [weak model] _ in
                // $s19_RealityKit_SwiftUI01_A9ViewAsyncV4bodyQrvgy0A10Foundation15ComponentEventsO11DidActivateVcfU_TA
                assertUnimplemented()
            }
            
            // <+2368>
        } else {
            transformInteractionComponentWasAdded = nil
            // <+2368>
        }
        
        // <+2368>
        model.transformInteractionComponentWasAdded = transformInteractionComponentWasAdded
        
        if !model.isObservingRelativeTransform {
            self.stopObservingRelativeTransform()
            self.startObservingRelativeTransform()
        }
        
        // <+2460>
    }
    
    fileprivate func stopObservingRelativeTransform() {
        assertUnimplemented()
    }
    
    fileprivate func startObservingRelativeTransform() {
        assertUnimplemented()
    }
}

@Observable
final class _RealityViewModel {
    @ObservationIgnored var content: RealityViewContent
    @ObservationIgnored var relativeTransformObservers: [NSObject]
    @ObservationIgnored var isObservingRelativeTransform: Bool
    @ObservationIgnored var transformInteractionComponentWasAdded: (any Cancellable)?
    
    var useNewMakeClosureBehavior: Bool {
        assertUnimplemented()
    }
    
    var idealSize: Size3D?
    var loadingPhase: _RealityViewModel.LoadingPhase
    var hasTransformInteractionComponents: Bool
    
    init() {
        assertUnimplemented()
    }
    
    func setSceneToImmersiveSpaceTransform(using windowScene: UIWindowScene) {
        assertUnimplemented()
    }
}

extension _RealityViewModel {
    enum LoadingPhase : Hashable {
        case empty
        case loading
        case loaded
        case connected
    }
}

fileprivate struct TransformInteractionIfEnabled : ViewModifier {
    private(set) var transformInteractionEnabled: Bool
    
    func body(content: Content) -> some View {
        assertUnimplemented()
    }
}
