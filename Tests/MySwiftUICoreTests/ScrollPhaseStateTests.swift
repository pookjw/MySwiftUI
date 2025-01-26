import Testing
@testable import MySwiftUICore

struct ScrollPhaseStateTests {
    @Test(arguments: TestCase<Bool>.shouldUpdateValueCases) func test_shouldUpdateValue(testCase: TestCase<Bool>) {
        let result = testCase.result
        let shouldUpdateValue = ScrollPhaseState(phase: testCase.phase, velocity: .zero).shouldUpdateValue
        #expect(result == shouldUpdateValue)
    }
    
    @Test(arguments: TestCase<Bool>.isScrollingCases) func test_isScrolling(testCase: TestCase<Bool>) {
        let result = testCase.result
        let isScrolling = ScrollPhaseState(phase: testCase.phase, velocity: .zero).isScrolling
        #expect(result == isScrolling)
    }
    
    @Test(arguments: TestCase<Bool>.isTrackingCases) func test_isTracking(testCase: TestCase<Bool>) {
        let result = testCase.result
        let isTracking = ScrollPhaseState(phase: testCase.phase, velocity: .zero).isTracking
        #expect(result == isTracking)
    }
    
    @Test(arguments: TestCase<Bool>.isInteractingCases) func test_isInteracting(testCase: TestCase<Bool>) {
        let result = testCase.result
        let isInteracting = ScrollPhaseState(phase: testCase.phase, velocity: .zero).isInteracting
        #expect(result == isInteracting)
    }
    
    @Test(arguments: TestCase<Bool>.isDeceleratingCases) func test_isDecelerating(testCase: TestCase<Bool>) {
        let result = testCase.result
        let isDecelerating = ScrollPhaseState(phase: testCase.phase, velocity: .zero).isDecelerating
        #expect(result == isDecelerating)
    }
    
    @Test(arguments: TestCase<Bool>.isAnimatingCases) func test_isAnimating(testCase: TestCase<Bool>) {
        let result = testCase.result
        let isAnimating = ScrollPhaseState(phase: testCase.phase, velocity: .zero).isAnimating
        #expect(result == isAnimating)
    }
}

extension ScrollPhaseStateTests {
    struct TestCase<Value: Equatable & Sendable>: Sendable {
        static var shouldUpdateValueCases: [TestCase<Bool>] {
            [
                TestCase<Bool>(phase: .idle, result: false),
                TestCase<Bool>(phase: .tracking, result: true),
                TestCase<Bool>(phase: .interacting, result: true),
                TestCase<Bool>(phase: .decelerating, result: true),
                TestCase<Bool>(phase: .animating, result: false)
            ]
        }
        
        static var isScrollingCases: [TestCase<Bool>] {
            [
                TestCase<Bool>(phase: .idle, result: false),
                TestCase<Bool>(phase: .tracking, result: true),
                TestCase<Bool>(phase: .interacting, result: true),
                TestCase<Bool>(phase: .decelerating, result: true),
                TestCase<Bool>(phase: .animating, result: true)
            ]
        }
        
        static var isTrackingCases: [TestCase<Bool>] {
            [
                TestCase<Bool>(phase: .idle, result: false),
                TestCase<Bool>(phase: .tracking, result: true),
                TestCase<Bool>(phase: .interacting, result: false),
                TestCase<Bool>(phase: .decelerating, result: false),
                TestCase<Bool>(phase: .animating, result: false)
            ]
        }
        
        static var isInteractingCases: [TestCase<Bool>] {
            [
                TestCase<Bool>(phase: .idle, result: false),
                TestCase<Bool>(phase: .tracking, result: false),
                TestCase<Bool>(phase: .interacting, result: true),
                TestCase<Bool>(phase: .decelerating, result: false),
                TestCase<Bool>(phase: .animating, result: false)
            ]
        }
        
        static var isDeceleratingCases: [TestCase<Bool>] {
            [
                TestCase<Bool>(phase: .idle, result: false),
                TestCase<Bool>(phase: .tracking, result: false),
                TestCase<Bool>(phase: .interacting, result: false),
                TestCase<Bool>(phase: .decelerating, result: true),
                TestCase<Bool>(phase: .animating, result: false)
            ]
        }
        
        static var isAnimatingCases: [TestCase<Bool>] {
            [
                TestCase<Bool>(phase: .idle, result: false),
                TestCase<Bool>(phase: .tracking, result: false),
                TestCase<Bool>(phase: .interacting, result: false),
                TestCase<Bool>(phase: .decelerating, result: false),
                TestCase<Bool>(phase: .animating, result: true)
            ]
        }
        
        let phase: ScrollPhase
        let result: Value
    }
    
}
