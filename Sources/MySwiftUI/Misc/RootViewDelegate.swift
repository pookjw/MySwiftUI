#warning("TODO")
private import MySwiftUICore
internal import UIKit

class RootViewDelegate {
    private var colorSchemeSeed = VersionSeedTracker<PreferredColorSchemeKey>(seed: .invalid)
    weak var nextDelegate: UIHostingViewDelegate? = nil
    
    func updateAppFocus<Content: View>(view: _UIHostingView<Content>) {
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
