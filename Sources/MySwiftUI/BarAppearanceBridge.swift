internal import MySwiftUICore
internal import UIKit

final class BarAppearanceBridge {
    private(set) var platformStorage: BarAppearanceBridge.PlatformStorage
    private(set) var allowedBars: Set<ToolbarPlacement.Role>
    // TODO
    
    init() {
        fatalError("TODO")
    }
    
    func viewWillAppear<Content: View>(hostingController: UIHostingController<Content>) {
        fatalError("TODO")
    }
    
    func didMoveToWindow<Content: View>(hostingController: UIHostingController<Content>) {
        fatalError("TODO")
    }
    
    final func update(environment: inout EnvironmentValues) {
        fatalError("TODO")
    }
    // TODO
}

extension BarAppearanceBridge {
    
    struct PlatformStorage {
        private(set) var uiShouldUpdateNavigationController: Bool
    }
}
