private import CommonCrypto
internal import Foundation
private import AttributeGraph

protocol StronglyHashableByBitPattern: StronglyHashable {
}

extension StronglyHashableByBitPattern {
    func hash(into hasher: inout StrongHasher) {
        assertUnimplemented()
    }
}

protocol StronglyHashable {
    func hash(into hasher: inout StrongHasher)
}

package struct StrongHash: Hashable, StronglyHashableByBitPattern, Decodable, Encodable, CustomStringConvertible, ProtobufEncodableMessage, ProtobufDecodableMessage, Sendable {
    static var random: StrongHash {
        return StrongHash(of: UUID())
    }
    
    package static func == (lhs: StrongHash, rhs: StrongHash) -> Bool {
        return (lhs.words.0 == rhs.words.0) &&
        (lhs.words.1 == rhs.words.1) &&
        (lhs.words.2 == rhs.words.2) &&
        (lhs.words.3 == rhs.words.3) &&
        (lhs.words.4 == rhs.words.4)
    }
    
    var words: (UInt32, UInt32, UInt32, UInt32, UInt32)
    
    init() {
        words = (0, 0, 0, 0, 0)
    }
    
    fileprivate init(words: (UInt32, UInt32, UInt32, UInt32, UInt32)) {
        self.words = words
    }
    
    init<T: Encodable>(encodable: T) throws {
        assertUnimplemented()
    }
    
    init<T: StronglyHashable>(of value: T) {
        assertUnimplemented()
    }
    
    package init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
    
    package func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    package func hash(into hasher: inout Hasher) {
        unsafe withUnsafePointer(to: words) { pointer in
            let buffer = unsafe UnsafeRawBufferPointer(
                start: UnsafeRawPointer(pointer),
                count: MemoryLayout<(UInt32, UInt32, UInt32, UInt32, UInt32)>.size
            )
            unsafe hasher.combine(bytes: buffer)
        }
    }
    
    package var description: String {
        assertUnimplemented()
    }
}

struct StrongHasher {
    private var state: CC_SHA1state_st
    
    init() {
        self.state = unsafe withUnsafeTemporaryAllocation(of: CC_SHA1_CTX.self, capacity: 1) { pointer in
            unsafe CC_SHA1_Init(pointer.baseAddress.unsafelyUnwrapped)
            return unsafe pointer.baseAddress.unsafelyUnwrapped.pointee
        }
    }
    
    mutating func combine<T: StronglyHashable>(_ value: T) {
        value.hash(into: &self)
    }
    
    mutating func finalize() -> StrongHash {
        return unsafe withUnsafeTemporaryAllocation(of: UInt8.self, capacity: 40) { pointer in
            unsafe CC_SHA1_Final(pointer.baseAddress, &state)
            return unsafe UnsafeRawPointer(pointer.baseAddress.unsafelyUnwrapped)
                .assumingMemoryBound(to: StrongHash.self)
                .pointee
        }
    }
    
    mutating func combineBytes(_ bytes: UnsafeRawPointer, count: Int) {
        assertUnimplemented()
    }
    
    mutating func combineBitPattern<T>(_: T) {
        assertUnimplemented()
    }
    
    mutating func combineType(_ type: Any.Type) {
        assertUnimplemented()
    }
}

func makeStableTypeData(_ type: Any.Type) -> StrongHash {
    return StrongHash(words: TypeID(type).signature.words)
}

extension UUID: StronglyHashable {
    func hash(into hasher: inout StrongHasher) {
        assertUnimplemented()
    }
}

extension Int: StronglyHashable {
    func hash(into hasher: inout StrongHasher) {
        assertUnimplemented()
    }
}
