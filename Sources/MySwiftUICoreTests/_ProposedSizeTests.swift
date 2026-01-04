private import _SwiftUICorePrivate
@testable private import MySwiftUICore
internal import Testing
private import SwiftUI
private import Spatial
private import MySwiftUITestUtils

fileprivate struct _ProposedSizeTests {
}

extension _ProposedSizeTests {
    struct Input_init_width_height: Hashable {
        let width: CGFloat?
        let height: CGFloat?
    }
    
    struct Output_init_width_height {
        let width: CGFloat?
        let height: CGFloat?
    }
    
    static let init_width_height_expectations: [Input_init_width_height: Output_init_width_height] = [
        Input_init_width_height(width: 10, height: 20): Output_init_width_height(width: 10, height: 20),
        Input_init_width_height(width: nil, height: 20): Output_init_width_height(width: nil, height: 20),
        Input_init_width_height(width: 10, height: nil): Output_init_width_height(width: 10, height: nil),
        Input_init_width_height(width: nil, height: nil): Output_init_width_height(width: nil, height: nil),
        Input_init_width_height(width: .nan, height: .nan): Output_init_width_height(width: .nan, height: .nan),
        Input_init_width_height(width: .infinity, height: -.infinity): Output_init_width_height(width: .infinity, height: -.infinity)
    ]
    
    @Test(arguments: Self.init_width_height_expectations)
    func test_init_width_height(input: Input_init_width_height, output: Output_init_width_height) {
        let impl = MySwiftUICore._ProposedSize(width: input.width, height: input.height)
        
        #expect(impl.width?.bitPattern == output.width?.bitPattern)
        #expect(impl.height?.bitPattern == output.height?.bitPattern)
        
        let original = SwiftUI._ProposedSize(width: input.width, height: input.height)
        
        #expect(original.width?.bitPattern == output.width?.bitPattern)
        #expect(original.height?.bitPattern == output.height?.bitPattern)
    }
}

extension _ProposedSizeTests {
    @Test func test_init() {
        let impl = MySwiftUICore._ProposedSize()
        
        #expect(impl.width == nil)
        #expect(impl.height == nil)
        
        let original = SwiftUI._ProposedSize()
        
        #expect(original.width == nil)
        #expect(original.height == nil)
    }
}

extension _ProposedSizeTests {
    struct Input_fixingUnspecified_at: Hashable {
        let proposalWidth: CGFloat?
        let proposalHeight: CGFloat?
        let fallbackWidth: CGFloat
        let fallbackHeight: CGFloat
    }
    
    struct Output_fixingUnspecified_at {
        let result: CGSize
    }
    
    static let fixingUnspecified_at_expectations: [Input_fixingUnspecified_at: Output_fixingUnspecified_at] = [
        Input_fixingUnspecified_at(
            proposalWidth: 10,
            proposalHeight: 20,
            fallbackWidth: 100,
            fallbackHeight: 200
        ): Output_fixingUnspecified_at(
            result: CGSize(width: 10, height: 20)
        ),
        
        Input_fixingUnspecified_at(
            proposalWidth: nil,
            proposalHeight: 20,
            fallbackWidth: 100,
            fallbackHeight: 200
        ): Output_fixingUnspecified_at(
            result: CGSize(width: 100, height: 20)
        ),
        
        Input_fixingUnspecified_at(
            proposalWidth: 10,
            proposalHeight: nil,
            fallbackWidth: 100,
            fallbackHeight: 200
        ): Output_fixingUnspecified_at(
            result: CGSize(width: 10, height: 200)
        ),
        
        Input_fixingUnspecified_at(
            proposalWidth: nil,
            proposalHeight: nil,
            fallbackWidth: 100,
            fallbackHeight: 200
        ): Output_fixingUnspecified_at(
            result: CGSize(width: 100, height: 200)
        ),
        
        Input_fixingUnspecified_at(
            proposalWidth: CGFloat.nan,
            proposalHeight: CGFloat.infinity,
            fallbackWidth: 100,
            fallbackHeight: 200
        ): Output_fixingUnspecified_at(
            result: CGSize(width: CGFloat.nan, height: CGFloat.infinity)
        ),
        
        Input_fixingUnspecified_at(
            proposalWidth: -CGFloat.infinity,
            proposalHeight: nil,
            fallbackWidth: 100,
            fallbackHeight: 200
        ): Output_fixingUnspecified_at(
            result: CGSize(width: -CGFloat.infinity, height: 200)
        )
    ]
    
