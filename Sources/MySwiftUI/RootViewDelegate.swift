@_spi(Internal) private import MySwiftUICore
internal import UIKit
private import _UIKitPrivate
private import AttributeGraph

@MainActor final class RootViewDelegate {
    private var colorSchemeSeed = VersionSeedTracker<PreferredColorSchemeKey>(seed: .invalid)
    weak var nextDelegate: UIHostingViewDelegate? = nil
    
    func updateAppFocus<Content: View>(view: _UIHostingView<Content>) {
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
        
        // <+800>
        // view -> x20
        // x29 - 0xa0
        let viewFocusedValues = view.focusedValues
        // x21
        let appFocusedValues: FocusedValues?
        if let appGraph = AppGraph.shared {
            // appGraph -> x23
            // <+824>
            appFocusedValues = appGraph.focusedValues
        } else {
            appFocusedValues = nil
        }
        
        // <+900>
        // x19
        let copy_1: FocusedValues? = viewFocusedValues
        // x24
        let copy_2 = appFocusedValues
        // x24 + x20
        let copy_3 = copy_1
        
        // <+1020>
        if let copy_2 {
            // <+1156>
            // x28
            let copy_4 = copy_2
            
            if let copy_3 {
                // <+1332>
                assertUnimplemented()
            } else {
                // <+1216>
                assertUnimplemented()
            }
        } else {
            // <+1048>
            if let copy_3 {
                // <+1272>
                assertUnimplemented()
            } else {
                // <+1320>
                assertUnimplemented()
            }
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
