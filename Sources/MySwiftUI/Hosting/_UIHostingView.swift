import UIKit
import MySwiftUICore

@available(macOS, unavailable)
@MainActor
@preconcurrency
open class _UIHostingView<Content> : UIView where Content : View {
    open override class var layerClass: AnyClass {
        return UIHostingViewDebugLayer.self
    }
    
    required public init(rootView: Content) {
        fatalError("TODO")
    }
    
    required dynamic public init?(coder: NSCoder) {
        fatalError("TODO")
    }
    
    private let _base = UIHostingViewBase(
        rootViewType: Content.self,
        options: UIHostingViewBase.Options(rawValue: 0x1d)
    )
    
    private var base: UIHostingViewBase {
        if _base.uiView == nil {
            _base.uiView = self
            _base.animationDelegate = self
            
            // TODO:SwiftUI.DisplayList.ViewRenderer.host.setter = self
        }
        
        return _base
    }
    
    private var _rootView: Content
    
    public var rootView: Content {
        set {
            
        }
        get {
            fatalError()
        }
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
    }
}

extension _UIHostingView: UIHostingViewBaseAnimationDelegate {
    var shouldDisableUIKitAnimations: Bool {
        /*
         "SwiftUI._UIHostingView.shouldDisableUIKitAnimations.getter : Swift.Bool", mangled="$s7SwiftUI14_UIHostingViewC28shouldDisableUIKitAnimationsSbvg"
         */
        return false
    }
}
