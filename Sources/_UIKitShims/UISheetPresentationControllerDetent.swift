package import UIKit
private import _MySwiftUIShims

@_extern(c, "UISheetPresentationControllerAutomaticDimension") package let mrui_UISheetPresentationControllerAutomaticDimension: CGFloat

@_extern(c, "UISheetPresentationControllerDetentIdentifierMedium") @safe fileprivate nonisolated(unsafe) let _UISheetPresentationControllerDetentIdentifierMedium: UnsafeRawPointer
@_extern(c, "UISheetPresentationControllerDetentIdentifierLarge") @safe fileprivate nonisolated(unsafe) let _UISheetPresentationControllerDetentIdentifierLarge: UnsafeRawPointer

fileprivate let UISheetPresentationControllerDetentClass: AnyClass = unsafe objc_getClass("UISheetPresentationControllerDetent") as! AnyClass

@frozen
package struct MySheetPresentationControllerDetent {
    fileprivate let detent: AnyObject
    
    package static var large: MySheetPresentationControllerDetent {
        let casted = unsafe unsafeBitCast(msui_objc_msgSend(), to: (@convention(c) (AnyClass, Selector) -> AnyObject).self)
        let cmd = Selector(("largeDetent"))
        return MySheetPresentationControllerDetent(detent: casted(UISheetPresentationControllerDetentClass, cmd))
    }
    
    package static var medium: MySheetPresentationControllerDetent {
        let casted = unsafe unsafeBitCast(msui_objc_msgSend(), to: (@convention(c) (AnyClass, Selector) -> AnyObject).self)
        let cmd = Selector(("mediumDetent"))
        return MySheetPresentationControllerDetent(detent: casted(UISheetPresentationControllerDetentClass, cmd))
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
    
    package init(rawValue: String) {
        self.rawValue = rawValue
    }
}

extension UISheetPresentationController {
    package var mrui_detents: [MySheetPresentationControllerDetent] {
        get {
            let casted = unsafe unsafeBitCast(msui_objc_msgSend(), to: (@convention(c) (UISheetPresentationController, Selector) -> [AnyObject]).self)
            let cmd = Selector(("detents"))
            let detents = casted(self, cmd)
                .map { MySheetPresentationControllerDetent(detent: $0) }
            return detents
        }
        set {
            let detents = newValue.map { $0.detent }
            let casted = unsafe unsafeBitCast(msui_objc_msgSend(), to: (@convention(c) (UISheetPresentationController, Selector, [AnyObject]) -> Void).self)
            let cmd = Selector(("setDetents:"))
            casted(self, cmd, detents)
        }
    }
    
    package var mrui_largestUndimmedDetentIdentifier: MySheetPresentationControllerDetentIdentifier? {
        get {
            let casted = unsafe unsafeBitCast(msui_objc_msgSend(), to: (@convention(c) (UISheetPresentationController, Selector) -> NSString?).self)
            let cmd = Selector(("largestUndimmedDetentIdentifier"))
            
            guard let detent = casted(self, cmd) else {
                return nil
            }
            
            return MySheetPresentationControllerDetentIdentifier(rawValue: detent as String)
        }
        set {
            let casted = unsafe unsafeBitCast(msui_objc_msgSend(), to: (@convention(c) (UISheetPresentationController, Selector, NSString?) -> Void).self)
            let cmd = Selector(("setLargestUndimmedDetentIdentifier:"))
            
            let detent: NSString?
            if let newValue {
                detent = newValue.rawValue as NSString
            } else {
                detent = nil
            }
            
            casted(self, cmd, detent)
        }
    }
    
    package var mrui_selectedDetentIdentifier: MySheetPresentationControllerDetentIdentifier? {
        get {
            let casted = unsafe unsafeBitCast(msui_objc_msgSend(), to: (@convention(c) (UISheetPresentationController, Selector) -> NSString?).self)
            let cmd = Selector(("selectedDetentIdentifier"))
            
            guard let detent = casted(self, cmd) else {
                return nil
            }
            
            return MySheetPresentationControllerDetentIdentifier(rawValue: detent as String)
        }
        set {
            let casted = unsafe unsafeBitCast(msui_objc_msgSend(), to: (@convention(c) (UISheetPresentationController, Selector, NSString?) -> Void).self)
            let cmd = Selector(("setSelectedDetentIdentifier:"))
            
            let detent: NSString?
            if let newValue {
                detent = newValue.rawValue as NSString
            } else {
                detent = nil
            }
            
            casted(self, cmd, detent)
        }
    }
}
