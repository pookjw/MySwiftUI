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
