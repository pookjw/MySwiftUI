@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public enum __RKEntityShowActionBuildInAnimationType : String, Codable, CaseIterable {
    case none
    case moveFromLeft = "move in from left"
    case moveFromRight = "move in from right"
    case moveFromFront = "move in from front"
    case moveFromRear = "move in from rear"
    case moveFromAbove = "move in from above"
    case moveFromBelow = "move in from below"
    case pop
    case scale = "scale up"
    case scaleBig = "scale down"
    
    public init?(rawValue: String) {
        assertUnimplemented()
    }
    
    @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
    public typealias AllCases = [__RKEntityShowActionBuildInAnimationType]
    
    @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
    public typealias RawValue = String
    
    nonisolated public static var allCases: [__RKEntityShowActionBuildInAnimationType] {
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
extension __RKEntityShowActionBuildInAnimationType : Equatable {}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension __RKEntityShowActionBuildInAnimationType : Hashable {}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension __RKEntityShowActionBuildInAnimationType : RawRepresentable {}
