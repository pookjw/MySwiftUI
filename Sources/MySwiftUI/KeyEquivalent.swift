@available(iOS 14.0, macOS 11.0, tvOS 17.0, *)
@available(watchOS, unavailable)
public struct KeyEquivalent : Sendable {
    public static let upArrow: KeyEquivalent = {
        assertUnimplemented()
    }()
    
    public static let downArrow: KeyEquivalent = {
        assertUnimplemented()
    }()
    
    public static let leftArrow: KeyEquivalent = {
        assertUnimplemented()
    }()
    
    public static let rightArrow: KeyEquivalent = {
        assertUnimplemented()
    }()
    
    public static let escape: KeyEquivalent = {
        assertUnimplemented()
    }()
    
    public static let delete: KeyEquivalent = {
        assertUnimplemented()
    }()
    
    public static let deleteForward: KeyEquivalent = {
        assertUnimplemented()
    }()
    
    public static let home: KeyEquivalent = {
        assertUnimplemented()
    }()
    
    public static let end: KeyEquivalent = {
        assertUnimplemented()
    }()
    
    public static let pageUp: KeyEquivalent = {
        assertUnimplemented()
    }()
    
    public static let pageDown: KeyEquivalent = {
        assertUnimplemented()
    }()
    
    public static let clear: KeyEquivalent = {
        assertUnimplemented()
    }()
    
    public static let tab: KeyEquivalent = {
        assertUnimplemented()
    }()
    
    public static let space: KeyEquivalent = {
        assertUnimplemented()
    }()
    
    public static let `return`: KeyEquivalent = {
        assertUnimplemented()
    }()
    
    public static let `null`: KeyEquivalent = {
        assertUnimplemented()
    }()
    
    public var character: Character
    
    public init(_ character: Character) {
        self.init(extendedGraphemeClusterLiteral: character)
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension KeyEquivalent : Hashable {
    public static func == (a: KeyEquivalent, b: KeyEquivalent) -> Bool {
        assertUnimplemented()
    }
    
    public func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension KeyEquivalent : ExpressibleByExtendedGraphemeClusterLiteral {
    public init(extendedGraphemeClusterLiteral: Character) {
        self.character = extendedGraphemeClusterLiteral
    }
    
    @available(iOS 14.0, tvOS 17.0, macOS 11.0, *)
    @available(watchOS, unavailable)
    public typealias ExtendedGraphemeClusterLiteralType = Character
    @available(iOS 14.0, tvOS 17.0, macOS 11.0, *)
    @available(watchOS, unavailable)
    public typealias UnicodeScalarLiteralType = Character
}
