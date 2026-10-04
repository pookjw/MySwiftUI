// E0697BB83CA4DF1B18B89ADE22D27A03
internal import MySwiftUICore
internal import CoreGraphics

extension EnvironmentValues {
    var listRowInsets: EdgeInsets {
        get {
            return self[ListRowInsetsKey.self]
        }
        set {
            self[ListRowInsetsKey.self] = newValue
        }
    }
    
    var effectiveListRowInsets: EdgeInsets {
        get {
            return self[EffectiveListRowInsetsKey.self]
        }
        set {
            self[EffectiveListRowInsetsKey.self] = newValue
        }
    }
}

fileprivate struct ListRowInsetsKey : EnvironmentKey {
    static var defaultValue: EdgeInsets {
        return .zero
    }
}

fileprivate struct EffectiveListRowInsetsKey : EnvironmentKey {
    static var defaultValue: EdgeInsets {
        return .zero
    }
}
