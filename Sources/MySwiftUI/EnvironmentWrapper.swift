@_spi(Internal) internal import MySwiftUICore
internal import Foundation

@objc(SwiftUIEnvironmentWrapper) final class EnvironmentWrapper : ViewGraphHostEnvironmentWrapper {
    private let focusedValues: FocusedValues
    
    init(focusedValues: FocusedValues) {
        self.focusedValues = focusedValues
        super.init()
    }
    
    init(_ environment: EnvironmentValues, phase: ViewGraphHost.Phase, focusedValues: FocusedValues) {
        self.focusedValues = focusedValues
        super.init()
        self.environment = environment
        self.phase = phase
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
