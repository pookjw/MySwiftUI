public import Foundation
internal import UIKit

@objc @_hasMissingDesignatedInitializers @available(macOS 10.15.4, iOS 13.4, macCatalyst 13.4, tvOS 26.0, *)
public class __EntityAccessibilityWrapper : NSObject {
    @nonobjc private(set) weak var entity: Entity?
    
    @nonobjc init(entity: Entity, rootEntityWrapper: __EntityAccessibilityWrapper?) {
        assertUnimplemented()
    }
    
    @objc var entitySupportsAccessibilityActivateAction: Bool {
        get {
            assertUnimplemented()
        }
    }
    
    @objc func entityPerformAccessibilityActivate() {
        assertUnimplemented()
    }
    
    @objc func entityPerformAccessibilityIncrement() {
        assertUnimplemented()
    }
    
    @objc func entityPerformAccessibilityDecrement() {
        assertUnimplemented()
    }
    
    @objc var entityAccessibilityCustomRotors: [UIAccessibilityCustomRotor] {
        get {
            assertUnimplemented()
        }
    }
    
    @objc var entityAccessibilityCustomActions: [UIAccessibilityCustomAction] {
        get {
            assertUnimplemented()
        }
    }
}
