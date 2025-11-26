#warning("TODO")

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
    
    public var isGlobal: Bool {
        fatalError("TODO")
    }
    
    public var isLocal: Bool {
        fatalError("TODO")
    }
}

@available(*, unavailable)
extension CoordinateSpace: Sendable {}

extension CoordinateSpace: Hashable {
    public func hash(into hasher: inout Hasher) {
        fatalError("TODO")
    }
}

extension CoordinateSpace {
    @_spi(Internal)
    public struct ID: Equatable, Sendable {
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
    static let immersiveSpace = CoordinateSpace.ID()
    package static let worldReference = CoordinateSpace.ID()
    static let viewGraphHost = CoordinateSpace.ID()
    package static let viewGraphHostContainerCoordinateSpace = CoordinateSpace.ID()
}
