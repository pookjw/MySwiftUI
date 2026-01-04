private import _SwiftUICorePrivate
@testable private import MySwiftUICore
internal import Testing
private import SwiftUI
private import Spatial
private import MySwiftUITestUtils

fileprivate struct _ProposedSize3DTests {
}

extension _ProposedSize3DTests {
    @Test func test_unspecified() {
        let impl = MySwiftUICore._ProposedSize3D.unspecified
        let original = _SwiftUICorePrivate._ProposedSize3D.unspecified
        
        #expect(impl.width == original.width)
        #expect(impl.height == original.height)
        #expect(impl.depth == original.depth)
    }
}

extension _ProposedSize3DTests {
    @Test func test_defaultSize() {
        let impl = MySwiftUICore._ProposedSize3D.defaultSize
        let original = _SwiftUICorePrivate._ProposedSize3D.defaultSize
        
        #expect(impl.width == original.width)
        #expect(impl.height == original.height)
        #expect(impl.depth == original.depth)
    }
}

extension _ProposedSize3DTests {
    struct Input_unspecifyingInfiniteDimensions: Hashable {
        let width: CGFloat?
        let height: CGFloat?
        let depth: CGFloat?
    }

    struct Output_unspecifyingInfiniteDimensions {
        let width: CGFloat?
        let height: CGFloat?
        let depth: CGFloat?
    }

    static let unspecifyingInfiniteDimensions_expectations:
        [Input_unspecifyingInfiniteDimensions: Output_unspecifyingInfiniteDimensions] = [

        Input_unspecifyingInfiniteDimensions(
            width: 100,
            height: 200,
            depth: 300
        ): Output_unspecifyingInfiniteDimensions(
            width: 100,
            height: 200,
            depth: 300
        ),

        Input_unspecifyingInfiniteDimensions(
            width: CGFloat.infinity,
            height: 200,
            depth: 300
        ): Output_unspecifyingInfiniteDimensions(
            width: nil,
            height: 200,
            depth: 300
        ),

        Input_unspecifyingInfiniteDimensions(
            width: 100,
            height: CGFloat.infinity,
            depth: 300
        ): Output_unspecifyingInfiniteDimensions(
            width: 100,
            height: nil,
            depth: 300
        ),

        Input_unspecifyingInfiniteDimensions(
            width: 100,
            height: 200,
            depth: CGFloat.infinity
        ): Output_unspecifyingInfiniteDimensions(
            width: 100,
            height: 200,
            depth: nil
        ),

        Input_unspecifyingInfiniteDimensions(
            width: CGFloat.infinity,
            height: CGFloat.infinity,
            depth: CGFloat.infinity
        ): Output_unspecifyingInfiniteDimensions(
            width: nil,
            height: nil,
            depth: nil
        ),

        Input_unspecifyingInfiniteDimensions(
            width: nil,
            height: nil,
            depth: nil
        ): Output_unspecifyingInfiniteDimensions(
            width: nil,
            height: nil,
            depth: nil
        ),

        Input_unspecifyingInfiniteDimensions(
            width: nil,
            height: CGFloat.infinity,
            depth: nil
        ): Output_unspecifyingInfiniteDimensions(
            width: nil,
            height: nil,
            depth: nil
        ),

        Input_unspecifyingInfiniteDimensions(
            width: CGFloat.nan,
            height: CGFloat.infinity,
            depth: CGFloat.nan
        ): Output_unspecifyingInfiniteDimensions(
            width: nil,
            height: nil,
            depth: nil
        ),

        Input_unspecifyingInfiniteDimensions(
            width: -CGFloat.infinity,
            height: 50,
            depth: -CGFloat.infinity
        ): Output_unspecifyingInfiniteDimensions(
            width: nil,
            height: 50,
            depth: nil
        )
    ]

    @Test(arguments: Self.unspecifyingInfiniteDimensions_expectations)
    func test_unspecifyingInfiniteDimensions(
        input: Input_unspecifyingInfiniteDimensions,
        output: Output_unspecifyingInfiniteDimensions
    ) {
        let impl = MySwiftUICore._ProposedSize3D(
            width: input.width,
            height: input.height,
            depth: input.depth
        ).unspecifyingInfiniteDimensions()

        if let expectedWidth = output.width {
            #expect(impl.width?.bitPattern == expectedWidth.bitPattern)
        } else {
            #expect(impl.width == nil)
        }

        if let expectedHeight = output.height {
            #expect(impl.height?.bitPattern == expectedHeight.bitPattern)
        } else {
            #expect(impl.height == nil)
        }

        if let expectedDepth = output.depth {
            #expect(impl.depth?.bitPattern == expectedDepth.bitPattern)
        } else {
            #expect(impl.depth == nil)
        }

        let original = _SwiftUICorePrivate._ProposedSize3D(
            width: input.width,
            height: input.height,
            depth: input.depth
        ).unspecifyingInfiniteDimensions()

        if let expectedWidth = output.width {
            #expect(original.width?.bitPattern == expectedWidth.bitPattern)
        } else {
            #expect(original.width == nil)
        }

        if let expectedHeight = output.height {
            #expect(original.height?.bitPattern == expectedHeight.bitPattern)
        } else {
            #expect(original.height == nil)
        }

        if let expectedDepth = output.depth {
            #expect(original.depth?.bitPattern == expectedDepth.bitPattern)
        } else {
            #expect(original.depth == nil)
        }
    }
}

