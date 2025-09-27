internal import Testing
@testable private import MySwiftUICore

struct BloomFilterTests {
    @Test func test() {
        do {
            let filter = BloomFilter()
            #expect(filter.isEmpty)
            #expect(!filter.mayContain(BloomFilter(staticValue: 1)))
        }
        
        do {
            let filter = BloomFilter(staticValue: 1)
            #expect(!filter.isEmpty)
            #expect(!filter.mayContain(BloomFilter(staticValue: 3)))
        }
        
        do {
            let filter = BloomFilter(type: Type1.self)
            #expect(filter.mayContain(BloomFilter(type: Type1.self)))
            #expect(!filter.mayContain(BloomFilter(type: Type2.self)))
        }
    }
}

fileprivate struct Type1 {}
fileprivate struct Type2 {}

extension BloomFilter {
    fileprivate init(staticValue: UInt) {
        self.init()
        self.value = staticValue
    }
}
