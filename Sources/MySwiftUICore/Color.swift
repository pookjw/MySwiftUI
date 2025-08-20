#warning("TODO")

public struct Color: Hashable, CustomStringConvertible, Sendable {
    public var description: String {
        fatalError("TODO")
    }
}

//extension Color: View {}

extension Color {
    public struct Resolved: Hashable {
        
    }
}

extension Color {
    @frozen public struct ResolvedHDR: Hashable, Sendable {
        
    }
}
