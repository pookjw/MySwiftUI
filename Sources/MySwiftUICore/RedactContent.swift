// 18671928047E57F039DC339288B6FAFB

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct RedactionReasons: OptionSet, Sendable {
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public static let placeholder = RedactionReasons(rawValue: 1 << 0)
    
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    public static let privacy = RedactionReasons(rawValue: 1 << 1)
    
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    public static let invalidated = RedactionReasons(rawValue: 1 << 2)
    
    static let screencaptureProhibited = RedactionReasons(rawValue: 1 << 3)
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension View {
    nonisolated public func redacted(reason: RedactionReasons) -> some View {
        assertUnimplemented()
    }
    
    nonisolated public func unredacted() -> some View {
        assertUnimplemented()
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension EnvironmentValues {
    public var redactionReasons: RedactionReasons {
        get {
            return self[RedactionReasonsKey.self]
        }
        set {
            self[RedactionReasonsKey.self] = newValue
        }
    }
}

extension EnvironmentValues {
    @inline(always)
    var shouldRedactContent: Bool {
        return self[ShouldRedactContentKey.self]
    }
    
    fileprivate struct ShouldRedactContentKey: DerivedEnvironmentKey {
        static func value(in environment: EnvironmentValues) -> Bool {
            if !environment.redactionReasons.isEmpty {
                return true
            }
            
            return environment.sensitiveContent
        }
    }
}

fileprivate struct RedactionReasonsKey: EnvironmentKey {
    static var defaultValue: RedactionReasons {
        return []
    }
}
