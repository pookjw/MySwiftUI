import UIKit
import MySwiftUICore
import _MySwiftUICShims

final class UIHostingViewBase {
    //  SwiftUI.UIHostingViewBase", mangled="$s7SwiftUI14_UIHostingViewC4baseAA0cD4BaseCvg"에서 swift_unknownObjectWeakAssign <+220>로 할당됨
    weak var uiView: UIView?
    weak var animationDelegate: UIHostingViewBaseAnimationDelegate?
    
    
    private var allowUIKitAnimationsForNextUpdate = false
    
    
    init<RootViewType>(rootViewType: RootViewType.Type, options: Options) where RootViewType : MySwiftUICore.View {
        
    }
    
    @MainActor
    func withMainThreadRender(wasAsync: Bool, _ renderBlock: () -> Time) -> Time {
        let shouldDisableUIKitAnimations: Bool
        if let animationDelegate {
            shouldDisableUIKitAnimations = animationDelegate.shouldDisableUIKitAnimations
        } else {
            shouldDisableUIKitAnimations = true
        }
        
        let areAnimationsEnabled = UIView.areAnimationsEnabled()
        
        if !areAnimationsEnabled || shouldDisableUIKitAnimations {
            if wasAsync {
                allowUIKitAnimationsForNextUpdate = false
            }
            
            return renderBlock()
        }
        
        if wasAsync {
            return renderBlock()
        }
        
        let time = Time.infinity
        
        /*
         TODO: SwiftUI.UIHostingViewBase.Options
         */
        
        UIView.performWithoutAnimation {
//            SubmitTriggerSource.dispatchUpdate {
                _ = renderBlock()
//            }
        }
        
        allowUIKitAnimationsForNextUpdate = false
        return time
    }
}

extension UIHostingViewBase {
    struct Options: OptionSet {
        let rawValue: Int
    }
}

//extension UIHostingViewBase.Options: ExpressibleByArrayLiteral {}
