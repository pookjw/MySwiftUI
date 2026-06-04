public import Foundation

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct __RKEntityCustomActionArguments : Codable, Equatable, __RKSpecificationHasTarget {
    public var target: UUID
    
    public var actionIdentifier: String
    
    public var customArguments: [String : String]
    
    public var optionalTarget: UUID? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public init(target: UUID?, actionIdentifier: String, customArguments: [String : String]? = [:]) {
        assertUnimplemented()
    }
    
    public static func == (a: __RKEntityCustomActionArguments, b: __RKEntityCustomActionArguments) -> Bool {
        assertUnimplemented()
    }
    
    public func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    public init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
}
