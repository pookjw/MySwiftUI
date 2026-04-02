// 843E2CF8C2FABDEAA3F932BB96663C44
internal import MySwiftUICore

extension EnvironmentValues {
    var focusGroupID: FocusGroupIdentifier? {
        get {
            return self[__Key_focusGroupID.self]
        }
        set {
            self[__Key_focusGroupID.self] = newValue
        }
    }
    
    // TODO: Macro Entry
    fileprivate struct __Key_focusGroupID : EnvironmentKey {
        static var defaultValue: FocusGroupIdentifier? {
            return .automatic
        }
    }
}

enum FocusGroupIdentifier {
    case named(AnyHashable)
    case automatic
}
