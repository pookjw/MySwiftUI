// A513612C07DFA438E70B9FA90719B40D
@_spi(Internal) internal import MySwiftUICore
internal import UIKit
@_spi(Internal) internal import _UIKitShims
internal import AttributeGraph
internal import MRUIKit
internal import _UIKitPrivate

protocol PlatformViewRepresentable: CoreViewRepresentable {
    static nonisolated func modifyBridgedViewInputs(_ inputs: inout _ViewInputs)
}

extension PlatformViewRepresentable {
    static func appendFeature(to proxy: inout CoreViewRepresentableFeatureBufferProxy) {
        let feature = PlatformViewRepresentableFeature(representableType: self)
        proxy.base.append(feature)
    }
}

extension PlatformViewRepresentable where PlatformViewProvider == UIViewController {
    static func platformView(for provider: Self.PlatformViewProvider) -> AnyObject {
        fatalError("TODO")
    }
    
    func depthThatFits(_ proposedSize: _ProposedSize3D, provider: Self.PlatformViewProvider) -> CGFloat {
        fatalError("TODO")
    }
}

extension PlatformViewRepresentable where PlatformViewProvider == UIView {
    func depthThatFits(_ proposedSize: _ProposedSize3D, provider: Self.PlatformViewProvider) -> CGFloat {
        fatalError("TODO")
    }
}

protocol AnyPlatformViewHost {
    // TODO
}

@MainActor struct PlatformViewRepresentableFeature: CoreViewRepresentableFeature {
    private(set) var inputs: _ViewInputs? // 0x0
    @OptionalAttribute var identifiedViews: _IdentifiedViewTree? // 0x54 (actual), 0x14 (offset field)
    @OptionalAttribute var focusedValues: FocusedValues? // 0x58 (actual), 0x18 (offset field)
    @OptionalAttribute var platformViewAccessibilityNodes: AccessibilityNodeList? // 0x5c (actual), 0x1c (offset field)
    private(set) var representableType: any PlatformViewRepresentable.Type // 0x60 (actual), 0x20 (offset field)
    private(set) var importer: MRUIPreferenceImporter? // 0x70 (actual), 0x24 (offset field)
    
    mutating func modifyViewInputs<Representable: CoreViewRepresentable>(inputs: inout _ViewInputs, proxy: CoreViewRepresentableFeatureProxy<Representable>) {
        /*
         self -> x20 -> x22
         inputs -> x0 -> x19
         proxy -> x1 -> x20
         */
        // x24
        let base = proxy.base
        self.inputs = inputs
        // <+300>
        self._focusedValues = inputs.base[FocusedValuesInputKey.self]
        
        if inputs.preferences.contains(_IdentifiedViewsKey.self, includeHostPreferences: true) {
            // <+444>
            let views = PlatformViewIdentifiedViews<Representable>(leafView: proxy.base, time: inputs.time)
            let viewsAttribute = Attribute(views)
            _identifiedViews = OptionalAttribute(viewsAttribute)
        }
        
        // <+628>
        inputs.preferences.remove(_IdentifiedViewsKey.self)
    }
    
    func modifyBridgedInputs<Representable: CoreViewRepresentable>(inputs: inout _ViewInputs, proxy: CoreViewRepresentableFeatureProxy<Representable>) {
        inputs.preferences.remove(AccessibilityNodesKey.self)
        representableType.modifyBridgedViewInputs(&inputs)
    }
    
