@_spi(Internal) internal import MySwiftUICore
internal import Foundation

@objc(SwiftUIEnvironmentWrapper) final class EnvironmentWrapper : ViewGraphHostEnvironmentWrapper {
    private let focusedValues: FocusedValues
    
    init(focusedValues: FocusedValues) {
        self.focusedValues = focusedValues
        super.init()
    }
    
    required init?(coder: NSCoder) {
        assertUnimplemented()
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard super.isEqual(object) else {
            return false
        }
        
        // <+232>
        guard
            let object,
            let casted = object as? EnvironmentWrapper
        else {
            return false
        }
        
        return !self.focusedValues.plist.mayNotBeEqual(to: casted.focusedValues.plist)
    }
}
