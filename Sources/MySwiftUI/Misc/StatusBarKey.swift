#warning("TODO")
internal import MySwiftUICore

struct StatusBarKey: HostPreferenceKey {
    typealias Value = Bool?
    
    static func reduce(value: inout Bool?, nextValue: () -> Bool?) {
        fatalError("TODO")
    }
}
