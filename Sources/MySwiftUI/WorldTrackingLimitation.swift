private import MRUIKit
public import MySwiftUICore

public struct WorldTrackingLimitation : Hashable, Sendable {
    public let value: UInt
    
    public static let translation = WorldTrackingLimitation(value: 0)
    public static let orientation = WorldTrackingLimitation(value: 1)
}

extension EnvironmentValues {
    public var worldTrackingLimitations: Set<WorldTrackingLimitation> {
        get {
            return self[WorldTrackingLimitationsKey.self]
        }
        set {
            self[WorldTrackingLimitationsKey.self] = newValue
        }
    }
}

struct WorldTrackingLimitationsKey : EnvironmentKey {
    static let defaultValue: Set<WorldTrackingLimitation> = []
}
