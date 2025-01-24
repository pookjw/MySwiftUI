import Testing
@testable @_private(sourceFile: "StrongHasher.swift") import MySwiftUICore

struct StrongHasherTests {
    @Test func test_init() {
        _ = StrongHasher()
    }
    
    @Test func test_combine() {
        var hasher = StrongHasher()
        
        #expect(hasher.finialize().words == (4003674586, 223046494, 4022293810, 2417516693, 151509167))
        
        hasher.combine(10)
        #expect(hasher.finialize().words == (2324736625, 3360167423, 4142714310, 354829621, 629830532))
        
        hasher.combine(20)
        print(hasher.finialize().words)
        #expect(hasher.finialize().words == (4011173558, 325337013, 762753261, 4021180345, 1914530317))
    }
    
    @Test func test_combineByes() {
        var hasher = StrongHasher()
        
        #expect(hasher.finialize().words == (4003674586, 223046494, 4022293810, 2417516693, 151509167))
        
        [1, 2, 3]
            .withUnsafeBytes { pointer in
                hasher.combineBytes(pointer.baseAddress.unsafelyUnwrapped, count: pointer.count)
            }
        
        #expect(hasher.finialize().words == (2659439074, 2104455377, 4169600327, 2220198596, 307952330))
        
        [4, 5, 6]
            .withUnsafeBytes { pointer in
                hasher.combineBytes(pointer.baseAddress.unsafelyUnwrapped, count: pointer.count)
            }
        
        #expect(hasher.finialize().words == (2826079948, 2677630559, 1608562069, 1790080451, 4281569401))
    }
    
    @Test func test_combineBitPattern() {
        var hasher = StrongHasher()
        
        #expect(hasher.finialize().words == (4003674586, 223046494, 4022293810, 2417516693, 151509167))
        
        hasher.combineBitPattern(10)
        #expect(hasher.finialize().words == (2324736625, 3360167423, 4142714310, 354829621, 629830532))
        
        hasher.combineBitPattern(20)
        print(hasher.finialize().words)
        #expect(hasher.finialize().words == (4011173558, 325337013, 762753261, 4021180345, 1914530317))
    }
    
    @Test func test_finialize() {
        var hasher = StrongHasher()
        #expect(hasher.finialize().words == (4003674586, 223046494, 4022293810, 2417516693, 151509167))
    }
}
