@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@usableFromInline
internal enum RotationOrder : UInt8 {
    @safe public static nonisolated(unsafe) let `default`: RotationOrder = {
        assertUnimplemented()
    }()
    
    @safe public static nonisolated(unsafe) let sceneKit: RotationOrder = {
        assertUnimplemented()
    }()
    case xyz
    case yzx
    case zxy
    case xzy
    case yxz
    case zyx
    
    @usableFromInline
    internal init?(rawValue: UInt8) {
        assertUnimplemented()
    }
    
    @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
    @usableFromInline
    internal typealias RawValue = UInt8
    
    @usableFromInline
    internal var rawValue: UInt8 {
        @usableFromInline
        get {
            assertUnimplemented()
        }
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension RotationOrder : Equatable {}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension RotationOrder : Hashable {}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension RotationOrder : RawRepresentable {}
