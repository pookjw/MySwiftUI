// 587BE5026F01C2416D8EB2E1012BACCA
internal import MySwiftUI
internal import MyRealityFoundation
internal import CoreGraphics
private import Foundation
internal import Combine
internal import Spatial
private import Observation
internal import UIKit
private import CoreRE
internal import MRUIKit
private import simd
private import _UIKitPrivate

struct _RealityViewAsync<Placeholder : View> : View {
    private let make: @Sendable (inout RealityViewContent) async -> Void // 0x0
    private let update: (@MainActor (inout RealityViewContent) -> Void)? // 0x10
    private let placeholder: Placeholder // 0x28 (field)
    private let proxy: GeometryProxy3D // 0x2c (field)
    private let controller: AttachmentStateControllerBase? // 0x30 (field)
    private weak var model: _RealityViewModel? // 0x34 (field)
    @Environment private var scene: MyRealityFoundation::Scene? // 0x38 (field)
    @Environment var pointsPerMeter: CGFloat // 0x3c (field)
    @Environment var role: UISceneSession.Role? // 0x40 (field)
    @Environment var uiScene: UIScene? // 0x44 (field)
    @Environment private var layoutOption: RealityViewLayoutOption // 0x48 (field)
    @State private var componentAddedSubscription: (any Cancellable)? // 0x4c (field)
    
    func setIdealSize() {
        assertUnimplemented()
    }
    
    init(
        make: @Sendable @escaping (inout RealityViewContent) async -> Void,
        update: (@MainActor (inout RealityViewContent) -> Void)?,
        placeholder: Placeholder,
        proxy: GeometryProxy3D,
        controller: AttachmentStateControllerBase?,
        model: _RealityViewModel?,
        scene: Environment<MyRealityFoundation::Scene?>,
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
            _ = unsafe SpatialTrackingManager.shared
            // <+2140>
        }
        
        // <+2140>
        model.content.scene = self.scene
        
        let transformInteractionComponentWasAdded: (any Cancellable)?
        if let scene {
            // <+2184>
            transformInteractionComponentWasAdded = scene.subscribe(
                to: MyRealityFoundation::ComponentEvents.DidActivate.self,
                on: nil,
                componentType: MyRealityFoundation::ManipulationComponent.self
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
        guard let model else {
            return
        }
        
        for observer in model.relativeTransformObservers {
            NotificationCenter.default.removeObserver(
                observer,
                name: NSNotification.Name._MRUISceneDidChangeRelativeTransform,
                object: self.uiScene
            )
        }
        
        model.relativeTransformObservers = []
    }
    
    fileprivate func startObservingRelativeTransform() {
        guard
            let uiScene,
            let uiWindowScene = uiScene as? UIWindowScene
        else {
            return
        }
        
        guard
            (uiWindowScene.session.role == .windowApplication) ||
                (uiWindowScene.session.role == .windowApplicationVolumetric)
        else {
            return
        }
        
        // <+344>
        if let model {
            model.setSceneToImmersiveSpaceTransform(using: uiWindowScene)
        }
        
        let observer = NotificationCenter
            .default
            .addObserver(
                forName: NSNotification.Name._MRUISceneDidChangeRelativeTransform,
                object: uiWindowScene,
                queue: .main
            ) { [weak model] notification in
                // $s19_RealityKit_SwiftUI01_A9ViewAsyncV31startObservingRelativeTransform33_587BE5026F01C2416D8EB2E1012BACCALLyyFy10Foundation12NotificationVYbcfU_TA
                guard
                    let model,
                    let object = notification.object,
                    let windowScene = object as? UIWindowScene
                else {
                    return
                }
                
                model.setSceneToImmersiveSpaceTransform(using: windowScene)
            }
        
        if let model {
            model.relativeTransformObservers.append(observer)
        }
        
        if let model {
            model.isObservingRelativeTransform = true
        }
    }
}

@Observable
@MainActor
final class _RealityViewModel {
    @ObservationIgnored var content: RealityViewContent // 0x10
    @ObservationIgnored var relativeTransformObservers: [any NSObjectProtocol] // 0xa0
    @ObservationIgnored var isObservingRelativeTransform: Bool // 0xa8
    @ObservationIgnored var transformInteractionComponentWasAdded: (any Cancellable)? // 0xb0
    
