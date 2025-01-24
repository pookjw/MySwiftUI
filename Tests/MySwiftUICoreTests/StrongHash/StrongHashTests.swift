import Testing
import Foundation
@testable import MySwiftUICore

struct StrongHashTests {
    @Test func test_init() {
        let hash = StrongHash()
        #expect(hash.words == (0, 0, 0, 0, 0))
    }
    
    @Test func test_initEncodable() throws {
        let string = "01234567890123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        
        let hash = try StrongHash(encodable: string)
        
        // 내부적으로 JSON Encoding을 하여 양끝에 "이 추가되기에 실제 SHA1과 다름
        #expect(hash.words == (3829522200, 1812238860, 393084213, 3821285113, 1969729572))
    }
    
    @Test func test_size() async throws {
        #expect(MemoryLayout<StrongHash>.size == MemoryLayout<(UInt32, UInt32, UInt32, UInt32, UInt32)>.size)
    }
    
    @Test func test_equatable() {
        var hash_1 = StrongHash()
        hash_1.words = (0, 1, 2, 3, 4)
        
        var hash_2 = StrongHash()
        hash_2.words = (0, 1, 2, 3, 4)
        
        #expect(hash_1 == hash_2)
    }
    
    @Test func test_equatable2() {
        var hash_1 = StrongHash()
        hash_1.words = (0, 1, 2, 3, 4)
        
        var hash_2 = StrongHash()
        hash_2.words = (5, 6, 7, 8, 9)
        
        #expect(hash_1 != hash_2)
    }
    
    @Test func test_hashable() {
        var hash = StrongHash()
        hash.words = (0, 1, 2, 3, 4)
        
        #expect(hash.hashValue != 0)
    }
    
    @Test func test_random() {
        #expect(StrongHash.random != StrongHash.random)
    }
    
    @Test func test_description() {
        var hash = StrongHash()
        hash.words = (0, 1, 2, 3, 4)
        #expect(hash.description == "0000000400000003000000020000000100000000")
    }
    
    @Test func test_encode() throws {
        var hash = StrongHash()
        hash.words = (0, 1, 2, 3, 4)
        
        let encoder = JSONEncoder()
        let data = try encoder.encode(hash)
        let string = try #require(String(data: data, encoding: .utf8))
        
        #expect(string == "[0,1,2,3,4]")
    }
    
    @Test func test_initFromDecoder() throws {
        var hash_1 = StrongHash()
        hash_1.words = (0, 1, 2, 3, 4)
        
        let encoder = JSONEncoder()
        let data = try encoder.encode(hash_1)
        
        let decoder = JSONDecoder()
        let hash_2 = try decoder.decode(StrongHash.self, from: data)
        
        #expect(hash_2.words == hash_1.words)
    }
}
