import UIKit
@_spi(MySwiftUIOnly) import MySwiftUICore

final class UIHostingViewBase {
    //  SwiftUI.UIHostingViewBase", mangled="$s7SwiftUI14_UIHostingViewC4baseAA0cD4BaseCvg"에서 swift_unknownObjectWeakAssign <+220>로 할당됨
    weak var uiView: UIView?
    func withMainThreadRender(wasAsync: Bool, _ completionHandler: () -> Time) -> Time {
        let shouldDisableUIKitAnimations: Bool
        if let uiView = uiView as? _UIHostingView {
            
        } else {
            shouldDisableUIKitAnimations = true
        }
        fatalError()
    }
}
