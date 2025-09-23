#warning("TODO")
package import Foundation

public struct Color: Hashable, CustomStringConvertible, Sendable {
    package init(_platformColor: NSObject & NSSecureCoding, definition: PlatformColorDefinition.Type) {
        fatalError("TODO")
    }
    
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
