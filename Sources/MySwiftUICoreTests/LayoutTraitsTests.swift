private import _SwiftUICorePrivate
@testable @_private(sourceFile: "LayoutTraits.swift") private import MySwiftUICore
internal import Testing
private import SwiftUI

fileprivate struct LayoutTraitsTests {
    @Test func test_idealSize_getter() {
        let expectedWidth = SwiftUI::_LayoutTraits.Dimension(min: 1, ideal: 2.5, max: 4)
        let expectedHeight = SwiftUI::_LayoutTraits.Dimension(min: 3, ideal: 6.5, max: 9)
        
        let traits = MySwiftUICore::_LayoutTraits(
            width: MySwiftUICore::_LayoutTraits.Dimension(min: expectedWidth.min, ideal: expectedWidth.ideal, max: expectedWidth.max),
            height: MySwiftUICore::_LayoutTraits.Dimension(min: expectedHeight.min, ideal: expectedHeight.ideal, max: expectedHeight.max)
        )
        
        #expect(isEqual(impl: traits.width, original: expectedWidth))
        #expect(isEqual(impl: traits.height, original: expectedHeight))
        #expect(isEqual(lhs: traits.idealSize, rhs: CGSize(width: expectedWidth.ideal, height: expectedHeight.ideal)))
    }
    
    @Test func test_minSize_getter() {
        let expectedWidth = SwiftUI::_LayoutTraits.Dimension(min: 2, ideal: 6, max: 10)
        let expectedHeight = SwiftUI::_LayoutTraits.Dimension(min: 0, ideal: 4, max: 8)
        
        let traits = MySwiftUICore::_LayoutTraits(
            width: MySwiftUICore::_LayoutTraits.Dimension(min: expectedWidth.min, ideal: expectedWidth.ideal, max: expectedWidth.max),
            height: MySwiftUICore::_LayoutTraits.Dimension(min: expectedHeight.min, ideal: expectedHeight.ideal, max: expectedHeight.max)
        )
        
        #expect(isEqual(impl: traits.width, original: expectedWidth))
        #expect(isEqual(impl: traits.height, original: expectedHeight))
        #expect(isEqual(lhs: traits.minSize, rhs: CGSize(width: expectedWidth.min, height: expectedHeight.min)))
    }
    
    @Test func test_maxSize_getter() {
        let expectedWidth = SwiftUI::_LayoutTraits.Dimension(min: 1, ideal: 3, max: 14)
        let expectedHeight = SwiftUI::_LayoutTraits.Dimension(min: 2, ideal: 4, max: 10)
        
        let traits = MySwiftUICore::_LayoutTraits(
            width: MySwiftUICore::_LayoutTraits.Dimension(min: expectedWidth.min, ideal: expectedWidth.ideal, max: expectedWidth.max),
            height: MySwiftUICore::_LayoutTraits.Dimension(min: expectedHeight.min, ideal: expectedHeight.ideal, max: expectedHeight.max)
        )
        
        #expect(isEqual(impl: traits.width, original: expectedWidth))
        #expect(isEqual(impl: traits.height, original: expectedHeight))
        #expect(isEqual(lhs: traits.maxSize, rhs: CGSize(width: expectedWidth.max, height: expectedHeight.max)))
    }
    
    @Test func test_idealSize_setter() {
        var traits = MySwiftUICore::_LayoutTraits(
            width: MySwiftUICore::_LayoutTraits.Dimension(min: 1, ideal: 2, max: 4),
            height: MySwiftUICore::_LayoutTraits.Dimension(min: 3, ideal: 5, max: 9)
        )
        
        traits.idealSize = CGSize(width: 2.5, height: 6.5)
        
        #expect(isEqual(impl: traits.width, original: SwiftUI::_LayoutTraits.Dimension(min: 1, ideal: 2.5, max: 4)))
        #expect(isEqual(impl: traits.height, original: SwiftUI::_LayoutTraits.Dimension(min: 3, ideal: 6.5, max: 9)))
    }
    
    @Test func test_minSize_setter() {
        var traits = MySwiftUICore::_LayoutTraits(
            width: MySwiftUICore::_LayoutTraits.Dimension(min: 1, ideal: 2, max: 4),
            height: MySwiftUICore::_LayoutTraits.Dimension(min: 3, ideal: 5, max: 9)
        )
        
        traits.minSize = CGSize(width: 0, height: 4.5)
        
        #expect(isEqual(impl: traits.width, original: SwiftUI::_LayoutTraits.Dimension(min: 0, ideal: 2, max: 4)))
        #expect(isEqual(impl: traits.height, original: SwiftUI::_LayoutTraits.Dimension(min: 4.5, ideal: 5, max: 9)))
    }
    
    @Test func test_maxSize_setter() {
        var traits = MySwiftUICore::_LayoutTraits(
            width: MySwiftUICore::_LayoutTraits.Dimension(min: 1, ideal: 2, max: 4),
            height: MySwiftUICore::_LayoutTraits.Dimension(min: 3, ideal: 5, max: 9)
        )
        
        traits.maxSize = CGSize(width: 10, height: 12)
        
        #expect(isEqual(impl: traits.width, original: SwiftUI::_LayoutTraits.Dimension(min: 1, ideal: 2, max: 10)))
        #expect(isEqual(impl: traits.height, original: SwiftUI::_LayoutTraits.Dimension(min: 3, ideal: 5, max: 12)))
    }
}

