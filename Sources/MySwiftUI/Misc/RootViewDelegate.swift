#warning("TODO")
@_spi(Internal) private import MySwiftUICore
internal import UIKit
private import _UIKitPrivate
private import AttributeGraph

final class RootViewDelegate {
    private var colorSchemeSeed = VersionSeedTracker<PreferredColorSchemeKey>(seed: .invalid)
    weak var nextDelegate: UIHostingViewDelegate? = nil
    
    @MainActor func updateAppFocus<Content: View>(view: _UIHostingView<Content>) {
        // view = x20
        
        // x29 - 0x98에 값이 저장되지만 읽지 않고 SwiftUI._UIHostingView.focusedValues.getter : SwiftUI.FocusedValues이 해당 주소에 값을 저장함
        _ = view.sceneActivationState
        
        // x27
        guard let window = view.window else {
            return
        }
        
        // x25
        guard let windowScene = window.windowScene else {
            return
        }
        
        guard windowScene._isKeyWindowScene else {
            return
        }
        
        // x29 - 0x98
        let viewFocusedValues: FocusedValues? = view.focusedValues
        // x28
        let appFocusValues: FocusedValues?
        
        // <+736>
        if let appGraph = unsafe AppGraph.shared {
            appFocusValues = appGraph.focusedValues
        } else {
            appFocusValues = nil
        }
        
        // viewFocusedValues = x19
        // appFocusValues = x24
        // viewFocusedValues = x24 + x25
        
        // <+932>
        // x29, #-0xe8
        let flag: Bool
        if let appFocusValues {
            // appFocusValues = x26
            // <+1048>
            if let viewFocusedValues {
                // <+1192>
                // viewFocusedValues = x22
                flag = (appFocusValues.version == viewFocusedValues.version)
            } else {
                // <+1104>
                flag = true
            }
        } else {
            // <+960>
            if viewFocusedValues != nil {
                flag = true
            } else {
                flag = false
            }
        }
        
        // <+1312>
        // x29 - 0x78
        // x27
        let viewFocusStore: FocusStore? = view.focusBridge.focusStore
        
        // <+1352>
        // 뭔가 복사함
        
        // x21
        let appFocusStore: FocusStore?
        if let appGraph = unsafe AppGraph.shared {
            appFocusStore = appGraph.focusStore
        } else {
            appFocusStore = nil
        }
        
        // <+1460>
        // viewFocusStore = x26
        // appFocusStore = x26 + x20
        let result: Bool
        if let viewFocusStore {
            // <+1676>
            // viewFocusStore = x28
            if let appFocusStore {
                // <+1792>
                // appFocusStore = x21
                result = (viewFocusStore.version == appFocusStore.version) || flag
                // result ? <+1924> : <+2096>
            } else {
                // <+1720>
                result = true
                // <+1924>
            }
        } else {
            // <+1604>
            if appFocusStore != nil {
                // <+1652>
                result = flag
                // result ? <+1924> : <+2096>
            } else {
                // <+1760>
                result = true
                // <+1924>
            }
        }
        
        if result {
            // <+1924>
            if let appGraph = unsafe AppGraph.shared {
                // <+1940>
                // w19
                let value_1 = appGraph.updateFocusedValues(unsafe viewFocusedValues.unsafelyUnwrapped)
                // w0
                let value_2 = appGraph.updateFocusStore(unsafe viewFocusStore.unsafelyUnwrapped)
                
                if value_1 || value_2 {
                    appGraph.graphDidChange()
                }
            }
            
            // <+2020>
            if let appDelegate = unsafe AppDelegate.shared {
                if let mainMenuController = appDelegate.mainMenuController {
                    mainMenuController.commandsDidChange()
                }
            }
        } else {
            // <+2096>
            // nop
            return
        }
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
            // 확실하지 않음
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
        fatalError("TODO")
    }
    
    @MainActor func hostingView<Content>(_ hostingView: _UIHostingView<Content>, willUpdate properties: inout ViewGraphBridgeProperties) where Content : View {
        if let nextDelegate {
            nextDelegate.hostingView(hostingView, willUpdate: &properties)
        }
    }
    
    @MainActor func hostingView<Content>(_ hostingView: _UIHostingView<Content>, didChangePreferences values: MySwiftUICore.PreferenceValues) where Content : MySwiftUICore.View {
        fatalError("TODO")
    }
    
    @MainActor func hostingView<Content>(_ hostingView: _UIHostingView<Content>, didChangePlatformItemList: PlatformItemList) where Content : MySwiftUICore.View {
        fatalError("TODO")
    }
    
    @MainActor func hostingView<Content>(_ hostingView: _UIHostingView<Content>, willModifyViewInputs inputs: inout MySwiftUICore._ViewInputs) where Content : MySwiftUICore.View {
        fatalError("TODO")
    }
}
