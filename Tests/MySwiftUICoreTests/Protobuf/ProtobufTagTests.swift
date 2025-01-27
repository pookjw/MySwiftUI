import Testing
@testable import MySwiftUICore

struct ProtobufTagTests {
    @Test(arguments: TestCase.allCases) func test_varint(testCase: TestCase) {
        let wireType = testCase.wireType
        let field = ProtobufFormat.Field(testCase.tag.rawValue, wireType: wireType)
        #expect(field.tag == testCase.tag.rawValue)
        #expect(field.wireType == wireType)
        #expect(field.tag(as: MyTag.self) == testCase.tag)
    }
}

extension ProtobufTagTests {
    struct TestCase: CaseIterable {
        static let allCases: [ProtobufTagTests.TestCase] = {
            var results: [ProtobufTagTests.TestCase] = []
            
            for rawValue in 0..<20 {
                results.append(TestCase(wireType: .varint, tag: MyTag(rawValue: UInt(rawValue))))
                results.append(TestCase(wireType: .fixed64, tag: MyTag(rawValue: UInt(rawValue))))
                results.append(TestCase(wireType: .lengthDelimited, tag: MyTag(rawValue: UInt(rawValue))))
                results.append(TestCase(wireType: .fixed32, tag: MyTag(rawValue: UInt(rawValue))))
            }
            
            return results
        }()
        
        let wireType: ProtobufFormat.WireType
        let tag: MyTag
    }
    
    struct MyTag: ProtobufTag {
        let rawValue: UInt
        
        init(rawValue: UInt) {
            self.rawValue = rawValue
        }
    }
}
