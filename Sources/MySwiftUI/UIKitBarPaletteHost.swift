internal import UIKit
internal import _UIKitPrivate

final class UIKitBarPaletteHost : _UINavigationBarPalette {
}

extension UIKitBarPaletteHost : UIHostingViewDelegate {
    func hostingView<Content>(_ hostingView: _UIHostingView<Content>, didMoveTo window: UIWindow?) where Content : View {
        assertUnimplemented()
    }
    
    func hostingView<Content>(_ hostingView: _UIHostingView<Content>, willUpdate environment: inout EnvironmentValues) where Content : View {
        assertUnimplemented()
    }
    
    func hostingView<Content>(_ hostingView: _UIHostingView<Content>, didUpdate environment: EnvironmentValues) where Content : View {
        assertUnimplemented()
    }
    
    func hostingView<Content>(_ hostingView: _UIHostingView<Content>, willUpdate properties: inout ViewGraphBridgeProperties) where Content : View {
        assertUnimplemented()
    }
    
    func hostingView<Content>(_ hostingView: _UIHostingView<Content>, didChangePreferences preferences: PreferenceValues) where Content : View {
        assertUnimplemented()
    }
    
    func hostingView<Content>(_ hostingView: _UIHostingView<Content>, didChangePlatformItemList list: PlatformItemList) where Content : View {
        assertUnimplemented()
    }
    
    func hostingView<Content>(_ hostingView: _UIHostingView<Content>, willModifyViewInputs inputs: inout _ViewInputs) where Content : View {
        assertUnimplemented()
    }
}
