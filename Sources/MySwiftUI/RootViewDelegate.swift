@_spi(Internal) private import MySwiftUICore
internal import UIKit
private import _UIKitPrivate
private import AttributeGraph

final class RootViewDelegate {
    private var colorSchemeSeed = VersionSeedTracker<PreferredColorSchemeKey>(seed: .invalid)
    weak var nextDelegate: UIHostingViewDelegate? = nil
    
    @MainActor func updateAppFocus<Content: View>(view: _UIHostingView<Content>) {
        // view -> x20 -> x29 - >0x98
        // <+680>
        // w20
        let isActive = view.sceneActivationState == .foregroundActive
        
        // <+724>
        guard
            let window = view.window,
            let windowScene = window.windowScene,
            (windowScene._isKeyWindowScene && isActive)
        else {
            return
        }
        
        assertUnimplemented()
    }
}

extension RootViewDelegate: UIHostingViewDelegate {
    @MainActor func hostingView<Content>(_ hostingView: _UIHostingView<Content>, didMoveTo window: UIWindow?) where Content : MySwiftUICore.View {
        let viewGraph = hostingView.viewGraph
        if window != nil {
            viewGraph.addPreference(PreferredColorSchemeKey.self)
        } else {
            viewGraph.removePreference(PreferredColorSchemeKey.self)
        }
        
        if let nextDelegate {
            nextDelegate.hostingView(hostingView, didMoveTo: window)
        }
    }
    
    @MainActor func hostingView<Content>(_ hostingView: _UIHostingView<Content>, willUpdate environmentValues: inout MySwiftUICore.EnvironmentValues) where Content : MySwiftUICore.View {
        environmentValues.explicitPreferredColorScheme = hostingView.colorScheme
        
        if let nextDelegate {
            nextDelegate.hostingView(hostingView, willUpdate: &environmentValues)
        }
    }
    
    @MainActor func hostingView<Content>(_ hostingView: _UIHostingView<Content>, didUpdate values: MySwiftUICore.EnvironmentValues) where Content : MySwiftUICore.View {
        if let nextDelegate {
            nextDelegate.hostingView(hostingView, didUpdate: values)
        }
    }
    
    @MainActor func hostingView<Content>(_ hostingView: _UIHostingView<Content>, willUpdate properties: inout ViewGraphBridgeProperties) where Content : View {
        if let nextDelegate {
            nextDelegate.hostingView(hostingView, willUpdate: &properties)
        }
    }
    
    @MainActor func hostingView<Content>(_ hostingView: _UIHostingView<Content>, didChangePreferences values: MySwiftUICore.PreferenceValues) where Content : MySwiftUICore.View {
        updateAppFocus(view: hostingView)
        
        let value = values[PreferredColorSchemeKey.self]
        if !colorSchemeSeed.seed.matches(value.seed) {
            colorSchemeSeed.seed = value.seed
            hostingView.colorScheme = value.value
        }
        
        if let nextDelegate {
            nextDelegate.hostingView(hostingView, didChangePreferences: values)
        }
    }
    
    @MainActor func hostingView<Content>(_ hostingView: _UIHostingView<Content>, didChangePlatformItemList: PlatformItemList) where Content : MySwiftUICore.View {
        assertUnimplemented()
    }
    
    func hostingView<Content>(_ hostingView: _UIHostingView<Content>, willModifyViewInputs inputs: inout MySwiftUICore._ViewInputs) where Content : MySwiftUICore.View {
        // nop
    }
}
