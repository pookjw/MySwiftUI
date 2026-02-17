// 9FEFF64B5B735CA46CE24D63DF5C11D3
internal import UIKit
private import MySwiftUICore
private import _MySwiftUIShims

final class UIKitBarButtonItem: UIBarButtonItem {
    // TODO
}

extension UINavigationItem {
    nonisolated func adoptNavigationItem(_ other: UINavigationItem, updates: Toolbar.Updates, forceUpdate: Bool, isFromSwiftUI: Bool) {
        // inlined from ToolbarBridge.adoptUpdates(_:hostingController:context:)
        /*
         self -> x21
         other -> x27
         updates.location -> x29 - 0xb8
         updates.flag1/flag2/navigationProperties -> w25
         updates.navigationProperties -> w24
         forceUpdate -> w20
         isFromSwiftUI -> w28
         */
        // <+428>
        if isLinkedOnOrAfter(.v7) && updates.flag1 {
            // <+560>
            fatalError("TODO")
        } else {
            // <+712>
            var _updates = updates
            _updates.navigationProperties = updates.navigationProperties.intersection(Toolbar.Updates.NavigationProperties(rawValue: 0x01))
            adoptSystemUpdates(other, updates: _updates, forceUpdate: forceUpdate, isFromSwiftUI: isFromSwiftUI)
            // <+752>
        }
        
        // <+752>
        // forceUpdate -> w20 -> w23
        // self -> x21 -> x20
        updateSearchControllerIfNeeded(other)
        
        // <+768>
        if (updates.navigationProperties.contains(.unknown1) || forceUpdate) {
            // <+796>
            fatalError("TODO")
        }
        
        // <+940>
        if (updates.navigationProperties.contains(.unknown0) || forceUpdate) {
            // <+952>
            // x28
            let otherDocumentProperties = other.documentProperties
            // x23
            let selfDocumentProperties = self.documentProperties
            
            if let selfDocumentProperties, !type(of: selfDocumentProperties)._isFromMySwiftUI() {
                // nop
                // <+1044>
            } else {
                // <+1020>
                other.documentProperties = nil
                self.documentProperties = otherDocumentProperties
                // <+1044>
            }
            
            // <+1044>
        }
        
        // <+1052>
        if (updates.navigationProperties.contains(.unknown2) || forceUpdate) {
            // <+1072>
            fatalError("TODO")
        }
        
        // <+1092>
    }
    
    fileprivate nonisolated func adoptSystemUpdates(_ other: UINavigationItem, updates: Toolbar.Updates, forceUpdate: Bool, isFromSwiftUI: Bool) {
        /*
         self -> x20
         other -> x0 -> x19
         updates.locations -> x1 -> x21
         updates.flag1/flag2/navigationProperties -> x2
         forceUpdate -> x3 -> x23
         isFromSwiftUI -> x4 -> x22
         */
        if updates.locations.contains(.navigationBarTitle) || forceUpdate {
            // <+84>
            updateTitleIfNeeded(other, isFromSwiftUI: isFromSwiftUI)
        }
        
        // <+96>
        if updates.locations.contains(.navigationBarSubtitle) || forceUpdate {
            // <+148>
            fatalError("TODO")
        }
        
        // <+160>
        if updates.locations.contains(.navigationBarLargeSubtitle) || forceUpdate {
            // <+212>
            fatalError("TODO")
        }
        
        // <+224>
        if updates.locations.contains(.navigationBarLargeTitle) || forceUpdate {
            // <+276>
            fatalError("TODO")
        }
        
        // <+288>
        if updates.locations.contains(.navigationBarCenter) || forceUpdate {
            // <+340>
            fatalError("TODO")
        }
        
        // <+352>
        if updates.locations.contains(.navigationBarAccessory) || forceUpdate {
            // <+404>
            fatalError("TODO")
        }
        
        // <+528>
        if updates.locations.contains(.navigationBarTrailing) || forceUpdate {
            // <+580>
            fatalError("TODO")
        }
        
        // <+592>
        if updates.locations.contains(.navigationBarLeading) || forceUpdate {
            // <+644>
            fatalError("TODO")
        }
        
        // <+656>
        if updates.locations.contains(.navigationBarPalette) || forceUpdate {
            // 구현 안 됨
            // nop
        }
        
        // <+688>
        self.customizationIdentifier = other.customizationIdentifier
    }
    
    fileprivate nonisolated func updateSearchControllerIfNeeded(_ other: UINavigationItem) {
        fatalError("TODO")
    }
    
    fileprivate func updateTitleIfNeeded(_ other: UINavigationItem, isFromSwiftUI: Bool) {
        fatalError("TODO")
    }
}
