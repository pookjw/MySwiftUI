import Testing
@testable import MySwiftUICore

struct ContentOffsetAdjustmentReasonTests {
    @Test(arguments: TestCase.allCases) func test_shouldAdjust(testCase: TestCase) {
        let reason = testCase.reason
        let isScrolling = testCase.isScrolling
        let isTransitioning = testCase.isTransitioning
        let result = testCase.result
        
        #expect(reason.shouldAdjust(isScrolling: isScrolling, isTransitioning: isTransitioning) == result)
    }
}

extension ContentOffsetAdjustmentReasonTests {
    struct TestCase: CaseIterable {
        let reason: ContentOffsetAdjustmentReason
        let isScrolling: Bool
        let isTransitioning: Bool
        let result: Bool
        
        static let allCases: [TestCase] = [
            TestCase(reason: .translation, isScrolling: false, isTransitioning: false, result: true),
            TestCase(reason: .translation, isScrolling: true, isTransitioning: false, result: true),
            TestCase(reason: .translation, isScrolling: false, isTransitioning: true, result: false),
            TestCase(reason: .translation, isScrolling: true, isTransitioning: true, result: false),
            
            TestCase(reason: .positionTranslation, isScrolling: false, isTransitioning: false, result: true),
            TestCase(reason: .positionTranslation, isScrolling: true, isTransitioning: false, result: true),
            TestCase(reason: .positionTranslation, isScrolling: false, isTransitioning: true, result: false),
            TestCase(reason: .positionTranslation, isScrolling: true, isTransitioning: true, result: false),
            
            TestCase(reason: .alignment, isScrolling: false, isTransitioning: false, result: true),
            TestCase(reason: .alignment, isScrolling: true, isTransitioning: false, result: false),
            TestCase(reason: .alignment, isScrolling: false, isTransitioning: true, result: true),
            TestCase(reason: .alignment, isScrolling: true, isTransitioning: true, result: false),
            
            TestCase(reason: .reset, isScrolling: false, isTransitioning: false, result: true),
            TestCase(reason: .reset, isScrolling: true, isTransitioning: false, result: true),
            TestCase(reason: .reset, isScrolling: false, isTransitioning: true, result: true),
            TestCase(reason: .reset, isScrolling: true, isTransitioning: true, result: true),
        ]
    }
}
