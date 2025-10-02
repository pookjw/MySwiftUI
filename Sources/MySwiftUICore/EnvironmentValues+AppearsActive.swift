@usableFromInline
package struct AppearsActiveKey: EnvironmentKey {
    @usableFromInline
     package static let defaultValue: Bool = true
}

extension AppearsActiveKey: Sendable {}

extension EnvironmentValues {
    public var appearsActive: Bool {
        get {
            return self[AppearsActiveKey.self]
        }
        set {
            self[AppearsActiveKey.self] = newValue
        }
    }
}
