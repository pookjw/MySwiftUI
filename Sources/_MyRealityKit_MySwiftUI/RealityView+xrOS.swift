// 587BE5026F01C2416D8EB2E1012BACCA
internal import MySwiftUICore
internal import MyRealityFoundation
internal import CoreGraphics
private import Foundation
internal import Combine
internal import Spatial
private import Observation
internal import UIKit

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
    
    /*
     SwiftUI.ModifiedContent<
         SwiftUI.ModifiedContent<
             SwiftUI.ModifiedContent<
                 SwiftUI.Group<
                     Swift.Optional<
                         SwiftUI.TupleView<
                             (
                                 SwiftUI.ZStack<
                                     Swift.Optional<
                                         SwiftUI.ModifiedContent<
                                             SwiftUI.EmptyView,
                                             SwiftUI._FlexFrameLayout3D
                                         >
                                     >
                                 >,

                                 Swift.Optional<
                                     SwiftUI.ModifiedContent<
                                         SwiftUI.ModifiedContent<
                                             _RealityKit_SwiftUI.EntityWrapper,
                                             _RealityKit_SwiftUI.TransformInteractionIfEnabled
                                         >,
                                         SwiftUI._PreferenceWritingModifier<
                                             _RealityKit_SwiftUI.RealityViewConvertibleKey
                                         >
                                     >
                                 >
                             )
                         >
                     >
                 >,
                 SwiftUI._TaskModifier2
             >,
             SwiftUI._ValueActionModifier2<
                 Swift.Optional<
                     RealityKit.Scene
                 >
             >
         >,
         SwiftUI._AppearanceActionModifier
     >
     */
    // $s19_RealityKit_SwiftUI01_A9ViewAsyncV4bodyQrvg0cD005TupleE0VyAE6ZStackVyAE0E0PAEE5frame7minSize05idealL003maxL09alignmentQrSo8SPSize3DaSg_A2sE11Alignment3DVtFQOyx_Qo_SgG_AkEE10preference3key5valueQrqd__m_5ValueQyd__tAE13PreferenceKeyRd__lFQOyAE15ModifiedContentVyAA13EntityWrapperVAA29TransformInteractionIfEnabled33_587BE5026F01C2416D8EB2E1012BACCALLVG_AA0ae11ConvertibleW0VQo_SgtGSgyXEfU0_
    var body: some View {
        Group {
            // $s19_RealityKit_SwiftUI01_A9ViewAsyncV4bodyQrvg0cD005TupleE0VyAE6ZStackVyAE0E0PAEE5frame7minSize05idealL003maxL09alignmentQrSo8SPSize3DaSg_A2sE11Alignment3DVtFQOyx_Qo_SgG_AkEE10preference3key5valueQrqd__m_5ValueQyd__tAE13PreferenceKeyRd__lFQOyAE15ModifiedContentVyAA13EntityWrapperVAA29TransformInteractionIfEnabled33_587BE5026F01C2416D8EB2E1012BACCALLVG_AA0ae11ConvertibleW0VQo_SgtGSgyXEfU0_TA
            if let model {
                ZStack(alignment: .center) {
                    // $s19_RealityKit_SwiftUI01_A9ViewAsyncV4bodyQrvg0cD005TupleE0VyAE6ZStackVyAE0E0PAEE5frame7minSize05idealL003maxL09alignmentQrSo8SPSize3DaSg_A2sE11Alignment3DVtFQOyx_Qo_SgG_AkEE10preference3key5valueQrqd__m_5ValueQyd__tAE13PreferenceKeyRd__lFQOyAE15ModifiedContentVyAA13EntityWrapperVAA29TransformInteractionIfEnabled33_587BE5026F01C2416D8EB2E1012BACCALLVG_AA0ae11ConvertibleW0VQo_SgtGSgyXEfU0_AWyXEfU_TA
                    if model.loadingPhase == .loading {
                        self.placeholder
                            .frame(
                                minSize: { assertUnimplemented() }(),
                                idealSize: { assertUnimplemented() }(),
                                maxSize: { assertUnimplemented() }(),
                                alignment: { assertUnimplemented() }()
                            )
                    }
                }
                
                if true /* TODO */ {
                    EntityWrapper(
                        baseEntity: { assertUnimplemented() }(),
                        updateCallback: { assertUnimplemented() }(),
                        proxy: { assertUnimplemented() }(),
                        model: { assertUnimplemented() }(),
                        controller: { assertUnimplemented() }()
                    )
                    .modifier(
                        TransformInteractionIfEnabled(
                            transformInteractionEnabled: { assertUnimplemented() }()
                        )
                    )
                    .preference(key: RealityViewConvertibleKey.self, value: { assertUnimplemented() }())
                }
            }
        }
        .task {
            assertUnimplemented()
        }
        .onChange(of: 3 /* TODO */, initial: false) { oldValue, newValue in
            assertUnimplemented()
        }
        .onDisappear { 
            assertUnimplemented()
        }
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
