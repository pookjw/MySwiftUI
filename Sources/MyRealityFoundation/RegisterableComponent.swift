protocol RegisterableComponent {
    static func register() throws
    static func unregister()
}