    mutating func modifyViewOutputs<Representable>(outputs: inout _ViewOutputs, proxy: CoreViewRepresentableFeatureProxy<Representable>) {
        /*
         outputs -> x29 - 0xb8
         proxy -> x1 -> x29 - 0xd8
         self -> x20 -> x29 - 0xd0
         */
        // x27
        let copy_1 = inputs
        guard let copy_1 else {
            return
        }
        
        // <+388>
        // x24
        let copy_2 = copy_1
        // x29 - 0xe4
        let base = proxy.base
        
        if copy_2.preferences.contains(ViewRespondersKey.self) {
            // <+508>
            // x21
            let copy_3 = copy_2
            // x29 - 0x90
            let filter = ViewResponderFilter(inputs: copy_3, view: base)
            let filterAttribute = Attribute(filter)
            outputs[ViewRespondersKey.self] = filterAttribute
        }
        
        // <+772>
        outputs.makeContentPathPreferenceWriter(inputs: copy_2, contentResponder: { () -> Attribute<TrivialContentResponder> in
            // $s7SwiftUI32PlatformViewRepresentableFeatureV06modifyD7Outputs7outputs5proxyyAA01_dH0Vz_AA04CoredeF5ProxyVyxGtAA0kdE0RzlF14AttributeGraph0M0VyAA23TrivialContentResponderVGyXEfu_
            fatalError("TODO")
        }())
        
        // <+844>
        if let attribute = $identifiedViews {
            // <+888>
            outputs.preferences.makePreferenceWriter(inputs: copy_2.preferences, key: _IdentifiedViewsKey.self, value: {
                // $s7SwiftUI28ManipulationGeometryModifierV9_makeView8modifier6inputs4bodyAA01_G7OutputsVAA11_GraphValueVyACG_AA01_G6InputsVAiA01_L0V_ANtctFZ09AttributeL00O0VySDy10Foundation4UUIDVASyAA06ObjectcD0VGGGyXEfu_TA
                return attribute
            }())
        }
        
        // <+1028>
        outputs.preferences.makePreferenceWriter(inputs: copy_2.preferences, key: FocusableBounds.Key.self, value: {
            // $s7SwiftUI32PlatformViewRepresentableFeatureV06modifyD7Outputs7outputs5proxyyAA01_dH0Vz_AA04CoredeF5ProxyVyxGtAA0kdE0RzlF14AttributeGraph0M0VySayAA15FocusableBoundsVGGyXEfu1_TA
            fatalError("TODO")
        }())
        
        AccessibilityPlatformViewModifier.makeAccessibilityPlatformTransform(inputs: copy_2, representable: proxy.base, outputs: &outputs)
        
        // <+1200>
        self.$platformViewAccessibilityNodes = outputs[AccessibilityNodesKey.self]
        
        if copy_2.preferences.contains(AccessibilityNodesKey.self) {
            // <+1316>
            outputs[AccessibilityNodesKey.self] = nil
        }
        
        // <+1348>
        let importer: MRUIPreferenceImporter
        if let _importer = self.importer {
            importer = _importer
        } else {
            // <+1360>
            importer = MRUIPreferenceImporter(graph: .current)
            self.importer = importer
        }
        
        // <+1540>
        importer.writePreferences(to: &outputs, inputs: copy_2)
    }
    
    func modifyWrappedOutputs<Representable: CoreViewRepresentable>(outputs: inout _ViewOutputs, proxy: CoreViewRepresentableFeatureProxy<Representable>) {
        fatalError("TODO")
    }
    
    func update<Host: CoreViewRepresentableHost>(forHost host: Host, environment: inout EnvironmentValues, isInitialUpdate: Bool) {
        /*
         self -> x20 -> x29 - 0xb0
         host -> x0 -> x26
         environment -> x1 -> x29 - 0xd8
         isInitialUpdate -> w2 -> w20
         */
        // x26
        let casted = host as! UIKitPlatformViewHost<Host.Content>
        
        if isInitialUpdate {
            // <+404>
            casted.importer = importer
        } else {
            // <+504>
            if casted.isPlatformFocusContainerHost {
                environment.focusGroupID = nil
            }
            
            // <+632>
            // x28
            let focusedValues: (FocusedValues, Bool)
            if let _focusedValues = self.focusedValues {
                focusedValues = (_focusedValues, true)
            } else {
                focusedValues = (FocusedValues(), false)
            }
            
            // <+900>
            // w19
            let exists = focusedValues.1
            // x22
            let values = focusedValues.0
            
            Graph.withoutUpdate {
                // $s7SwiftUI32PlatformViewRepresentableFeatureV6update7forHost11environment15isInitialUpdateyx_AA17EnvironmentValuesVzSbtAA04CoredeI0RzlFyyXEfU_
                /*
                 exists ->  w0
                 host -> x1
                 values- > x2
                 */
                if exists {
                    casted.focusedValues = values
                }
            }
        }
    }
}

