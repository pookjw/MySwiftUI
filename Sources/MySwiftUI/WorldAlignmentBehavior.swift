private import MySwiftUICore

@available(visionOS 2.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct WorldAlignmentBehavior : Equatable, Sendable {
    private let storage: WorldAlignmentBehavior.Storage
    
    public static var automatic: WorldAlignmentBehavior {
        return WorldAlignmentBehavior(storage: .automatic)
    }
    
    public static var adaptive: WorldAlignmentBehavior {
        return WorldAlignmentBehavior(storage: .adaptive)
    }
    
    public static var gravityAligned: WorldAlignmentBehavior {
        return WorldAlignmentBehavior(storage: .gravityAligned)
    }
}

@available(visionOS 2.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension Scene {
    nonisolated public func volumeWorldAlignment(_ behavior: WorldAlignmentBehavior) -> some Scene {
        assertUnimplemented()
    }
}

extension WorldAlignmentBehavior {
    enum Storage : Hashable {
        case automatic
        case adaptive
        case gravityAligned
    }
}
