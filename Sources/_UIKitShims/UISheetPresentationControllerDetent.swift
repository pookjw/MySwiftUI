package import UIKit

@_extern(c, "UISheetPresentationControllerAutomaticDimension") package let msui_UISheetPresentationControllerAutomaticDimension: CGFloat

@_extern(c, "UISheetPresentationControllerDetentIdentifierMedium") @safe fileprivate nonisolated(unsafe) let _UISheetPresentationControllerDetentIdentifierMedium: UnsafeRawPointer
@_extern(c, "UISheetPresentationControllerDetentIdentifierLarge") @safe fileprivate nonisolated(unsafe) let _UISheetPresentationControllerDetentIdentifierLarge: UnsafeRawPointer

fileprivate let UISheetPresentationControllerDetentClass: AnyClass = unsafe objc_getClass("UISheetPresentationControllerDetent") as! AnyClass

@frozen
package struct MySheetPresentationControllerDetent {
    fileprivate let detent: AnyObject
    
    package static var large: MySheetPresentationControllerDetent {
        return MySheetPresentationControllerDetent(detent: (UISheetPresentationControllerDetentClass as AnyObject).large())
    }
    
    package static var medium: MySheetPresentationControllerDetent {
        return MySheetPresentationControllerDetent(detent: (UISheetPresentationControllerDetentClass as AnyObject).medium())
    }
}

@frozen
package struct MySheetPresentationControllerDetentIdentifier : RawRepresentable, Sendable, Hashable {
    package static var medium: MySheetPresentationControllerDetentIdentifier {
        return unsafe MySheetPresentationControllerDetentIdentifier(
            rawValue: Unmanaged<NSString>
                .fromOpaque(_UISheetPresentationControllerDetentIdentifierMedium)
                .takeUnretainedValue() as String
        )
    }
    
    package static var large: MySheetPresentationControllerDetentIdentifier {
        return unsafe MySheetPresentationControllerDetentIdentifier(
            rawValue: Unmanaged<NSString>
                .fromOpaque(_UISheetPresentationControllerDetentIdentifierLarge)
                .takeUnretainedValue() as String
        )
    }
    
    package let rawValue: String
    
    @inlinable package init(rawValue: String) {
        self.rawValue = rawValue
    }
}

extension UISheetPresentationController {
    package var msui_detents: [MySheetPresentationControllerDetent] {
        get {
            let detents = (self as AnyObject).detents()
                .map { MySheetPresentationControllerDetent(detent: $0) }
            return detents
        }
        set {
            let detents = newValue.map { $0.detent }
            (self as AnyObject).setDetents(detents)
        }
    }
    
    package var msui_largestUndimmedDetentIdentifier: MySheetPresentationControllerDetentIdentifier? {
        get {
            guard let detent = (self as AnyObject).largestUndimmedDetentIdentifier() else {
                return nil
            }
            
            return MySheetPresentationControllerDetentIdentifier(rawValue: detent as String)
        }
        set {
            let detent: NSString?
            if let newValue {
                detent = newValue.rawValue as NSString
            } else {
                detent = nil
            }
            
            (self as AnyObject).setLargestUndimmedDetentIdentifier(detent)
        }
    }
    
    package var msui_selectedDetentIdentifier: MySheetPresentationControllerDetentIdentifier? {
        get {
            guard let detent = (self as AnyObject).selectedDetentIdentifier() else {
                return nil
            }
            
            return MySheetPresentationControllerDetentIdentifier(rawValue: detent as String)
        }
        set {
            let detent: NSString?
            if let newValue {
                detent = newValue.rawValue as NSString
            } else {
                detent = nil
            }
            
            (self as AnyObject).setSelectedDetentIdentifier(detent)
        }
    }
}

fileprivate final class PrivateSelectors {
    @objc(largeDetent) func large() -> AnyObject { fatalError() }
    @objc(mediumDetent) func medium() -> AnyObject { fatalError() }
    @objc(detents) func detents() -> [AnyObject] { fatalError() }
    @objc(setDetents:) func setDetents(_ detents: [AnyObject]) { fatalError() }
    @objc(largestUndimmedDetentIdentifier) func largestUndimmedDetentIdentifier() -> NSString? { fatalError() }
    @objc(setLargestUndimmedDetentIdentifier:) func setLargestUndimmedDetentIdentifier(_ identifier: NSString?) { fatalError() }
    @objc(selectedDetentIdentifier) func selectedDetentIdentifier() -> NSString? { fatalError() }
    @objc(setSelectedDetentIdentifier:) func setSelectedDetentIdentifier(_ identifier: NSString?) { fatalError() }
}
