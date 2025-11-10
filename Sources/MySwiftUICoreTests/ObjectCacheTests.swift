internal import Testing
@testable private import MySwiftUICore

struct ObjectCacheTests {
    @Test
    func test() {
        let values: [Int: Int] = [
            0: 100,
            1: 101,
            2: 102,
            3: 103
        ]
        
        let cache = ObjectCache<Int, Int> { key in
            return values[key]!
        }
        
        for (key, value) in values {
            #expect(cache[key] == value)
        }
    }
}
