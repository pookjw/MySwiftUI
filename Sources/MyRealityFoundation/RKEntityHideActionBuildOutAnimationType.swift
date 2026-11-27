@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public enum __RKEntityHideActionBuildOutAnimationType : String, Codable, CaseIterable {
    case none
    case moveToLeft = "move out to left"
    case moveToRight = "move out to right"
    case moveToFront = "move out to front"
    case moveToRear = "move out to rear"
    case moveToAbove = "move out to above"
    case moveToBelow = "move out to below"
    case pop
    case scale = "scale down"
    case scaleUp = "scale up"
    
    public init?(rawValue: String) {
        assertUnimplemented()
    }
    
    @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
    public typealias AllCases = [__RKEntityHideActionBuildOutAnimationType]
    
    @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
    public typealias RawValue = String
    
    nonisolated public static var allCases: [__RKEntityHideActionBuildOutAnimationType] {
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
extension __RKEntityHideActionBuildOutAnimationType : Equatable {}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension __RKEntityHideActionBuildOutAnimationType : Hashable {}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension __RKEntityHideActionBuildOutAnimationType : RawRepresentable {}
