// BA67D9C96127B7B4431665E04B813A80
internal import MySwiftUICore

extension EnvironmentValues {
    var isInOrnament: Bool {
        get {
            return self[IsInOrnamentKey.self]
        }
        set {
            self[IsInOrnamentKey.self] = newValue
        }
    }
    
    fileprivate struct IsInOrnamentKey : EnvironmentKey {
        static var defaultValue: Bool {
            return false
        }
    }
}
