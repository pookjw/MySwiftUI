import Testing
import Foundation
@testable import MySwiftUICore

struct StronglyHashableTests {
    @Test func test_Data() throws {
        var hasher = StrongHasher()
        
        let initialHash = hasher.finialize()
        
        let data = try #require(Data(base64Encoded: "MDEyMzQ1Njc4OTAxMjM0NTY3ODlhYmNkZWZnaGlqa2xtbm9wcXJzdHV2d3h5ekFCQ0RFRkdISUpLTE1OT1BRUlNUVVZXWFla"))
        
        data.hash(into: &hasher)
        
        let finalHash = hasher.finialize()
        
        #expect(initialHash != finalHash)
        #expect(finalHash.words == (1442589643, 750306874, 3359622749, 1781106773, 1696357074))
    }
    
    @Test func test_Bool() {
        var hasher = StrongHasher()
        
        let initialHash = hasher.finialize()
        
        true.hash(into: &hasher)
        
        let finalHash = hasher.finialize()
        
        #expect(initialHash != finalHash)
        #expect(finalHash.words == (809864127, 3712406232, 2706615412, 2713415988, 4158603641))
    }
    
    @Test func test_Int() {
        var hasher = StrongHasher()
        
        let initialHash = hasher.finialize()
        
        Int(30).hash(into: &hasher)
        
        let finalHash = hasher.finialize()
        
        #expect(initialHash != finalHash)
        #expect(finalHash.words == (3269411618, 2921778338, 2506695086, 4095781589, 2403680742))
    }
    
    @Test func test_UInt() {
        var hasher = StrongHasher()
        
        let initialHash = hasher.finialize()
        
        UInt(30).hash(into: &hasher)
        
        let finalHash = hasher.finialize()
        
        #expect(initialHash != finalHash)
        #expect(finalHash.words == (3269411618, 2921778338, 2506695086, 4095781589, 2403680742))
    }
    
    @Test func test_Int8() {
        var hasher = StrongHasher()
        
        let initialHash = hasher.finialize()
        
        Int8(30).hash(into: &hasher)
        
        let finalHash = hasher.finialize()
        
        #expect(initialHash != finalHash)
        #expect(finalHash.words == (848091263, 1974821787, 738435186, 2654883569, 1607360968))
    }
    
    @Test func test_UInt8() {
        var hasher = StrongHasher()
        
        let initialHash = hasher.finialize()
        
        UInt8(30).hash(into: &hasher)
        
        let finalHash = hasher.finialize()
        
        #expect(initialHash != finalHash)
        #expect(finalHash.words == (848091263, 1974821787, 738435186, 2654883569, 1607360968))
    }
    
    @Test func test_Int16() {
        var hasher = StrongHasher()
        
        let initialHash = hasher.finialize()
        
        Int16(30).hash(into: &hasher)
        
        let finalHash = hasher.finialize()
        
        #expect(initialHash != finalHash)
        #expect(finalHash.words == (134009908, 1997886590, 177974822, 2338038237, 413435135))
    }
    
    @Test func test_UInt16() {
        var hasher = StrongHasher()
        
        let initialHash = hasher.finialize()
        
        UInt16(30).hash(into: &hasher)
        
        let finalHash = hasher.finialize()
        
        #expect(initialHash != finalHash)
        #expect(finalHash.words == (134009908, 1997886590, 177974822, 2338038237, 413435135))
    }
    
    @Test func test_Int32() {
        var hasher = StrongHasher()
        
        let initialHash = hasher.finialize()
        
        Int32(30).hash(into: &hasher)
        
        let finalHash = hasher.finialize()
        
        #expect(initialHash != finalHash)
        #expect(finalHash.words == (3170108170, 417329661, 3703443592, 2290776678, 3717256853))
    }
    
    @Test func test_UInt32() {
        var hasher = StrongHasher()
        
        let initialHash = hasher.finialize()
        
        UInt32(30).hash(into: &hasher)
        
        let finalHash = hasher.finialize()
        
        #expect(initialHash != finalHash)
        #expect(finalHash.words == (3170108170, 417329661, 3703443592, 2290776678, 3717256853))
    }
    
    @Test func test_Int64() {
        var hasher = StrongHasher()
        
        let initialHash = hasher.finialize()
        
        Int64(30).hash(into: &hasher)
        
        let finalHash = hasher.finialize()
        
        #expect(initialHash != finalHash)
        #expect(finalHash.words == (3269411618, 2921778338, 2506695086, 4095781589, 2403680742))
    }
    
    @Test func test_UInt64() {
        var hasher = StrongHasher()
        
        let initialHash = hasher.finialize()
        
        UInt64(30).hash(into: &hasher)
        
        let finalHash = hasher.finialize()
        
        #expect(initialHash != finalHash)
        #expect(finalHash.words == (3269411618, 2921778338, 2506695086, 4095781589, 2403680742))
    }
    
    @Test func test_Float() {
        var hasher = StrongHasher()
        
        let initialHash = hasher.finialize()
        
        Float(30).hash(into: &hasher)
        
        let finalHash = hasher.finialize()
        
        #expect(initialHash != finalHash)
        #expect(finalHash.words == (1912514887, 1891295540, 336914748, 3246191316, 474129526))
    }
    
    @Test func test_Double() {
        var hasher = StrongHasher()
        
        let initialHash = hasher.finialize()
        
        Double(30).hash(into: &hasher)
        
        let finalHash = hasher.finialize()
        
        #expect(initialHash != finalHash)
        #expect(finalHash.words == (1561235771, 2962433265, 2892002997, 2449708671, 289809494))
    }
    
    @Test func test_UUID() throws {
        var hasher = StrongHasher()
        
        let initialHash = hasher.finialize()
        
        let uuid = try #require(UUID(uuidString: "E820DF0E-9517-4066-96D1-404B55FAB192"))
        uuid.hash(into: &hasher)
        
        let finalHash = hasher.finialize()
        
        #expect(initialHash != finalHash)
        #expect(finalHash.words == (3266062715, 3949295864, 493604537, 3889583698, 3568817743))
    }
}
