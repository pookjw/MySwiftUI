private import _SwiftUICorePrivate
@testable @_private(sourceFile: "LayoutTraits.swift") private import MySwiftUICore
internal import Testing
private import SwiftUI

fileprivate struct LayoutTraitsDimensionTests {
    @Test func test_init() {
        #expect(
            isEqual(
                impl: MySwiftUICore._LayoutTraits.Dimension(min: 1, ideal: 2, max: 4),
                original: SwiftUI._LayoutTraits.Dimension(min: 1, ideal: 2, max: 4)
            )
        )
        
        #expect(
            isEqual(
                impl: MySwiftUICore._LayoutTraits.Dimension(min: 2, ideal: 2, max: 4),
                original: SwiftUI._LayoutTraits.Dimension(min: 2, ideal: 2, max: 4)
            )
        )
        
        #expect(
            isEqual(
                impl: MySwiftUICore._LayoutTraits.Dimension(min: 1, ideal: 2, max: .infinity),
                original: SwiftUI._LayoutTraits.Dimension(min: 1, ideal: 2, max: .infinity)
            )
        )
        
        #expect(
            isEqual(
                impl: MySwiftUICore._LayoutTraits.Dimension(min: 4, ideal: 4, max: 5),
                original: SwiftUI._LayoutTraits.Dimension(min: 4, ideal: 4, max: 5)
            )
        )
    }
}

fileprivate struct LayoutTraitsFlexibilityEstimateTests {
    @Test func test_init() {
        #expect(
            isEqual(
                impl: MySwiftUICore._LayoutTraits.FlexibilityEstimate(minLength: 1, maxLength: 2),
                original: SwiftUI._LayoutTraits.FlexibilityEstimate(minLength: 1, maxLength: 2)
            )
        )
        
        #expect(
            isEqual(
                impl: MySwiftUICore._LayoutTraits.FlexibilityEstimate(minLength: .nan, maxLength: .infinity),
                original: SwiftUI._LayoutTraits.FlexibilityEstimate(minLength: .nan, maxLength: .infinity)
            )
        )
    }
}

extension LayoutTraitsFlexibilityEstimateTests {
    struct BiggerThanExpectation {
        let minLength1: CGFloat
        let maxLength1: CGFloat
        let minLength2: CGFloat
        let maxLength2: CGFloat
        let result: Bool
        
        static let allCases: [BiggerThanExpectation] = [
            BiggerThanExpectation(minLength1: 0, maxLength1: 10, minLength2: 0, maxLength2: 20, result: true),
            BiggerThanExpectation(minLength1: 0, maxLength1: 20, minLength2: 0, maxLength2: 10, result: false),
            
            BiggerThanExpectation(minLength1: 0, maxLength1: 10, minLength2: 5, maxLength2: 15, result: false),
            BiggerThanExpectation(minLength1: 5, maxLength1: 15, minLength2: 0, maxLength2: 10, result: false),
            
            BiggerThanExpectation(minLength1: 0, maxLength1: 10, minLength2: 0, maxLength2: .infinity, result: true),
            BiggerThanExpectation(minLength1: 0, maxLength1: .infinity, minLength2: 0, maxLength2: 10, result: false),
            
            BiggerThanExpectation(minLength1: 10, maxLength1: .infinity, minLength2: 20, maxLength2: .infinity, result: false),
            BiggerThanExpectation(minLength1: 20, maxLength1: .infinity, minLength2: 10, maxLength2: .infinity, result: true),
            BiggerThanExpectation(minLength1: 10, maxLength1: .infinity, minLength2: 10, maxLength2: .infinity, result: false),
            
            BiggerThanExpectation(minLength1: -.infinity, maxLength1: 0, minLength2: 0, maxLength2: 10, result: false),
            BiggerThanExpectation(minLength1: 0, maxLength1: 10, minLength2: -.infinity, maxLength2: 0, result: true),
            BiggerThanExpectation(minLength1: -.infinity, maxLength1: 0, minLength2: -100, maxLength2: .infinity, result: true),
            
            BiggerThanExpectation(minLength1: .nan, maxLength1: 10, minLength2: 0, maxLength2: 10, result: false),
            BiggerThanExpectation(minLength1: 0, maxLength1: 10, minLength2: .nan, maxLength2: 10, result: false),
            BiggerThanExpectation(minLength1: .nan, maxLength1: .nan, minLength2: 0, maxLength2: 10, result: false),
            BiggerThanExpectation(minLength1: 0, maxLength1: 10, minLength2: .nan, maxLength2: .nan, result: false),
            BiggerThanExpectation(minLength1: .nan, maxLength1: .infinity, minLength2: 0, maxLength2: .infinity, result: false),
        ]
    }
    
    @Test(arguments: BiggerThanExpectation.allCases) func test_biggerThan(expectation: BiggerThanExpectation) {
        #expect(
            (MySwiftUICore._LayoutTraits.FlexibilityEstimate(minLength: expectation.minLength1, maxLength: expectation.maxLength1) <
            MySwiftUICore._LayoutTraits.FlexibilityEstimate(minLength: expectation.minLength2, maxLength: expectation.maxLength2)) ==
            expectation.result
        )
        
        #expect(
            (SwiftUI._LayoutTraits.FlexibilityEstimate(minLength: expectation.minLength1, maxLength: expectation.maxLength1) <
            SwiftUI._LayoutTraits.FlexibilityEstimate(minLength: expectation.minLength2, maxLength: expectation.maxLength2)) ==
            expectation.result
        )
    }
}

fileprivate func isEqual(impl: MySwiftUICore._LayoutTraits.Dimension, original: SwiftUI._LayoutTraits.Dimension) -> Bool {
    return impl.min.bitPattern == original.min.bitPattern &&
    impl.ideal.bitPattern == original.ideal.bitPattern
    && impl.max.bitPattern == original.max.bitPattern
}

fileprivate func isEqual(impl: MySwiftUICore._LayoutTraits.FlexibilityEstimate, original: SwiftUI._LayoutTraits.FlexibilityEstimate) -> Bool {
    return impl.minLength.bitPattern == original.minLength.bitPattern &&
    impl.maxLength.bitPattern == original.maxLength.bitPattern
}

extension SwiftUI._LayoutTraits.FlexibilityEstimate {
    fileprivate var minLength: CGFloat {
        return Mirror(reflecting: self).descendant("minLength") as! CGFloat
    }
    
    fileprivate var maxLength: CGFloat {
        return Mirror(reflecting: self).descendant("maxLength") as! CGFloat
    }
}
