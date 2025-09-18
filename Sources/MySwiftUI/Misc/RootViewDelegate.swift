#warning("TODO")
@_spi(Internal) private import MySwiftUICore
internal import UIKit
private import _UIKitPrivate
private import AttributeGraph

final class RootViewDelegate {
    private var colorSchemeSeed = VersionSeedTracker<PreferredColorSchemeKey>(seed: .invalid)
    weak var nextDelegate: UIHostingViewDelegate? = nil
    
    func updateAppFocus<Content: View>(view: _UIHostingView<Content>) {
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
        if let appGraph = AppGraph.shared {
            appFocusValues = appGraph.focusedValues
        } else {
            appFocusValues = nil
        }
        
        // viewFocusedValues = x19
        // appFocusValues = x24
        // viewFocusedValues = x24 + x25
        
        // <+932>
        if let appFocusValues {
            // <+1048>
            fatalError("TODO")
        } else {
            // <+960>
            fatalError("TODO")
        }
        fatalError("TODO")
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
    
    @MainActor func hostingView<Content>(_ hostingView: _UIHostingView<Content>, willUpdate values: inout MySwiftUICore.EnvironmentValues) where Content : MySwiftUICore.View {
        fatalError("TODO")
    }
    
    @MainActor func hostingView<Content>(_ hostingView: _UIHostingView<Content>, didUpdate values: MySwiftUICore.EnvironmentValues) where Content : MySwiftUICore.View {
        fatalError("TODO")
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
