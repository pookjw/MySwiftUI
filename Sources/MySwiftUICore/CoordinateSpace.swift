package let hostingViewCoordinateSpace = CoordinateSpace.ID()

/*
 let ptr = UnsafeMutablePointer<CoordinateSpace>.allocate(capacity: 1)
 ptr.initialize(to: .local)
 
 print(UnsafeRawPointer(ptr)
 .advanced(by: 0x0)
 .assumingMemoryBound(to: UInt64.self)
 .pointee)
 
 print(UnsafeRawPointer(ptr)
 .advanced(by: 0x8)
 .assumingMemoryBound(to: UInt64.self)
 .pointee)
 
 print(UnsafeRawPointer(ptr)
 .advanced(by: 0x10)
 .assumingMemoryBound(to: UInt64.self)
 .pointee)
 
 print(UnsafeRawPointer(ptr)
 .advanced(by: 0x18)
 .assumingMemoryBound(to: UInt64.self)
 .pointee)
 
 print(UnsafeRawPointer(ptr)
 .advanced(by: 0x20)
 .assumingMemoryBound(to: UInt64.self)
 .pointee)
 
 print(UnsafeRawPointer(ptr)
 .advanced(by: 0x28)
 .assumingMemoryBound(to: UInt8.self)
 .pointee)
 */
public enum CoordinateSpace {
    case global
    case local
    case named(AnyHashable)
    
    @_spi(Internal)
    case id(CoordinateSpace.ID)
}

@available(*, unavailable)
extension CoordinateSpace : Sendable {}

extension CoordinateSpace : Hashable {
    public func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }

    public static func == (lhs: CoordinateSpace, rhs: CoordinateSpace) -> Bool {
        assertUnimplemented()
    }
}

extension CoordinateSpace {
    public var isGlobal: Bool {
        assertUnimplemented()
    }
    
    public var isLocal: Bool {
        assertUnimplemented()
    }
}

extension CoordinateSpace {
    @_spi(Internal)
    public struct ID : Equatable, Sendable {
        var value: UniqueID
        
        init() {
            value = UniqueID()
        }
    }
    
    static var root: CoordinateSpace {
        if isLinkedOnOrAfter(.v7) {
            return .id(.worldReference)
        } else {
            return .global
        }
    }
    
    package static let globalID = CoordinateSpace.ID()
}

extension CoordinateSpace.ID {
    package static let immersiveSpace = CoordinateSpace.ID()
    package static let worldReference = CoordinateSpace.ID()
    static let viewGraphHost = CoordinateSpace.ID()
    package static let viewGraphHostContainerCoordinateSpace = CoordinateSpace.ID()
}

public protocol CoordinateSpaceProtocol {
    var coordinateSpace: CoordinateSpace { get }
}

public struct NamedCoordinateSpace : CoordinateSpaceProtocol, Equatable {
    public var coordinateSpace: CoordinateSpace {
        assertUnimplemented()
    }
    
    public static func == (a: NamedCoordinateSpace, b: NamedCoordinateSpace) -> Bool {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension NamedCoordinateSpace : Sendable {
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension CoordinateSpaceProtocol where Self == NamedCoordinateSpace {
    public static func named(_ name: some Hashable) -> NamedCoordinateSpace {
        assertUnimplemented()
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
public struct LocalCoordinateSpace : CoordinateSpaceProtocol {
    public init() {
    }
    
    public var coordinateSpace: CoordinateSpace {
        return .local
    }
}

@available(*, unavailable)
extension LocalCoordinateSpace : Sendable {
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension CoordinateSpaceProtocol where Self == LocalCoordinateSpace {
    public static var local: LocalCoordinateSpace {
        return LocalCoordinateSpace()
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
public struct GlobalCoordinateSpace : CoordinateSpaceProtocol {
    public init() {
        assertUnimplemented()
    }
    
    public var coordinateSpace: CoordinateSpace {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension GlobalCoordinateSpace : Sendable {
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension CoordinateSpaceProtocol where Self == GlobalCoordinateSpace {
    public static var global: GlobalCoordinateSpace {
        assertUnimplemented()
    }
}
