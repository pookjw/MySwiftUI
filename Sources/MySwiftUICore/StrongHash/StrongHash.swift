import Foundation
import CommonCrypto

package struct StrongHash {
    package var words: (UInt32, UInt32, UInt32, UInt32, UInt32)
    
    package init() {
        words = (0, 0, 0, 0, 0)
    }
    
    package init<T>(encodable: T) throws where T : Encodable {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .sortedKeys
        let data = try encoder.encode(encodable)
        
        var hasher = StrongHasher()
        data.hash(into: &hasher)
        
        let result = hasher.finialize()
        words = result.words
    }
    
    package static var random: StrongHash {
        var hasher = StrongHasher()
        UUID().hash(into: &hasher)
        return hasher.finialize()
    }
}

extension StrongHash: Hashable {
    package static func == (lhs: StrongHash, rhs: StrongHash) -> Bool {
        lhs.words == rhs.words
    }
    
    package func hash(into hasher: inout Hasher) {
        withUnsafeBytes(of: words) { pointer in
            hasher.combine(bytes: pointer)
        }
    }
}

extension StrongHash: CustomStringConvertible {
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

extension StrongHash: Codable {
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
}

extension StrongHash: ProtobufEncodableMessage {
    
}

extension StrongHash: ProtobufDecodableMessage {
    
}
