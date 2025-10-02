public import Foundation

extension EnvironmentValues {
    public var locale: Locale {
        get {
            return self[LocaleKey.self]
        }
        set {
            self[LocaleKey.self] = newValue
        }
    }
    
    public var calendar: Calendar {
        get {
            return self[CalendarKey.self]
        }
        set {
            self[CalendarKey.self] = newValue
        }
    }
    
    public var timezone: TimeZone {
        get {
            return self[TimezoneKey.self]
        }
        set {
            self[TimezoneKey.self] = newValue
        }
    }
    
    package var isLowPowerModeEnabled: Bool {
        get {
            return self[IsLowPowerModeEnabledKey.self]
        }
        set {
            self[IsLowPowerModeEnabledKey.self] = newValue
        }
    }
}

fileprivate struct LocaleKey: EnvironmentKey {
    static let defaultValue = Locale(identifier: "")
}

fileprivate struct CalendarKey: EnvironmentKey {
    static let defaultValue = Calendar.autoupdatingCurrent
}

fileprivate struct TimezoneKey: EnvironmentKey {
    static let defaultValue = TimeZone.autoupdatingCurrent
}

fileprivate struct IsLowPowerModeEnabledKey: EnvironmentKey {
    static var defaultValue: Bool {
        return false
    }
}
