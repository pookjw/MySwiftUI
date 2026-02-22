@_spi(Internal) internal import MySwiftUICore
internal import UIKit
internal import AttributeGraph

protocol PlatformViewRepresentable: CoreViewRepresentable {
    static func modifyBridgedViewInputs(_ inputs: inout _ViewInputs)
}

extension PlatformViewRepresentable {
    static func appendFeature(to proxy: inout CoreViewRepresentableFeatureBufferProxy) {
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
    
    func modifyViewInputs<Representable>(inputs: inout MySwiftUICore._ViewInputs, proxy: MySwiftUICore.CoreViewRepresentableFeatureProxy<Representable>) where Representable : MySwiftUICore.CoreViewRepresentable {
        fatalError("TODO")
    }
    
    func modifyBridgedInputs<Representable>(inputs: inout MySwiftUICore._ViewInputs, proxy: MySwiftUICore.CoreViewRepresentableFeatureProxy<Representable>) where Representable : MySwiftUICore.CoreViewRepresentable {
        fatalError("TODO")
    }
    
    func modifyViewOutputs<Representable>(outputs: inout MySwiftUICore._ViewOutputs, proxy: MySwiftUICore.CoreViewRepresentableFeatureProxy<Representable>) where Representable : MySwiftUICore.CoreViewRepresentable {
        fatalError("TODO")
    }
    
    func modifyWrappedOutputs<Representable>(outputs: inout MySwiftUICore._ViewOutputs, proxy: MySwiftUICore.CoreViewRepresentableFeatureProxy<Representable>) where Representable : MySwiftUICore.CoreViewRepresentable {
        fatalError("TODO")
    }
    
    func update<Host>(forHost host: Host, environment: inout MySwiftUICore.EnvironmentValues, isInitialUpdate: Bool) where Host : MySwiftUICore.CoreViewRepresentableHost {
        fatalError("TODO")
    }
}
