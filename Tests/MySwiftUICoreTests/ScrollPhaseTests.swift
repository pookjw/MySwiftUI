import Testing
@testable import MySwiftUICore

struct ScrollPhaseTests {
    @Test(arguments: TestCase.allCases) func test_isScrolling(testCase: TestCase) {
        let result = testCase.result
        let isScrolling = testCase.phase.isScrolling
        #expect(result == isScrolling)
    }
}

extension ScrollPhaseTests {
    struct TestCase: CaseIterable {
        static let allCases: [TestCase] = [
            TestCase(phase: .idle, result: false),
            TestCase(phase: .tracking, result: true),
            TestCase(phase: .interacting, result: true),
            TestCase(phase: .decelerating, result: true),
            TestCase(phase: .animating, result: true)
        ]
        
        let phase: ScrollPhase
        let result: Bool
    }
}
