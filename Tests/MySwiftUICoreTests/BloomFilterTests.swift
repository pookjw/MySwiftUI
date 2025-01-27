import Testing
@testable import MySwiftUICore

struct BloomFilterTests {
    @Test(arguments: TestCase.allCases) func test_initHashValue(testCase: TestCase) {
        #expect(BloomFilter(hashValue: testCase.hashValue).value == testCase.value)
    }
}

extension BloomFilterTests {
    struct TestCase: CaseIterable {
        static var allCases: [TestCase] {
            [
                TestCase(hashValue: 0x0000000103811190, value: 0x0000000002000012),
                TestCase(hashValue: 0x00000001ec823010, value: 0x0000000000001006),
                TestCase(hashValue: 0x00000001ec7ac958, value: 0x0404000000200000),
                TestCase(hashValue: 0x000000011880c390, value: 0x0201000000000001),
                TestCase(hashValue: 0x000000011880cc90, value: 0x0008000000000201)
            ]
        }
        
        let hashValue: Int
        let value: UInt
    }
}
