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
                TestCase(hashValue: 0x0000000103811190, value: 0x0000000002000012)
            ]
        }
        
        let hashValue: Int
        let value: UInt
    }
}
