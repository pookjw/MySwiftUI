private import CommonCrypto
internal import Foundation
private import AttributeGraph

protocol StronglyHashableByBitPattern : StronglyHashable {
}

extension StronglyHashableByBitPattern {
    func hash(into hasher: inout StrongHasher) {
        assertUnimplemented()
    }
}

protocol StronglyHashable {
    func hash(into hasher: inout StrongHasher)
}

package struct StrongHash : Hashable, StronglyHashableByBitPattern, Decodable, Encodable, CustomStringConvertible, ProtobufEncodableMessage, ProtobufDecodableMessage, Sendable {
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
    
    init<T : Encodable>(encodable: T) throws {
        assertUnimplemented()
    }
    
    init<T : StronglyHashable>(of value: T) {
        assertUnimplemented()
    }
    
    package init(from decoder: any Decoder) throws {
        var container = try decoder.unkeyedContainer()
        
        let word_0 = try container.decode(UInt32.self)
        let word_1 = try container.decode(UInt32.self)
        let word_2 = try container.decode(UInt32.self)
        let word_3 = try container.decode(UInt32.self)
        let word_4 = try container.decode(UInt32.self)
        
        words = (word_0, word_1, word_2, word_3, word_4)
    }
    
    package func encode(to encoder: any Encoder) throws {
        let words = words
        var container = encoder.unkeyedContainer()
        
        /*
         add        x0, sp, #0x8로 계속 더해가므로 0 -> 1 -> 2 -> 3 -> 4
         */
        try container.encode(words.0)
        try container.encode(words.1)
        try container.encode(words.2)
        try container.encode(words.3)
        try container.encode(words.4)
    }
    
    package func hash(into hasher: inout Hasher) {
        unsafe withUnsafePointer(to: words) { pointer in
            let buffer = unsafe UnsafeBufferPointer<UInt32>(
                start: UnsafeRawPointer(pointer).assumingMemoryBound(to: UInt32.self),
                count: 5
            )
            unsafe hasher.combine(bytes: UnsafeRawBufferPointer(buffer))
        }
    }
    
    package var description: String {
        /*
         ldp        w19, w21, [x20]
         ldp        w22, w23, [x20, #0x8]
         ldr        w20, [x20, #0x10]
         -> w19 : 0, w21 : 1, w22 : 2, w23: 3, w20 : 4
         
         str        w20, [x0, #0x20]
         str        w23, [x0, #0x48]
         str        w22, [x0, #0x70]
         str        w21, [x0, #0x98]
         str        w19, [x0, #0xc0]
         w20 -> w23 -> w22 -> w21 -> w19 = 4 -> 3 -> 2 -> 1 -> 0
         */
        String(format: "#%08x%08x%08x%08x%08x", words.4, words.3, words.2, words.1, words.0)
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
    
    mutating func combine<T : StronglyHashable>(_ value: T) {
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

extension UUID : StronglyHashable {
    func hash(into hasher: inout StrongHasher) {
        assertUnimplemented()
    }
}

extension Int : StronglyHashable {
    func hash(into hasher: inout StrongHasher) {
        assertUnimplemented()
    }
}