struct PlatformViewIdentifiedViews<Representable: CoreViewRepresentable>: Rule {
    @Attribute fileprivate private(set) var leafView: ViewLeafView<Representable>
    @Attribute fileprivate private(set) var time: Time
    
    var value: _IdentifiedViewTree {
        fatalError("TODO")
    }
}

fileprivate struct ViewResponderFilter<Representable: CoreViewRepresentable>: StatefulRule {
    private var _view: Attribute<ViewLeafView<Representable>> // 0x0
    @Attribute private(set) var position: CGPoint // 0x4
    @Attribute private(set) var size: ViewSize // 0x8
    @Attribute private(set) var transform: ViewTransform // 0xc
    @Attribute private(set) var layoutDirection: LayoutDirection // 0x10
    let responder: UIViewResponder // 0x18
    private(set) weak var viewGraph: ViewGraph? // 0x20
    @Attribute private(set) var keyPressHandlers: [KeyPress.Handler] // 0x28
    private(set) var _preferredFocusableView: OptionalAttribute<Representable.PlatformViewProvider> // 0x2c
    
    init(inputs: _ViewInputs, view: Attribute<ViewLeafView<Representable>>) {
        /*
         view -> w1 -> x29 - 0x64
         inputs -> x0 -> x19
         return pointer -> x8 -> x23
         */
        // <+160>
        self.responder = UIViewResponder()
        self.viewGraph = .current
        self._view = view
        self._preferredFocusableView = OptionalAttribute()
        self._position = inputs.animatedPosition()
        self._size = inputs.animatedSize()
        self._transform = inputs.transform
        self._layoutDirection = inputs.layoutDirection
        
        // <+356>
        self._keyPressHandlers = inputs.base.keyPressHandlers
        // <+520>
        self._preferredFocusableView = inputs[RepresentablePreferredFocusableViewInput<Representable>.self]
    }
    
    var view: ViewLeafView<Representable> {
        return _view.value
    }
    
    var preferredFocusableView: ((Representable.PlatformViewProvider) -> UIView?)?? {
        guard let attribute = _preferredFocusableView.attribute else {
            return nil
        }
        
        fatalError("TODO")
    }
    
    typealias Value = [ViewResponder]
    
    func updateValue() {
        MainActor.assumeIsolated { [unchecked = UncheckedSendable(self)] in
            let `self` = unchecked.value
            
            // self -> x20 -> x22/x21
            // x29 - 0xd0
            let responder = self.responder
            // <+448>
            responder.hostView = self.view.platformView as? UIView
            
            let representedView: UIView?
            if let host = (self.view.platformView as? UIKitPlatformViewHost<Representable>) {
                representedView = host.representedView
            } else {
                representedView = nil
            }
            responder.representedView = representedView
            
            // <+692>
            // self -> x21 -> x29 - 0x128
            let contentResponder = UIViewContentResponder(
                eventProvider: self.viewGraph?.delegate?.as(CurrentEventProvider.self),
                platformView: (self.view.platformView as! UIView)
            )
            
            responder.helper.update(
                data: (value: contentResponder, changed: false),
                size: self.$size.changedValue(options: []),
                position: self.$position.changedValue(options: []),
                transform: self.$transform.changedValue(options: []),
                parent: responder
            )
            
            // <+1288>
            responder.keyPressHandlers = self.keyPressHandlers
            // x20
            var focusedView: UIView?
            if let focusableView = self.preferredFocusableView ?? nil {
                focusedView = focusableView(self.view.representedViewProvider)
            }
            
            // <+1544>
            responder.preferredFocusableView = focusedView
            
            // <+1556>
            if let host = self.view.platformView as? UIKitPlatformViewHost<Representable> {
                host.responder = responder
            }
            
            // <+1700>
            if !self.hasValue {
                // <+1740>
                self.value = [responder]
            }
            
            // <+1844>
        }
    }
}

