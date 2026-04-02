@_spi(Internal) private import MySwiftUICore
internal import UIKit
private import _UIKitPrivate
private import AttributeGraph

@MainActor final class RootViewDelegate {
    private var colorSchemeSeed = VersionSeedTracker<PreferredColorSchemeKey>(seed: .invalid)
    weak var nextDelegate: UIHostingViewDelegate? = nil
    
    func updateAppFocus<Content : View>(view: _UIHostingView<Content>) {
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
        let x290xf8: Bool
        if let copy_2 {
            // <+1156>
            // x28
            let copy_4 = copy_2
            
            if let copy_3 {
                // <+1332>
                // x22
                let copy_5 = copy_3
                let w26 = copy_4.version == copy_5.version
                x290xf8 = !w26
                // <+1464>
            } else {
                // <+1216>
                x290xf8 = true
                // <+1464>
            }
        } else {
            // <+1048>
            if let copy_3 {
                // <+1272>
                x290xf8 = true
                // <+1464>
            } else {
                // <+1320>
                x290xf8 = false
                // <+1464>
            }
        }
        
        // <+1464>
        // x19
        let focusBridge = view.focusBridge
        // x21
        let bridgeFocusStore = focusBridge.focusStore
        // x23
        let appFocusStore: FocusStore?
        if let appGraph = AppGraph.shared {
            appFocusStore = appGraph.focusStore
        } else {
            appFocusStore = nil
        }
        
        // <+1636>
        // x22
        let copy_5: FocusStore? = bridgeFocusStore
        // x27
        let copy_6 = appFocusStore
        // x27 + x21
        let copy_7 = copy_5
        
        // <+1740>
        let flag: Bool // true -> <+2168> / false -> <+2340>
        if let copy_6 {
            // <+1872>
            // x28
            let copy_8 = copy_6
            if let copy_7 {
                // <+2032>
                // x21
                let copy_9 = copy_7
                let w8 = !(copy_8.version == copy_9.version)
                // <+2152>
                flag = w8 || x290xf8
            } else {
                // <+1924>
                // <+2168>
                flag = true
            }
        } else {
            // <+1768>
            if let copy_7 {
                // <+1984>
                // <+2168>
                flag = true
            } else {
                // <+1840>
                // <+2152>
                flag = false
            }
        }
        
        if flag {
            // <+2168>
            if let appGraph = AppGraph.shared {
                let valuesChanged = appGraph.$focusedValues.setValue(viewFocusedValues)
                let storeChanged = appGraph.$focusStore.setValue(bridgeFocusStore)
                
                if valuesChanged || storeChanged {
                    appGraph.graphDidChange()
                }
            }
            
            // <+2264>
            if
                let appDelegate = AppDelegate.shared,
                let mainMenuController = appDelegate.mainMenuController
            {
                mainMenuController.commandsDidChange()
            }
        }
        
        // <+2340>
    }
}

extension RootViewDelegate : UIHostingViewDelegate {
    @MainActor func hostingView<Content>(_ hostingView: _UIHostingView<Content>, didMoveTo window: UIWindow?) where Content : MySwiftUICore::View {
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
    
    @MainActor func hostingView<Content>(_ hostingView: _UIHostingView<Content>, willUpdate environmentValues: inout MySwiftUICore::EnvironmentValues) where Content : MySwiftUICore::View {
        environmentValues.explicitPreferredColorScheme = hostingView.colorScheme
        
        if let nextDelegate {
            nextDelegate.hostingView(hostingView, willUpdate: &environmentValues)
        }
    }
    
    @MainActor func hostingView<Content>(_ hostingView: _UIHostingView<Content>, didUpdate values: MySwiftUICore::EnvironmentValues) where Content : MySwiftUICore::View {
        if let nextDelegate {
            nextDelegate.hostingView(hostingView, didUpdate: values)
        }
    }
    
    @MainActor func hostingView<Content>(_ hostingView: _UIHostingView<Content>, willUpdate properties: inout ViewGraphBridgeProperties) where Content : View {
        if let nextDelegate {
            nextDelegate.hostingView(hostingView, willUpdate: &properties)
        }
    }
    
    @MainActor func hostingView<Content>(_ hostingView: _UIHostingView<Content>, didChangePreferences values: MySwiftUICore::PreferenceValues) where Content : MySwiftUICore::View {
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
    
    @MainActor func hostingView<Content>(_ hostingView: _UIHostingView<Content>, didChangePlatformItemList: PlatformItemList) where Content : MySwiftUICore::View {
        assertUnimplemented()
    }
    
    func hostingView<Content>(_ hostingView: _UIHostingView<Content>, willModifyViewInputs inputs: inout MySwiftUICore::_ViewInputs) where Content : MySwiftUICore::View {
        // nop
    }
}
