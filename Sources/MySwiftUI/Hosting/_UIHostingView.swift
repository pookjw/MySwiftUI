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
    
    private let _base: UIHostingViewBase
    private var _rootView: Content
    
    var shouldDisableUIKitAnimations: Bool {
        /*
         "SwiftUI._UIHostingView.shouldDisableUIKitAnimations.getter : Swift.Bool", mangled="$s7SwiftUI14_UIHostingViewC28shouldDisableUIKitAnimationsSbvg"
         */
        fatalError("TODO")
    }
    
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