struct RepresentablePreferredFocusableViewInput<Representable: CoreViewRepresentable>: ViewInput {
    static var defaultValue: OptionalAttribute<Representable.PlatformViewProvider> {
        return OptionalAttribute()
    }
}

final class UIKitPlatformViewHost<Representable: CoreViewRepresentable>: UICorePlatformViewHost<Representable> {
    var importer: MRUIPreferenceImporter? = nil // 0x2d8
    var focusedValues = FocusedValues() // 0x2e0
    weak var responder: UIViewResponder? = nil // 0x300
    
    required init(_ coreRepresentedViewProvider: Representable.PlatformViewProvider, host: (any ViewGraphRootValueUpdater)?, environment: MySwiftUICore.EnvironmentValues, viewPhase: ViewGraphHost.Phase) {
        /*
         coreRepresentedViewProvider -> x0 -> x29 - 0x98
         host -> x1 -> x29 - 0x60
         environment -> x2 -> x29 - 0x58
         viewPhase -> x3 -> x29 - 0x68
         */
        super.init(coreRepresentedViewProvider, host: host, environment: environment, viewPhase: viewPhase)
    }
    
    override var parentPreferenceHost: (any MRUIPreferenceHostProtocol)? {
        return importer
    }
    
    override var _parentGestureRecognizerContainer: (any _UIGestureRecognizerContainer)? {
        // self -> x20
        guard GestureContainerFeature.isEnabled else {
            return super._parentGestureRecognizerContainer
        }
        
        // <+44>
        _ = self.responder ?? (host?.responderNode)
        
        // <+172>
        guard let responder else {
            return nil
        }
        
        return responder.parentGestureContainer
    }
    
    var isPlatformFocusContainerHost: Bool {
        let value = UIKitPlatformViewHost
            .UnarySubtreeSequence(root: self)
            .first { view in
                return view is UIScrollView
            }
        
        return value != nil
    }
    
    var focusView: UIView {
        fatalError("TODO")
    }
    
    override func makeEnvironmentWrapper(_ environment: MySwiftUICore.EnvironmentValues, viewPhase: ViewGraphHost.Phase) -> ViewGraphHostEnvironmentWrapper {
        /*
         self -> x20
         environment -> x0 -> x29 - 0x88
         viewPhase -> x1 -> x29 - 0x80
         */
        // <+148>
        let wrapper = EnvironmentWrapper(focusedValues: self.focusedValues)
        wrapper.environment = environment
        wrapper.phase = viewPhase
        return wrapper
    }
    
    override func resolvedTraitCollection(baseTraitCollection: UITraitCollection, environment: MySwiftUICore.EnvironmentValues, wrapper: ViewGraphHostEnvironmentWrapper) -> UITraitCollection {
        /*
         baseTraitCollection -> x0 -> x20
         environment -> x1 -> x21
         wrapper -> x2 -> x19
         */
        // x20
        // inlined
        return baseTraitCollection.resolvedTraitCollection(environment: environment, wrapper: wrapper)
    }
}