    @Test(arguments: Self.fixingUnspecified_at_expectations)
    func test_fixingUnspecifiedDimensions_at(input: Input_fixingUnspecified_at, output: Output_fixingUnspecified_at) {
        let impl = MySwiftUICore._ProposedSize(
            width: input.proposalWidth,
            height: input.proposalHeight
        ).fixingUnspecifiedDimensions(
            at: CGSize(width: input.fallbackWidth, height: input.fallbackHeight)
        )
        
        #expect(impl.width.bitPattern == output.result.width.bitPattern)
        #expect(impl.height.bitPattern == output.result.height.bitPattern)
        
        let original = SwiftUI._ProposedSize(
            width: input.proposalWidth,
            height: input.proposalHeight
        ).fixingUnspecifiedDimensions(
            at: CGSize(width: input.fallbackWidth, height: input.fallbackHeight)
        )
        
        #expect(original.width.bitPattern == output.result.width.bitPattern)
        #expect(original.height.bitPattern == output.result.height.bitPattern)
    }
}

extension _ProposedSizeTests {
    struct Input_fixingUnspecified: Hashable {
        let proposalWidth: CGFloat?
        let proposalHeight: CGFloat?
    }
    
    struct Output_fixingUnspecified {
        let result: CGSize
    }
    
    static let fixingUnspecified_expectations: [Input_fixingUnspecified: Output_fixingUnspecified] = [
        Input_fixingUnspecified(
            proposalWidth: 10,
            proposalHeight: 20
        ): Output_fixingUnspecified(
            result: CGSize(width: 10, height: 20)
        ),
        
        Input_fixingUnspecified(
            proposalWidth: nil,
            proposalHeight: 20
        ): Output_fixingUnspecified(
            result: CGSize(width: 10, height: 20)
        ),
        
        Input_fixingUnspecified(
            proposalWidth: 10,
            proposalHeight: nil
        ): Output_fixingUnspecified(
            result: CGSize(width: 10, height: 10)
        ),
        
        Input_fixingUnspecified(
            proposalWidth: nil,
            proposalHeight: nil
        ): Output_fixingUnspecified(
            result: CGSize(width: 10, height: 10)
        ),
        
        Input_fixingUnspecified(
            proposalWidth: CGFloat.nan,
            proposalHeight: CGFloat.infinity
        ): Output_fixingUnspecified(
            result: CGSize(width: CGFloat.nan, height: CGFloat.infinity)
        )
    ]
    
    @Test(arguments: Self.fixingUnspecified_expectations)
    func test_fixingUnspecifiedDimensions(input: Input_fixingUnspecified, output: Output_fixingUnspecified) {
        let impl = MySwiftUICore._ProposedSize(
            width: input.proposalWidth,
            height: input.proposalHeight
        ).fixingUnspecifiedDimensions()
        
        #expect(impl.width.bitPattern == output.result.width.bitPattern)
        #expect(impl.height.bitPattern == output.result.height.bitPattern)
        
        let original = SwiftUI._ProposedSize(
            width: input.proposalWidth,
            height: input.proposalHeight
        ).fixingUnspecifiedDimensions()
        
        #expect(original.width.bitPattern == output.result.width.bitPattern)
        #expect(original.height.bitPattern == output.result.height.bitPattern)
    }
}

extension _ProposedSizeTests {
    @Test func test_zero() {
        let impl = MySwiftUICore._ProposedSize.zero
        #expect(impl.width == 0)
        #expect(impl.height == 0)
        
        let original = SwiftUI._ProposedSize.zero
        #expect(original.width == 0)
        #expect(original.height == 0)
    }
    
    @Test func test_infinity() {
        let impl = MySwiftUICore._ProposedSize.infinity
        #expect(impl.width?.bitPattern == CGFloat.infinity.bitPattern)
        #expect(impl.height?.bitPattern == CGFloat.infinity.bitPattern)
        
        let original = SwiftUI._ProposedSize.infinity
        #expect(original.width?.bitPattern == CGFloat.infinity.bitPattern)
        #expect(original.height?.bitPattern == CGFloat.infinity.bitPattern)
    }
    
    @Test func test_unspecified() {
        let impl = MySwiftUICore._ProposedSize.unspecified
        #expect(impl.width == nil)
        #expect(impl.height == nil)
        
        let original = SwiftUI._ProposedSize.unspecified
        #expect(original.width == nil)
        #expect(original.height == nil)
    }
}
