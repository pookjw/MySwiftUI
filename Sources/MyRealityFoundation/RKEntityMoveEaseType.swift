@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public enum __RKEntityMoveEaseType : String, Codable, CaseIterable {
    case easeIn
    case easeOut
    case easeInEaseOut
    
    public init?(rawValue: String) {
        assertUnimplemented()
    }
    
    @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
    public typealias AllCases = [__RKEntityMoveEaseType]
    
    @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
    public typealias RawValue = String
    
    nonisolated public static var allCases: [__RKEntityMoveEaseType] {
        get {
            assertUnimplemented()
        }
    }
    
    public var rawValue: String {
        get {
            assertUnimplemented()
        }
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension __RKEntityMoveEaseType : Equatable {}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension __RKEntityMoveEaseType : Hashable {}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension __RKEntityMoveEaseType : RawRepresentable {}
