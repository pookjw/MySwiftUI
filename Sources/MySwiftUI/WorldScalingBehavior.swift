private import MySwiftUICore
internal import MRUIKit

extension Scene {
    @available(visionOS 2.0, *)
    @available(iOS, unavailable)
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    nonisolated public func defaultWorldScaling(_ scaling: WorldScalingBehavior) -> some Scene {
        assertUnimplemented()
    }
}

@available(visionOS 2.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct WorldScalingBehavior : Hashable, Sendable {
    private(set) var value: MRUISceneScalingBehavior?
    
    public static var automatic: WorldScalingBehavior {
        return WorldScalingBehavior(value: nil)
    }
    
    public static var dynamic: WorldScalingBehavior {
        return WorldScalingBehavior(value: .dynamicScale)
    }
    
    static var fixed: WorldScalingBehavior {
        return WorldScalingBehavior(value: .trueScale)
    }
}
