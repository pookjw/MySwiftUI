@_spi(Internal) internal import MySwiftUICore
internal import Foundation

@objc(SwiftUIEnvironmentWrapper) final class EnvironmentWrapper: ViewGraphHostEnvironmentWrapper {
    private let focusedValues: FocusedValues
    
    init(focusedValues: FocusedValues) {
        self.focusedValues = focusedValues
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("TODO")
    }
}