extension _ProposedSize3DTests {
    struct Input_inset: Hashable {
        let proposalWidth: CGFloat?
        let proposalHeight: CGFloat?
        let proposalDepth: CGFloat?
        let insetsTop: CGFloat
        let insetsLeading: CGFloat
        let insetsBottom: CGFloat
        let insetsTrailing: CGFloat
        let insetsFront: CGFloat
        let insetsBack: CGFloat
    }
    
    struct Output_inset {
        let proposalWidth: CGFloat?
        let proposalHeight: CGFloat?
        let proposalDepth: CGFloat?
    }
    
    static let inset_expectations: [Input_inset: Output_inset] = [
        Input_inset(
            proposalWidth: 100,
            proposalHeight: 80,
            proposalDepth: 60,
            insetsTop: 10,
            insetsLeading: 10,
            insetsBottom: 10,
            insetsTrailing: 10,
            insetsFront: 10,
            insetsBack: 10
        ): Output_inset(
            proposalWidth: 80,
            proposalHeight: 60,
            proposalDepth: 40
        ),
        
        Input_inset(
            proposalWidth: 15,
            proposalHeight: 15,
            proposalDepth: 15,
            insetsTop: 10,
            insetsLeading: 10,
            insetsBottom: 10,
            insetsTrailing: 10,
            insetsFront: 10,
            insetsBack: 10
        ): Output_inset(
            proposalWidth: 0,
            proposalHeight: 0,
            proposalDepth: 0
        ),
        
        Input_inset(
            proposalWidth: .nan,
            proposalHeight: 100,
            proposalDepth: 100,
            insetsTop: 10,
            insetsLeading: 10,
            insetsBottom: 10,
            insetsTrailing: 10,
            insetsFront: 10,
            insetsBack: 10
        ): Output_inset(
            proposalWidth: 0,
            proposalHeight: 80,
            proposalDepth: 80
        ),
        
        Input_inset(
            proposalWidth: .infinity,
            proposalHeight: 100,
            proposalDepth: 100,
            insetsTop: 10,
            insetsLeading: 10,
            insetsBottom: 10,
            insetsTrailing: 10,
            insetsFront: 10,
            insetsBack: 10
        ): Output_inset(
            proposalWidth: .infinity,
            proposalHeight: 80,
            proposalDepth: 80
        ),
        
        Input_inset(
            proposalWidth: -.infinity,
            proposalHeight: 100,
            proposalDepth: 100,
            insetsTop: 10,
            insetsLeading: 10,
            insetsBottom: 10,
            insetsTrailing: 10,
            insetsFront: 10,
            insetsBack: 10
        ): Output_inset(
            proposalWidth: 0,
            proposalHeight: 80,
            proposalDepth: 80
        ),
        
        Input_inset(
            proposalWidth: nil,
            proposalHeight: nil,
            proposalDepth: nil,
            insetsTop: 10,
            insetsLeading: 10,
            insetsBottom: 10,
            insetsTrailing: 10,
            insetsFront: 10,
            insetsBack: 10
        ): Output_inset(
            proposalWidth: nil,
            proposalHeight: nil,
            proposalDepth: nil
        )
    ]
    
    @Test(arguments: Self.inset_expectations)
    func test_inset(input: Input_inset, output: Output_inset) {
        let impl = MySwiftUICore._ProposedSize3D(
            width: input.proposalWidth,
            height: input.proposalHeight,
            depth: input.proposalDepth
        ).inset(
            by: MySwiftUICore.EdgeInsets3D(
                top: input.insetsTop,
                leading: input.insetsLeading,
                bottom: input.insetsBottom,
                trailing: input.insetsTrailing,
                front: input.insetsFront,
                back: input.insetsBack
            )
        )
        
        #expect(impl.width?.bitPattern == output.proposalWidth?.bitPattern)
        #expect(impl.height?.bitPattern == output.proposalHeight?.bitPattern)
        #expect(impl.depth?.bitPattern == output.proposalDepth?.bitPattern)
        
        let original = _SwiftUICorePrivate._ProposedSize3D(
            width: input.proposalWidth,
            height: input.proposalHeight,
            depth: input.proposalDepth
        ).inset(
            by: SwiftUI.EdgeInsets3D(
                top: input.insetsTop,
                leading: input.insetsLeading,
                bottom: input.insetsBottom,
                trailing: input.insetsTrailing,
                front: input.insetsFront,
                back: input.insetsBack
            )
        )
        
        #expect(original.width?.bitPattern == output.proposalWidth?.bitPattern)
        #expect(original.height?.bitPattern == output.proposalHeight?.bitPattern)
        #expect(original.depth?.bitPattern == output.proposalDepth?.bitPattern)
    }
}