extension UIKitPlatformViewHost {
    fileprivate struct UnarySubtreeSequence: Sequence {
        typealias Element = UIView
        typealias Iterator = AnyIterator<UIView>
        
        weak var root: UIView?
        
        func makeIterator() -> AnyIterator<UIView> {
            weak var view = root
            
            return AnyIterator<UIView> {
                // $s7SwiftUI21UIKitPlatformViewHostC20UnarySubtreeSequence33_A513612C07DFA438E70B9FA90719B40DLLV12makeIteratorQryFSo6UIViewCSgycfU_TA
                // x21
                guard let _view = view else {
                    return nil
                }
                
                if (_view.subviews.count != 1) || _view.subviews.isEmpty {
                    view = nil
                } else {
                    view = _view.subviews[0]
                }
                
                return _view
            }
        }
    }
}

struct PlatformViewControllerRepresentableAdaptor<Base: UIViewControllerRepresentable>: @MainActor PlatformViewRepresentable {
    typealias PlatformViewProvider = Base.UIViewControllerType
    typealias Host = UIKitPlatformViewHost<Self>
    typealias Coordinator = Base.Coordinator
    
    fileprivate private(set) var base: Base
    
    static var dynamicProperties: CoreViewRepresentableDynamicPropertyFields {
        return CoreViewRepresentableDynamicPropertyFields(for: self)
    }
    
    func makeViewProvider(context: PlatformViewRepresentableContext<Self>) -> Base.UIViewControllerType {
        let repContext = UIViewControllerRepresentableContext<Base>(coordinator: context.coordinator)
        let uiViewController = base.makeUIViewController(context: repContext)
        return uiViewController
    }
    
    func updateViewProvider(_ provider: Base.UIViewControllerType, context: PlatformViewRepresentableContext<Self>) {
        let repContext = UIViewControllerRepresentableContext<Base>(coordinator: context.coordinator)
        base.updateUIViewController(provider, context: repContext)
    }
    
    static func dismantleViewProvider(_ provider: Base.UIViewControllerType, coordinator: Base.Coordinator) {
        Base.dismantleUIViewController(provider, coordinator: coordinator)
    }
    
    static func platformView(for provider: Base.UIViewControllerType) -> AnyObject {
        return provider.view
    }
    
    func sizeThatFits(
        _ proposedSize: ProposedViewSize,
        provider: Base.UIViewControllerType,
        context: PlatformViewRepresentableContext<Self>
    ) -> CGSize? {
        fatalError("TODO")
    }
    
    func overrideSizeThatFits(_ size: inout CGSize, in proposedSize: ProposedViewSize, platformView: Base.UIViewControllerType) {
        fatalError("TODO")
    }
    
    func depthThatFits(_ proposedSize: _ProposedSize3D, provider: Base.UIViewControllerType) -> CGFloat {
        return provider.view._separatedThickness
    }
    
    static func layoutOptions(_ provider: Base.UIViewControllerType) -> CoreViewRepresentableLayoutOptions {
        let options = Base._layoutOptions(provider)
        return CoreViewRepresentableLayoutOptions(rawValue: options.rawValue)
    }
    
    func _identifiedViewTree(in provider: Base.UIViewControllerType) -> Any {
        fatalError("TODO")
    }
    
    func overrideLayoutTraits(_ traits: inout _LayoutTraits, for provider: Base.UIViewControllerType) {
        fatalError("TODO")
    }
    
    var body: Never {
        fatalError("TODO")
    }
    
    static func modifyBridgedViewInputs(_ inputs: inout MySwiftUICore._ViewInputs) {
        // nop
    }
    
    func makeCoordinator() -> Base.Coordinator {
        return base.makeCoordinator()
    }
    
    static var isViewController: Bool {
        return true
    }
}

extension UIView {
    fileprivate var _separatedThickness: CGFloat {
        guard
            let value = self.layer[SeparatedOptions.SeparatedThickness.self],
            !(value <= 0)
        else {
            return 0
        }
        
        guard !(self.traitCollection.displayScale <= 0) else {
            return 0
        }
        
        return max(1.0 / traitCollection.displayScale, value)
    }
}
