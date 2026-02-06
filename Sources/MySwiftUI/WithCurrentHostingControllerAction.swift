// 45E6B9BC6FA58C55132084803F2FFFAF
internal import MySwiftUICore
internal import UIKit

struct WithCurrentHostingControllerAction {
    private var hostBox: WeakBox<UIViewController>
    
    init<Content: View>(_ hostingController: UIHostingController<Content>) {
        hostBox = WeakBox(hostingController)
    }
    
    @inline(__always)
    fileprivate init() {
        hostBox = WeakBox(nil)
    }
    
    func callAsFunction(_ block: (UIViewController?) -> Void) {
        block(hostBox.base)
    }
}

extension EnvironmentValues {
    @inline(__always)
    var withCurrentHostingController: WithCurrentHostingControllerAction {
        get {
            return self[WithCurrentHostingControllerKey.self]
        }
        set {
            self[WithCurrentHostingControllerKey.self] = newValue
        }
    }
}

fileprivate struct WithCurrentHostingControllerKey: EnvironmentKey {
    static nonisolated(unsafe) let defaultValue = WithCurrentHostingControllerAction()
}
