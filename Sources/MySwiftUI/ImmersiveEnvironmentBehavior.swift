private import MySwiftUICore

@available(visionOS 26.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct ImmersiveEnvironmentBehavior : Equatable, Sendable {
    private var storage: ImmersiveEnvironmentBehavior.Storage
    
    public static var automatic: ImmersiveEnvironmentBehavior {
        return ImmersiveEnvironmentBehavior(storage: .automatic)
    }
    
    public static var coexist: ImmersiveEnvironmentBehavior {
        return ImmersiveEnvironmentBehavior(storage: .hide)
    }
    
    public static var replace: ImmersiveEnvironmentBehavior {
        return ImmersiveEnvironmentBehavior(storage: .coexist)
    }
}

@available(visionOS 26.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension Scene {
    nonisolated public func immersiveEnvironmentBehavior(_ behavior: ImmersiveEnvironmentBehavior) -> some Scene {
        assertUnimplemented()
    }
}

extension ImmersiveEnvironmentBehavior {
    enum Storage : CustomStringConvertible, Hashable {
        case automatic
        case hide
        case coexist
        
        var description: String {
            assertUnimplemented()
        }
    }
}
