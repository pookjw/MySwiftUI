@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public enum __RKEntityMoveEase : String, Codable, CaseIterable {
    case none
    case back
    case bounce
    case circle
    case elastic
    case exponential
    case hermite
    case log
    case power
    case sine
    
    public init?(rawValue: String) {
        assertUnimplemented()
    }
    
    @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
    public typealias AllCases = [__RKEntityMoveEase]
    
    @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
    public typealias RawValue = String
    
    nonisolated public static var allCases: [__RKEntityMoveEase] {
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
extension __RKEntityMoveEase : Equatable {}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension __RKEntityMoveEase : Hashable {}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension __RKEntityMoveEase : RawRepresentable {}
