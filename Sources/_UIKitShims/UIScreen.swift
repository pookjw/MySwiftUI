package import UIKit
private import ObjectiveC.runtime

fileprivate var UIScreenClass: AnyClass {
    return unsafe objc_getClass("UIScreen") as! AnyClass
}

@_fixed_layout
package final class MyUIScreen {
    private let screen: AnyObject
    
    package static var main: MyUIScreen {
        return MyUIScreen(screen: (UIScreenClass as AnyObject).main)
    }
    
    package static var _mainScreen: MyUIScreen {
        // (Direct) +[UIScreen _mainScreen]
        return .main
    }
    
    init(screen: AnyObject) {
        self.screen = screen
    }
    
    package var _referenceBounds: CGRect {
        return screen._referenceBounds
    }
    
    package var _pointsPerInch: CGFloat {
        return screen._pointsPerInch
    }
    
    package var scale: CGFloat {
        return screen.scale
    }
    
    package var bounds: CGRect {
        return screen.bounds
    }
    
    package var traitCollection: UITraitCollection {
        return screen.traitCollection
    }
    
    func displayLink(withTarget target: Any, selector sel: Selector) -> CADisplayLink? {
        return screen.displayLink(withTarget: target, selector: sel)
    }
}

extension UIWindow {
    package var myUIScreen: MyUIScreen? {
        guard let screen = (self as AnyObject).screen else {
            return nil
        }
        
        if let screen {
            return MyUIScreen(screen: screen)
        } else {
            return nil
        }
    }
}

fileprivate final class PrivateSelectors {
    @objc(mainScreen) var main: AnyObject { fatalError() }
    @objc(_referenceBounds) var _referenceBounds: CGRect { fatalError() }
    @objc(_pointsPerInch) var _pointsPerInch: CGFloat { fatalError() }
    @objc(scale) var scale: CGFloat { fatalError() }
    @objc(bounds) var bounds: CGRect { fatalError() }
    @objc(traitCollection) var traitCollection: UITraitCollection { fatalError() }
    @objc(displayLinkWithTarget:selector:) func displayLink(withTarget target: Any, selector: Selector) -> CADisplayLink? { fatalError() }
    @objc(screen) var screen: AnyObject? { fatalError() }
}
