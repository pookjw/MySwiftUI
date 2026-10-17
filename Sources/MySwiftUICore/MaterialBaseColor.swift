// 238758EAD9523C5BFC51ECC3A1DA5A65

@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension EnvironmentValues {
    @usableFromInline
    var materialBaseColor: Color? {
        get {
            return self[MaterialBaseColorKey.self]
        }
        set {
            self[MaterialBaseColorKey.self] = newValue
        }
    }
}

fileprivate struct MaterialBaseColorKey : EnvironmentKey {
    static var defaultValue: Color? {
        return nil
    }
}
