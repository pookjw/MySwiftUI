// CE8713EF1F659E3933681417E097F9F6

@_spi(Internal) internal import MySwiftUICore
internal import Foundation
private import _UIKitPrivate
private import CoreRE

@_objcRuntimeName(MySwiftUIGlue2) final class MySwiftUIGlue2 : CoreGlue2 {
    override func setupPlatformProperties(_ parameters: CoreGlue2.SetupPlatformPropertiesParameters) {
        _setupPlatformProperties(parameters.view, kind: parameters.kind, platform: parameters.platform)
    }
    
    override func setSeparatedState(_ parameters: CoreGlue2.SetSeparatedStateParameters) {
        // parameters -> x0 -> x20
        // <+316>
        // x27
        let state = parameters.state
        // x23
        let view = unsafeBitCast(parameters.view, to: UIView.self)
        // x29 - 0x90
        let identity = parameters.identity
        // x21/x28
        let reason = parameters.reason
        // x29 - 0x68
        let platform = parameters.platform
        // w22
        let separatedState = SeparatedState.separated
        // w24
        let requestState: _UIViewSeparatedState
        switch state {
        case .none:
            // <+424>
            requestState = .none
        case .tracked:
            // <+476>
            requestState = .tracked
        case .separated:
            // <+492>
            requestState = .separated
        }
        
        // <+500>
        view._request(requestState, withReason: reason.rawValue)
        
        // <+548>
        // separatedState -> w22 -> x19
        if
            state == separatedState,
            let reEntity = view._reEntity,
            let componentType = CoreRE::ComponentType.selectableSceneContentIdentifier
        {
            // <+672>
            let component = reEntity.getOrAddComponent(ofType: componentType)
            component.selectableSceneContentIdentifier_identifier = identity.value
            // <+708>
        } else {
            // <+708>
        }
        
        // <+708>
    }
}

extension MySwiftUIGlue2 {
    fileprivate func _setupPlatformProperties(_ view: AnyObject, kind: PlatformViewDefinition.ViewKind, platform: DisplayList.ViewUpdater.Platform) {
        /*
         self = x19
         kind = x25
         */
        guard case .drawing = kind else {
            return
        }
        
        assertUnimplemented()
    }
}