fileprivate struct LayoutTraitsDimensionTests {
    @Test func test_init() {
        #expect(
            isEqual(
                impl: MySwiftUICore::_LayoutTraits.Dimension(min: 1, ideal: 2, max: 4),
                original: SwiftUI::_LayoutTraits.Dimension(min: 1, ideal: 2, max: 4)
            )
        )
        
        #expect(
            isEqual(
                impl: MySwiftUICore::_LayoutTraits.Dimension(min: 2, ideal: 2, max: 4),
                original: SwiftUI::_LayoutTraits.Dimension(min: 2, ideal: 2, max: 4)
            )
        )
        
        #expect(
            isEqual(
                impl: MySwiftUICore::_LayoutTraits.Dimension(min: 1, ideal: 2, max: .infinity),
                original: SwiftUI::_LayoutTraits.Dimension(min: 1, ideal: 2, max: .infinity)
            )
        )
        
        #expect(
            isEqual(
                impl: MySwiftUICore::_LayoutTraits.Dimension(min: 4, ideal: 4, max: 5),
                original: SwiftUI::_LayoutTraits.Dimension(min: 4, ideal: 4, max: 5)
            )
        )
    }
}

fileprivate struct LayoutTraitsFlexibilityEstimateTests {
    @Test func test_init() {
        #expect(
            isEqual(
                impl: MySwiftUICore::_LayoutTraits.FlexibilityEstimate(minLength: 1, maxLength: 2),
                original: SwiftUI::_LayoutTraits.FlexibilityEstimate(minLength: 1, maxLength: 2)
            )
        )
        
        #expect(
            isEqual(
                impl: MySwiftUICore::_LayoutTraits.FlexibilityEstimate(minLength: .nan, maxLength: .infinity),
                original: SwiftUI::_LayoutTraits.FlexibilityEstimate(minLength: .nan, maxLength: .infinity)
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
            (MySwiftUICore::_LayoutTraits.FlexibilityEstimate(minLength: expectation.minLength1, maxLength: expectation.maxLength1) <
            MySwiftUICore::_LayoutTraits.FlexibilityEstimate(minLength: expectation.minLength2, maxLength: expectation.maxLength2)) ==
            expectation.result
        )
        
        #expect(
            (SwiftUI::_LayoutTraits.FlexibilityEstimate(minLength: expectation.minLength1, maxLength: expectation.maxLength1) <
            SwiftUI::_LayoutTraits.FlexibilityEstimate(minLength: expectation.minLength2, maxLength: expectation.maxLength2)) ==
            expectation.result
        )
    }
}

fileprivate func isEqual(impl: MySwiftUICore::_LayoutTraits.Dimension, original: SwiftUI::_LayoutTraits.Dimension) -> Bool {
    return impl.min.bitPattern == original.min.bitPattern &&
    impl.ideal.bitPattern == original.ideal.bitPattern
    && impl.max.bitPattern == original.max.bitPattern
}

fileprivate func isEqual(impl: MySwiftUICore::_LayoutTraits.FlexibilityEstimate, original: SwiftUI::_LayoutTraits.FlexibilityEstimate) -> Bool {
    return impl.minLength.bitPattern == original.minLength.bitPattern &&
    impl.maxLength.bitPattern == original.maxLength.bitPattern
}

fileprivate func isEqual(lhs: CGSize, rhs: CGSize) -> Bool {
    return lhs.width.bitPattern == rhs.width.bitPattern &&
    lhs.height.bitPattern == rhs.height.bitPattern
}

extension SwiftUI::_LayoutTraits.FlexibilityEstimate {
    fileprivate var minLength: CGFloat {
        return Mirror(reflecting: self).descendant("minLength") as! CGFloat
    }
    
    fileprivate var maxLength: CGFloat {
        return Mirror(reflecting: self).descendant("maxLength") as! CGFloat
    }
}