    var useNewMakeClosureBehavior: Bool {
        assertUnimplemented()
    }
    
    var idealSize: Size3D? // 0xe0
    var loadingPhase: _RealityViewModel.LoadingPhase // 0x101
    var hasTransformInteractionComponents: Bool // 0x102
    // _$observationRegistrar -> 0x108
    
    init() {
        self.content = RealityViewContent()
        self.relativeTransformObservers = []
        self.isObservingRelativeTransform = false
        self.transformInteractionComponentWasAdded = nil
        self._idealSize = nil
        self._loadingPhase = .empty
        self._hasTransformInteractionComponents = false
    }
    
    func setSceneToImmersiveSpaceTransform(using windowScene: UIWindowScene) {
        /*
         self -> x20
         windowScene -> x0 -> x25
         */
        // <+236>
        guard windowScene._mrui_supportsRelativeTransform else {
            return
        }
        
        /*
         columns.0 -> x29 - 0xc0
         columns.1 -> x29 - 0xe0
         columns.2 -> x29 - 0xf0
         columns.3 -> x29 - 0xd0
         */
        var srtMatrix = RESRTMatrix(windowScene._mrui_relativeTransform)
        
        if windowScene.session.role == .windowApplicationVolumetric {
            // <+468>
            // x26
            let content = self.content
            let size = windowScene.effectiveGeometry._size
            let localSpace = LocalCoordinateSpace.local
            let realitySpace = MyRealityFoundation::SceneRealityCoordinateSpace()
            
            // x29 - 0x140
            let converted = content.convert(size, from: localSpace, to: realitySpace)
            
            var value0 = SIMD3<Float>([1, 0, 0])
            value0 *= Float(bitPattern: 0x3f3504f3)
            
            let value1 = simd_float4x4(
                simd_quatf(
                    ix: value0.x,
                    iy: value0.y,
                    iz: value0.z,
                    r: Float(bitPattern: 0x3f3504f4)
                )
            )
            
            let q5 = srtMatrix.columns.3
            let q4 = srtMatrix.columns.0
            var v16 = q4 * value1.columns.0.x
            let q7 = srtMatrix.columns.2
            let q6 = srtMatrix.columns.1
            v16 = v16 + (q6 * value1.columns.0.y)
            v16 = v16 + (q7 * value1.columns.0.z)
            v16 = v16 + (q5 * value1.columns.0.w)
            // x29 - 0x110
            let x290x110 = v16
            
            // <+760>
            var v0 = q4 * value1.columns.1.x
            v0 = v0 + (q6 * value1.columns.1.y)
            v0 = v0 + (q7 * value1.columns.1.z)
            v0 = v0 + (q5 * value1.columns.1.w)
            
            // <+776>
            var v1 = v0
            v0 = q4 * value1.columns.2.x
            v0 = v0 + (q6 * value1.columns.2.y)
            v0 = v0 + (q7 * value1.columns.2.z)
            v0 = v0 + (q5 * value1.columns.2.w)
            
            // <+796>
            v16 = v0
            v0 = q4 * value1.columns.3.x
            v0 = v0 + (q6 * value1.columns.3.y)
            v0 = v0 + (q7 * value1.columns.3.z)
            var v4 = v0
            let v6 = v1
            // x29 - 0x120
            let x290x120 = v1
            
            v0 = v1 * v1
            v1 = simd_float4(repeating: v0.z)
            var v2 = simd_float4(repeating: v0.y)
            
            v0 = v0 + v2
            v0 = v1 + v0
            v0.y = 0
            v4 = v4 + (q5 * value1.columns.3.w)
            
            // x29 - 0xd0
            let x290xd0 = v4
            
            // <+860>
            v0.lowHalf = simd_rsqrt(v0.lowHalf)
            v0 = v6 * v0.x
            
            // <+896>
            let x290x130 = v16
            v1 = v16 * v16
            v2 = simd_float4(repeating: v1.z)
            var v3 = simd_float4(repeating: v1.y)
            
            v1.lowHalf = v1.lowHalf + v3.lowHalf
            v1.lowHalf = v2.lowHalf + v1.lowHalf
            v1.y = 0
            
            v2.lowHalf = simd_rsqrt(v1.lowHalf)
            v1 = v16 * v2.x
            
            // <+956>
            v3 = simd_float4(converted, 0)
            v2 = simd_float4(lowHalf: v3.highHalf, highHalf: v3.lowHalf)
            v2.lowHalf = simd_float2(v3.y, v2.x)
            
            // <+972>
            v3.lowHalf = simd_float2(-0.5, -0.5)
            v2.lowHalf = v2.lowHalf * v3.lowHalf
            v3 = simd_float4(v0.z, v1.z, v0.w, v1.w)
            v3.lowHalf = v2.lowHalf * v3.lowHalf
            v0.lowHalf = v0.lowHalf * v2.x
            v1.lowHalf = v1.lowHalf * v2.y
            v2.lowHalf = simd_float2(repeating: v3.y)
            v0.lowHalf = v0.lowHalf + v1.lowHalf
            v1.lowHalf = v3.lowHalf + v2.lowHalf
            v0.z = v1.x
            v0.w = 0
            
            let value2 = simd_float4x4(translation: SIMD3<Float>(v0.x, v0.y, v0.z))
            v0 = value2.columns.0
            v1 = value2.columns.1
            v2 = value2.columns.2
            v3 = value2.columns.3
            
            var v5 = x290x110
            
            v4 = v0 * v5.x
            v4 = v4 + (v1 * v5.y)
            v4 = v4 + (v2 * v5.z)
            v4 = v4 + (v3 * v5.w)
            
            srtMatrix.columns.0 = v4
            
            v5 = x290x120
            v4 = v0 * v5.x
            v4 = v4 + (v1 * v5.y)
            v4 = v4 + (v2 * v5.z)
            v4 = v4 + (v3 * v5.w)
            
            v5 = x290x130
            
            srtMatrix.columns.1 = v4
            
            v4 = v0 * v5.x
            v4 = v4 + (v1 * v5.y)
            v4 = v4 + (v2 * v5.z)
            v4 = v4 + (v3 * v5.w)
            
            srtMatrix.columns.2 = v4
            
            v4 = x290xd0
            v0 = v0 * v4.x
            v0 = v0 + (v1 * v4.y)
            v0 = v0 + (v2 * v4.z)
            v0 = v0 + (v3 * v4.w)
            
            srtMatrix.columns.3 = v0
            // <+1136>
        } else {
            // <+1132>
            // <+1136>
        }
        
        // <+1136>
        let entity = unsafe unsafeBitCast(self.content.baseEntity.coreEntity, to: CoreRE::Entity.self)
        
        if let component = entity.getComponent(ofType: .sceneSpaceRoot) {
            component.sceneSpaceRoot_sceneToImmersiveTransform = srtMatrix
        }
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
        if self.transformInteractionEnabled {
            content
                .interactionRepresentable(TransformInteractionRepresentable())
        } else {
            content
        }
    }
}

extension RealityViewContent {
    final class ContentStorage {
        private var storedSubscriptions: [MyRealityFoundation::EventSubscription]
        
        init() {
            self.storedSubscriptions = []
        }
    }
}

struct TransformInteractionRepresentable : _UIInteractionRepresentable {
    @State private var delegate = TransformInteractionRepresentable.Delegate()
    
    func makeUIInteraction() -> _MRUIObjectTransformInteraction {
        assertUnimplemented()
    }
    
    func updateUIInteraction(_ interacton: _MRUIObjectTransformInteraction) {
        assertUnimplemented()
    }
}

extension TransformInteractionRepresentable {
    final class Delegate : _MRUIObjectTransformInteraction.Delegate {
        // TODO
    }
}
