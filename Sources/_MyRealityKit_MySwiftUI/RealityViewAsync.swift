internal import MySwiftUICore
internal import MyRealityFoundation
internal import CoreGraphics
internal import UIKit
internal import Combine

struct _RealityViewAsync<Placeholder> : View {
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
        assertUnimplemented()
    }
}
