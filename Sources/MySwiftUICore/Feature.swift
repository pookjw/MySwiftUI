
package protocol Feature: ViewInputBoolFlag {
    static var isEnabled: Bool { get }
}

extension Feature {
    package static var defaultValue: Bool {
        return isEnabled
    }
}
