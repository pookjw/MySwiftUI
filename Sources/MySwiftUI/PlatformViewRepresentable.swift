// A513612C07DFA438E70B9FA90719B40D
@_spi(Internal) internal import MySwiftUICore
internal import UIKit
internal import AttributeGraph

protocol PlatformViewRepresentable: CoreViewRepresentable {
    static func modifyBridgedViewInputs(_ inputs: inout _ViewInputs)
}

extension PlatformViewRepresentable {
    static nonisolated func appendFeature(to proxy: inout CoreViewRepresentableFeatureBufferProxy) {
        let feature = PlatformViewRepresentableFeature(representableType: self)
        proxy.append(feature)
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

struct PlatformViewRepresentableFeature: CoreViewRepresentableFeature {
    private(set) var inputs: _ViewInputs?
    @OptionalAttribute var identifiedViews: _IdentifiedViewTree?
    @OptionalAttribute var focusedValues: FocusedValues?
    @OptionalAttribute var platformViewAccessibilityNodes: AccessibilityNodeList?
    private(set) var representableType: any PlatformViewRepresentable.Type
    private(set) var importer: MRUIPreferenceImporter?
    
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
        fatalError("TODO")
    }
    
    func modifyViewOutputs<Representable>(outputs: inout _ViewOutputs, proxy: CoreViewRepresentableFeatureProxy<Representable>) {
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
        fatalError("TODO")
    }
    
    func modifyWrappedOutputs<Representable: CoreViewRepresentable>(outputs: inout _ViewOutputs, proxy: CoreViewRepresentableFeatureProxy<Representable>) {
        fatalError("TODO")
    }
    
    func update<Host: CoreViewRepresentableHost>(forHost host: Host, environment: inout EnvironmentValues, isInitialUpdate: Bool) {
        fatalError("TODO")
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
        fatalError("TODO")
    }
    
    typealias Value = [ViewResponder]
    
    func updateValue() {
        fatalError("TODO")
    }
}

struct RepresentablePreferredFocusableViewInput<Representable: CoreViewRepresentable>: ViewInput {
    static var defaultValue: OptionalAttribute<Representable.PlatformViewProvider> {
        return OptionalAttribute()
    }
}
