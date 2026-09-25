@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public struct TabBarPlacement : Hashable {
    private let placement: TabBarPlacement.Placement
    
    @safe public static nonisolated(unsafe) let topBar = TabBarPlacement(placement: .topBar)
    @safe public static nonisolated(unsafe) let sidebar = TabBarPlacement(placement: .sidebar)
    @safe public static nonisolated(unsafe) let bottomBar = TabBarPlacement(placement: .bottomBar)
    @safe public static nonisolated(unsafe) let ornament = TabBarPlacement(placement: .ornament)
    @safe public static nonisolated(unsafe) let pageIndicator = TabBarPlacement(placement: .pageIndicator)
}

@available(*, unavailable)
extension TabBarPlacement : Sendable {
}

extension TabBarPlacement {
    enum Placement : Hashable, CustomStringConvertible {
        case topBar
        case sidebar
        case bottomBar
        case ornament
        case pageIndicator
        
        var description: String {
            assertUnimplemented()
        }
    }
}
