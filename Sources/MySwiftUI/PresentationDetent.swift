public import CoreGraphics

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
public struct PresentationDetent : Hashable, Sendable {
    public static let medium: PresentationDetent = {
        assertUnimplemented()
    }()
    
    public static let large: PresentationDetent = {
        assertUnimplemented()
    }()
    
    public static func fraction(_ fraction: CGFloat) -> PresentationDetent {
        assertUnimplemented()
    }
    
    public static func height(_ height: CGFloat) -> PresentationDetent {
        assertUnimplemented()
    }
    
    public static func custom<D>(_ type: D.Type) -> PresentationDetent where D : CustomPresentationDetent {
        assertUnimplemented()
    }
    
    @dynamicMemberLookup public struct Context {
        public var maxDetentValue: CGFloat {
            assertUnimplemented()
        }
        public subscript<T>(dynamicMember keyPath: KeyPath<EnvironmentValues, T>) -> T {
            assertUnimplemented()
        }
    }
    
    public static func == (a: PresentationDetent, b: PresentationDetent) -> Bool {
        assertUnimplemented()
    }
    
    public func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension PresentationDetent.Context : Sendable {
}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
public protocol CustomPresentationDetent {
    static func height(in context: Self.Context) -> CGFloat?
}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
extension CustomPresentationDetent {
    public typealias Context = PresentationDetent.Context
}
