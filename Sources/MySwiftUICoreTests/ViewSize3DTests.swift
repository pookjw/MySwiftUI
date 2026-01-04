private import _SwiftUICorePrivate
@testable @_private(sourceFile: "ViewSize3D.swift") private import MySwiftUICore
internal import Testing
private import SwiftUI
private import Spatial
private import MySwiftUITestUtils

fileprivate struct ViewSize3DTests {
}

extension ViewSize3DTests {
    @Test func test_zero() {
        let impl = MySwiftUICore.ViewSize3D.zero
        let original = _SwiftUICorePrivate.ViewSize3D.zero
        
        let expectedValue = Size3D.zero
        let expectedProposal = Size3D.zero
        
        #expect(impl.value.isEqual(to: expectedValue))
        #expect(impl._proposal.isEqual(to: expectedProposal))
        
        #expect(original.value.isEqual(to: expectedValue))
        #expect(original._proposal.isEqual(to: expectedProposal))
    }
}

extension ViewSize3DTests {
    @Test func test_invalidValue() {
        let impl = MySwiftUICore.ViewSize3D.invalidValue
        let original = _SwiftUICorePrivate.ViewSize3D.invalidValue
        
        let expected = Size3D(
            width: -CGFloat.infinity,
            height: -CGFloat.infinity,
            depth: -CGFloat.infinity
        )
        
        #expect(impl.value.isEqual(to: expected))
        #expect(impl._proposal.isEqual(to: expected))
        
        #expect(original.value.isEqual(to: expected))
        #expect(original._proposal.isEqual(to: expected))
    }
}

extension ViewSize3DTests {
    struct Input_fixed: Hashable {
        let size: Size3D
    }
    
    struct Output_fixed {
        let value: Size3D
        let _proposal: Size3D
    }
    
    static let fixed_expectations: [Input_fixed: Output_fixed] = [
        Input_fixed(
            size: Size3D(width: 10, height: 20, depth: 30)
        ): Output_fixed(
            value: Size3D(width: 10, height: 20, depth: 30),
            _proposal: Size3D(width: 10, height: 20, depth: 30)
        ),
        
        Input_fixed(
            size: Size3D(width: CGFloat.nan, height: 20, depth: 30)
        ): Output_fixed(
            value: Size3D(width: CGFloat.nan, height: 20, depth: 30),
            _proposal: Size3D(width: CGFloat.nan, height: 20, depth: 30)
        ),
        
        Input_fixed(
            size: Size3D(width: 10, height: CGFloat.nan, depth: 30)
        ): Output_fixed(
            value: Size3D(width: 10, height: CGFloat.nan, depth: 30),
            _proposal: Size3D(width: 10, height: CGFloat.nan, depth: 30)
        ),
        
        Input_fixed(
            size: Size3D(width: 10, height: 20, depth: CGFloat.nan)
        ): Output_fixed(
            value: Size3D(width: 10, height: 20, depth: CGFloat.nan),
            _proposal: Size3D(width: 10, height: 20, depth: CGFloat.nan)
        ),
        
        Input_fixed(
            size: Size3D(width: CGFloat.infinity, height: 20, depth: 30)
        ): Output_fixed(
            value: Size3D(width: CGFloat.infinity, height: 20, depth: 30),
            _proposal: Size3D(width: CGFloat.infinity, height: 20, depth: 30)
        ),
        
        Input_fixed(
            size: Size3D(width: -CGFloat.infinity, height: 20, depth: 30)
        ): Output_fixed(
            value: Size3D(width: -CGFloat.infinity, height: 20, depth: 30),
            _proposal: Size3D(width: -CGFloat.infinity, height: 20, depth: 30)
        ),
        
        Input_fixed(
            size: Size3D(width: 10, height: CGFloat.infinity, depth: -CGFloat.infinity)
        ): Output_fixed(
            value: Size3D(width: 10, height: CGFloat.infinity, depth: -CGFloat.infinity),
            _proposal: Size3D(width: 10, height: CGFloat.infinity, depth: -CGFloat.infinity)
        ),
        
        Input_fixed(
            size: Size3D(width: CGFloat.nan, height: CGFloat.infinity, depth: -CGFloat.infinity)
        ): Output_fixed(
            value: Size3D(width: CGFloat.nan, height: CGFloat.infinity, depth: -CGFloat.infinity),
            _proposal: Size3D(width: CGFloat.nan, height: CGFloat.infinity, depth: -CGFloat.infinity)
        )
    ]
    
    @Test(arguments: Self.fixed_expectations)
    func test_fixed(input: Input_fixed, output: Output_fixed) {
        let impl = MySwiftUICore.ViewSize3D.fixed(input.size)
        
        #expect(impl.value.isEqual(to: output.value))
        #expect(impl._proposal.isEqual(to: output._proposal))
        
        let original = _SwiftUICorePrivate.ViewSize3D.fixed(input.size)
        
        #expect(original.value.isEqual(to: output.value))
        #expect(original._proposal.isEqual(to: output._proposal))
    }
}

extension ViewSize3DTests {
    struct Input_init_proposal: Hashable {
        let value: Size3D
        let proposalWidth: CGFloat?
        let proposalHeight: CGFloat?
        let proposalDepth: CGFloat?
    }
    
    struct Output_init_proposal {
        let value: Size3D
        let _proposal: Size3D
    }
    
    static let init_proposal_expectations: [Input_init_proposal: Output_init_proposal] = [
        Input_init_proposal(
            value: Size3D(width: 10, height: 20, depth: 30),
            proposalWidth: 40,
            proposalHeight: 50,
            proposalDepth: 60
        ): Output_init_proposal(
            value: Size3D(width: 10, height: 20, depth: 30),
            _proposal: Size3D(width: 40, height: 50, depth: 60)
        ),
        
        Input_init_proposal(
            value: Size3D(width: CGFloat.nan, height: CGFloat.nan, depth: CGFloat.nan),
            proposalWidth: 40,
            proposalHeight: 50,
            proposalDepth: 60
        ): Output_init_proposal(
            value: Size3D(width: CGFloat.nan, height: CGFloat.nan, depth: CGFloat.nan),
            _proposal: Size3D(width: 40, height: 50, depth: 60)
        ),
        
        Input_init_proposal(
            value: Size3D(width: 10, height: 20, depth: 30),
            proposalWidth: 40,
            proposalHeight: 50,
            proposalDepth: nil
        ): Output_init_proposal(
            value: Size3D(width: 10, height: 20, depth: 30),
            _proposal: Size3D(width: 40, height: 50, depth: CGFloat.nan)
        ),
        
        Input_init_proposal(
            value: Size3D(width: 10, height: 20, depth: 30),
            proposalWidth: 40,
            proposalHeight: nil,
            proposalDepth: nil
        ): Output_init_proposal(
            value: Size3D(width: 10, height: 20, depth: 30),
            _proposal: Size3D(width: 40, height: CGFloat.nan, depth: CGFloat.nan)
        ),
        
        Input_init_proposal(
            value: Size3D(width: 10, height: 20, depth: 30),
            proposalWidth: nil,
            proposalHeight: nil,
            proposalDepth: nil
        ): Output_init_proposal(
            value: Size3D(width: 10, height: 20, depth: 30),
            _proposal: Size3D(width: CGFloat.nan, height: CGFloat.nan, depth: CGFloat.nan)
        ),
        
        Input_init_proposal(
            value: Size3D(width: CGFloat.infinity, height: 20, depth: 30),
            proposalWidth: CGFloat.infinity,
            proposalHeight: 50,
            proposalDepth: 60
        ): Output_init_proposal(
            value: Size3D(width: CGFloat.infinity, height: 20, depth: 30),
            _proposal: Size3D(width: CGFloat.infinity, height: 50, depth: 60)
        ),
        
        Input_init_proposal(
            value: Size3D(width: -CGFloat.infinity, height: 20, depth: 30),
            proposalWidth: -CGFloat.infinity,
            proposalHeight: 50,
            proposalDepth: 60
        ): Output_init_proposal(
            value: Size3D(width: -CGFloat.infinity, height: 20, depth: 30),
            _proposal: Size3D(width: -CGFloat.infinity, height: 50, depth: 60)
        ),
        
        Input_init_proposal(
            value: Size3D(width: 10, height: CGFloat.infinity, depth: 30),
            proposalWidth: 40,
            proposalHeight: CGFloat.infinity,
            proposalDepth: 60
        ): Output_init_proposal(
            value: Size3D(width: 10, height: CGFloat.infinity, depth: 30),
            _proposal: Size3D(width: 40, height: CGFloat.infinity, depth: 60)
        ),
        
        Input_init_proposal(
            value: Size3D(width: 10, height: 20, depth: -CGFloat.infinity),
            proposalWidth: 40,
            proposalHeight: 50,
            proposalDepth: -CGFloat.infinity
        ): Output_init_proposal(
            value: Size3D(width: 10, height: 20, depth: -CGFloat.infinity),
            _proposal: Size3D(width: 40, height: 50, depth: -CGFloat.infinity)
        )
    ]
    
    @Test(arguments: Self.init_proposal_expectations)
    func test_init_proposal(input: Input_init_proposal, output: Output_init_proposal) {
        let impl = MySwiftUICore.ViewSize3D(
            input.value,
            proposal: MySwiftUICore._ProposedSize3D(
                width: input.proposalWidth,
                height: input.proposalHeight,
                depth: input.proposalDepth
            )
        )
        
        #expect(impl.value.isEqual(to: output.value))
        #expect(impl._proposal.isEqual(to: output._proposal))
        
        let original = _SwiftUICorePrivate.ViewSize3D(
            input.value,
            proposal: _SwiftUICorePrivate._ProposedSize3D(
                width: input.proposalWidth,
                height: input.proposalHeight,
                depth: input.proposalDepth
            )
        )
        
        #expect(original.value.isEqual(to: output.value))
        #expect(original._proposal.isEqual(to: output._proposal))
    }
}

extension ViewSize3DTests {
    struct Input_dimension: Hashable {
        let initialValue: Size3D
        let proposalWidth: CGFloat?
        let proposalHeight: CGFloat?
        let proposalDepth: CGFloat?
        let newWidth: CGFloat
        let newHeight: CGFloat
        let newDepth: CGFloat
    }
    
    struct Output_dimension {
        let value: Size3D
        let _proposal: Size3D
    }
    
    static let dimension_expectations: [Input_dimension: Output_dimension] = [
        Input_dimension(
            initialValue: Size3D(width: 10, height: 20, depth: 30),
            proposalWidth: 40,
            proposalHeight: 50,
            proposalDepth: 60,
            newWidth: 100,
            newHeight: 200,
            newDepth: 300
        ): Output_dimension(
            value: Size3D(width: 100, height: 200, depth: 300),
            _proposal: Size3D(width: 40, height: 50, depth: 60)
        ),
        
        Input_dimension(
            initialValue: Size3D(width: 10, height: 20, depth: 30),
            proposalWidth: nil,
            proposalHeight: nil,
            proposalDepth: nil,
            newWidth: CGFloat.infinity,
            newHeight: -CGFloat.infinity,
            newDepth: CGFloat.nan
        ): Output_dimension(
            value: Size3D(width: CGFloat.infinity, height: -CGFloat.infinity, depth: CGFloat.nan),
            _proposal: Size3D(width: CGFloat.nan, height: CGFloat.nan, depth: CGFloat.nan)
        ),
        
        Input_dimension(
            initialValue: Size3D(width: CGFloat.nan, height: CGFloat.nan, depth: CGFloat.nan),
            proposalWidth: 40,
            proposalHeight: 50,
            proposalDepth: 60,
            newWidth: CGFloat.nan,
            newHeight: 0,
            newDepth: -CGFloat.infinity
        ): Output_dimension(
            value: Size3D(width: CGFloat.nan, height: 0, depth: -CGFloat.infinity),
            _proposal: Size3D(width: 40, height: 50, depth: 60)
        )
    ]
    
    @Test(arguments: Self.dimension_expectations)
    func test_dimensions(input: Input_dimension, output: Output_dimension) {
        let implInitial = MySwiftUICore.ViewSize3D(
            input.initialValue,
            proposal: MySwiftUICore._ProposedSize3D(
                width: input.proposalWidth,
                height: input.proposalHeight,
                depth: input.proposalDepth
            )
        )
        
        #expect(implInitial.width.bitPattern == input.initialValue.width.bitPattern)
        #expect(implInitial.height.bitPattern == input.initialValue.height.bitPattern)
        #expect(implInitial.depth.bitPattern == input.initialValue.depth.bitPattern)
        
        var impl = implInitial
        impl.width = input.newWidth
        impl.height = input.newHeight
        impl.depth = input.newDepth
        
        #expect(impl.width.bitPattern == output.value.width.bitPattern)
        #expect(impl.height.bitPattern == output.value.height.bitPattern)
        #expect(impl.depth.bitPattern == output.value.depth.bitPattern)
        #expect(impl.value.isEqual(to: output.value))
        #expect(impl._proposal.isEqual(to: output._proposal))
        
        let originalInitial = _SwiftUICorePrivate.ViewSize3D(
            input.initialValue,
            proposal: _SwiftUICorePrivate._ProposedSize3D(
                width: input.proposalWidth,
                height: input.proposalHeight,
                depth: input.proposalDepth
            )
        )
        
        #expect(originalInitial.width.bitPattern == input.initialValue.width.bitPattern)
        #expect(originalInitial.height.bitPattern == input.initialValue.height.bitPattern)
        #expect(originalInitial.depth.bitPattern == input.initialValue.depth.bitPattern)
        
        var original = originalInitial
        original.width = input.newWidth
        original.height = input.newHeight
        original.depth = input.newDepth
        
        #expect(original.width.bitPattern == output.value.width.bitPattern)
        #expect(original.height.bitPattern == output.value.height.bitPattern)
        #expect(original.depth.bitPattern == output.value.depth.bitPattern)
        #expect(original.value.isEqual(to: output.value))
        #expect(original._proposal.isEqual(to: output._proposal))
    }
}

extension ViewSize3DTests {
    struct Input_proposal: Hashable {
        let initialValue: Size3D
        let proposalWidth: CGFloat?
        let proposalHeight: CGFloat?
        let proposalDepth: CGFloat?
        let newProposalWidth: CGFloat?
        let newProposalHeight: CGFloat?
        let newProposalDepth: CGFloat?
    }
    
    struct Output_proposal {
        let value: Size3D
        let _proposal: Size3D
        let proposalWidth: CGFloat?
        let proposalHeight: CGFloat?
        let proposalDepth: CGFloat?
    }
    
    static let proposal_expectations: [Input_proposal: Output_proposal] = [
        Input_proposal(
            initialValue: Size3D(width: 10, height: 20, depth: 30),
            proposalWidth: 40,
            proposalHeight: 50,
            proposalDepth: 60,
            newProposalWidth: 70,
            newProposalHeight: 80,
            newProposalDepth: 90
        ): Output_proposal(
            value: Size3D(width: 10, height: 20, depth: 30),
            _proposal: Size3D(width: 70, height: 80, depth: 90),
            proposalWidth: 70,
            proposalHeight: 80,
            proposalDepth: 90
        ),
        
        Input_proposal(
            initialValue: Size3D(width: 10, height: 20, depth: 30),
            proposalWidth: nil,
            proposalHeight: nil,
            proposalDepth: nil,
            newProposalWidth: nil,
            newProposalHeight: nil,
            newProposalDepth: nil
        ): Output_proposal(
            value: Size3D(width: 10, height: 20, depth: 30),
            _proposal: Size3D(width: CGFloat.nan, height: CGFloat.nan, depth: CGFloat.nan),
            proposalWidth: nil,
            proposalHeight: nil,
            proposalDepth: nil
        ),
        
        Input_proposal(
            initialValue: Size3D(width: 10, height: 20, depth: 30),
            proposalWidth: 40,
            proposalHeight: 50,
            proposalDepth: 60,
            newProposalWidth: CGFloat.nan,
            newProposalHeight: CGFloat.infinity,
            newProposalDepth: -CGFloat.infinity
        ): Output_proposal(
            value: Size3D(width: 10, height: 20, depth: 30),
            _proposal: Size3D(width: CGFloat.nan, height: CGFloat.infinity, depth: -CGFloat.infinity),
            proposalWidth: nil,
            proposalHeight: CGFloat.infinity,
            proposalDepth: -CGFloat.infinity
        ),
        
        Input_proposal(
            initialValue: Size3D(width: 10, height: 20, depth: 30),
            proposalWidth: CGFloat.nan,
            proposalHeight: CGFloat.nan,
            proposalDepth: CGFloat.nan,
            newProposalWidth: 100,
            newProposalHeight: nil,
            newProposalDepth: 200
        ): Output_proposal(
            value: Size3D(width: 10, height: 20, depth: 30),
            _proposal: Size3D(width: 100, height: CGFloat.nan, depth: 200),
            proposalWidth: 100,
            proposalHeight: nil,
            proposalDepth: 200
        )
    ]
    
    @Test(arguments: Self.proposal_expectations)
    func test_proposal(input: Input_proposal, output: Output_proposal) {
        var impl = MySwiftUICore.ViewSize3D(
            input.initialValue,
            proposal: MySwiftUICore._ProposedSize3D(
                width: input.proposalWidth,
                height: input.proposalHeight,
                depth: input.proposalDepth
            )
        )
        
        impl.proposal = MySwiftUICore._ProposedSize3D(
            width: input.newProposalWidth,
            height: input.newProposalHeight,
            depth: input.newProposalDepth
        )
        
        let proposal = impl.proposal
        #expect(impl.value.isEqual(to: output.value))
        #expect(impl._proposal.isEqual(to: output._proposal))
        #expect(proposal.width == output.proposalWidth)
        #expect(proposal.height == output.proposalHeight)
        #expect(proposal.depth == output.proposalDepth)
        
        var original = _SwiftUICorePrivate.ViewSize3D(
            input.initialValue,
            proposal: _SwiftUICorePrivate._ProposedSize3D(
                width: input.proposalWidth,
                height: input.proposalHeight,
                depth: input.proposalDepth
            )
        )
        
        original.proposal = _SwiftUICorePrivate._ProposedSize3D(
            width: input.newProposalWidth,
            height: input.newProposalHeight,
            depth: input.newProposalDepth
        )
        
        let originalProposal = original.proposal
        #expect(original.value.isEqual(to: output.value))
        #expect(original._proposal.isEqual(to: output._proposal))
        #expect(originalProposal.width == output.proposalWidth)
        #expect(originalProposal.height == output.proposalHeight)
        #expect(originalProposal.depth == output.proposalDepth)
    }
}

extension ViewSize3DTests {
    struct Input_viewDepth: Hashable {
        let initialValue: Size3D
        let proposalWidth: CGFloat?
        let proposalHeight: CGFloat?
        let proposalDepth: CGFloat?
        let newDepthValue: CGFloat
        let newDepthProposal: CGFloat?
    }
    
    struct Output_viewDepth {
        let value: Size3D
        let _proposal: Size3D
        let viewDepthValue: CGFloat
        let viewDepthProposal: CGFloat?
    }
    
    static let viewDepth_expectations: [Input_viewDepth: Output_viewDepth] = [
        Input_viewDepth(
            initialValue: Size3D(width: 10, height: 20, depth: 30),
            proposalWidth: 40,
            proposalHeight: 50,
            proposalDepth: 60,
            newDepthValue: 100,
            newDepthProposal: 200
        ): Output_viewDepth(
            value: Size3D(width: 10, height: 20, depth: 100),
            _proposal: Size3D(width: 40, height: 50, depth: 200),
            viewDepthValue: 100,
            viewDepthProposal: 200
        ),
        
        Input_viewDepth(
            initialValue: Size3D(width: 10, height: 20, depth: 30),
            proposalWidth: 40,
            proposalHeight: 50,
            proposalDepth: CGFloat.nan,
            newDepthValue: 50,
            newDepthProposal: nil
        ): Output_viewDepth(
            value: Size3D(width: 10, height: 20, depth: 50),
            _proposal: Size3D(width: 40, height: 50, depth: CGFloat.infinity),
            viewDepthValue: 50,
            viewDepthProposal: nil
        ),
        
        Input_viewDepth(
            initialValue: Size3D(width: 10, height: 20, depth: CGFloat.nan),
            proposalWidth: 40,
            proposalHeight: 50,
            proposalDepth: CGFloat.nan,
            newDepthValue: CGFloat.nan,
            newDepthProposal: CGFloat.nan
        ): Output_viewDepth(
            value: Size3D(width: 10, height: 20, depth: CGFloat.nan),
            _proposal: Size3D(width: 40, height: 50, depth: CGFloat.nan),
            viewDepthValue: CGFloat.nan,
            viewDepthProposal: nil
        ),
        
        Input_viewDepth(
            initialValue: Size3D(width: 10, height: 20, depth: 30),
            proposalWidth: 40,
            proposalHeight: 50,
            proposalDepth: 60,
            newDepthValue: -CGFloat.infinity,
            newDepthProposal: CGFloat.nan
        ): Output_viewDepth(
            value: Size3D(width: 10, height: 20, depth: -CGFloat.infinity),
            _proposal: Size3D(width: 40, height: 50, depth: CGFloat.nan),
            viewDepthValue: -CGFloat.infinity,
            viewDepthProposal: nil
        )
    ]
    
    @Test(arguments: Self.viewDepth_expectations)
    func test_viewDepth(input: Input_viewDepth, output: Output_viewDepth) {
        var impl = MySwiftUICore.ViewSize3D(
            input.initialValue,
            proposal: MySwiftUICore._ProposedSize3D(
                width: input.proposalWidth,
                height: input.proposalHeight,
                depth: input.proposalDepth
            )
        )
        
        let initialViewDepth = impl.viewDepth
        #expect(initialViewDepth.value.bitPattern == input.initialValue.depth.bitPattern)
        #expect(initialViewDepth.proposal == (input.proposalDepth?.isNaN == true ? nil : input.proposalDepth))
        
        impl.viewDepth = MySwiftUICore.ViewDepth(
            input.newDepthValue,
            proposal: input.newDepthProposal
        )
        
        let resultViewDepth = impl.viewDepth
        #expect(impl.value.isEqual(to: output.value))
        #expect(impl._proposal.isEqual(to: output._proposal))
        #expect(resultViewDepth.value.bitPattern == output.viewDepthValue.bitPattern)
        #expect(resultViewDepth.proposal == output.viewDepthProposal)
        
        var original = _SwiftUICorePrivate.ViewSize3D(
            input.initialValue,
            proposal: _SwiftUICorePrivate._ProposedSize3D(
                width: input.proposalWidth,
                height: input.proposalHeight,
                depth: input.proposalDepth
            )
        )
        
        let originalInitialViewDepth = original.viewDepth
        #expect(originalInitialViewDepth.value.bitPattern == input.initialValue.depth.bitPattern)
        #expect(originalInitialViewDepth.proposal == (input.proposalDepth?.isNaN == true ? nil : input.proposalDepth))
        
        original.viewDepth = _SwiftUICorePrivate.ViewDepth(
            input.newDepthValue,
            proposal: input.newDepthProposal
        )
        
        let originalResultViewDepth = original.viewDepth
        #expect(original.value.isEqual(to: output.value))
        #expect(original._proposal.isEqual(to: output._proposal))
        #expect(originalResultViewDepth.value.bitPattern == output.viewDepthValue.bitPattern)
        #expect(originalResultViewDepth.proposal == output.viewDepthProposal)
    }
}

extension ViewSize3DTests {
    struct Input_size2D: Hashable {
        let initialValue: Size3D
        let proposalWidth: CGFloat?
        let proposalHeight: CGFloat?
        let proposalDepth: CGFloat?
        let new2DValue: CGSize
        let new2DProposalWidth: CGFloat?
        let new2DProposalHeight: CGFloat?
    }
    
    struct Output_size2D {
        let value: Size3D
        let _proposal: Size3D
        let size2DValue: CGSize
    }
    
    static let size2D_expectations: [Input_size2D: Output_size2D] = [
        Input_size2D(
            initialValue: Size3D(width: 10, height: 20, depth: 30),
            proposalWidth: 40,
            proposalHeight: 50,
            proposalDepth: 60,
            new2DValue: CGSize(width: 100, height: 200),
            new2DProposalWidth: 300,
            new2DProposalHeight: 400
        ): Output_size2D(
            value: Size3D(width: 100, height: 200, depth: 30),
            _proposal: Size3D(width: 300, height: 400, depth: 60),
            size2DValue: CGSize(width: 100, height: 200)
        ),
        
        Input_size2D(
            initialValue: Size3D(width: CGFloat.nan, height: 20, depth: 30),
            proposalWidth: CGFloat.nan,
            proposalHeight: 50,
            proposalDepth: CGFloat.infinity,
            new2DValue: CGSize(width: CGFloat.nan, height: 0),
            new2DProposalWidth: nil,
            new2DProposalHeight: CGFloat.infinity
        ): Output_size2D(
            value: Size3D(width: CGFloat.nan, height: 0, depth: 30),
            _proposal: Size3D(width: CGFloat.nan, height: CGFloat.infinity, depth: CGFloat.infinity),
            size2DValue: CGSize(width: CGFloat.nan, height: 0)
        ),
        
        Input_size2D(
            initialValue: Size3D(width: CGFloat.infinity, height: -CGFloat.infinity, depth: -10),
            proposalWidth: CGFloat.infinity,
            proposalHeight: CGFloat.nan,
            proposalDepth: 0,
            new2DValue: CGSize(width: 10, height: 10),
            new2DProposalWidth: CGFloat.nan,
            new2DProposalHeight: nil
        ): Output_size2D(
            value: Size3D(width: 10, height: 10, depth: -10),
            _proposal: Size3D(width: CGFloat.nan, height: CGFloat.nan, depth: 0),
            size2DValue: CGSize(width: 10, height: 10)
        )
    ]
    
    @Test(arguments: Self.size2D_expectations)
    func test_size2D(input: Input_size2D, output: Output_size2D) {
        var impl = MySwiftUICore.ViewSize3D(
            input.initialValue,
            proposal: MySwiftUICore._ProposedSize3D(
                width: input.proposalWidth,
                height: input.proposalHeight,
                depth: input.proposalDepth
            )
        )
        
        let initial2D = impl.size2D
        #expect(initial2D.value.width.bitPattern == input.initialValue.width.bitPattern)
        #expect(initial2D.value.height.bitPattern == input.initialValue.height.bitPattern)
        
        impl.size2D = MySwiftUICore.ViewSize(
            input.new2DValue,
            proposal: MySwiftUICore._ProposedSize(
                width: input.new2DProposalWidth,
                height: input.new2DProposalHeight
            )
        )
        
        let result2D = impl.size2D
        #expect(impl.value.isEqual(to: output.value))
        #expect(impl._proposal.isEqual(to: output._proposal))
        #expect(result2D.value.isEqual(to: output.size2DValue))
        
        var original = _SwiftUICorePrivate.ViewSize3D(
            input.initialValue,
            proposal: _SwiftUICorePrivate._ProposedSize3D(
                width: input.proposalWidth,
                height: input.proposalHeight,
                depth: input.proposalDepth
            )
        )
        
        original.size2D = _SwiftUICorePrivate.ViewSize(
            input.new2DValue,
            proposal: SwiftUI._ProposedSize(
                width: input.new2DProposalWidth,
                height: input.new2DProposalHeight
            )
        )
        
        let original2D = original.size2D
        #expect(original.value.isEqual(to: output.value))
        #expect(original._proposal.isEqual(to: output._proposal))
        #expect(original2D.value.isEqual(to: output.size2DValue))
    }
}

extension ViewSize3DTests {
    struct Input_subscript_axis: Hashable {
        let initialValue: Size3D
        let initialProposal: Size3D
        let axis: SwiftUI.Axis
        let setValue: CGFloat
        let modifyDelta: CGFloat
    }
    
    struct Output_subscript_axis {
        let afterSetValue: Size3D
        let readAfterSet: CGFloat
        let afterModifyValue: Size3D
        let readAfterModify: CGFloat
    }
    
    static let subscript_axis_expectations: [Input_subscript_axis: Output_subscript_axis] = [
        Input_subscript_axis(
            initialValue: Size3D(width: 10, height: 20, depth: 30),
            initialProposal: Size3D(width: 40, height: 50, depth: 60),
            axis: .horizontal,
            setValue: 100,
            modifyDelta: 5
        ): Output_subscript_axis(
            afterSetValue: Size3D(width: 100, height: 20, depth: 30),
            readAfterSet: 100,
            afterModifyValue: Size3D(width: 105, height: 20, depth: 30),
            readAfterModify: 105
        ),
        
        Input_subscript_axis(
            initialValue: Size3D(width: 10, height: 20, depth: 30),
            initialProposal: Size3D(width: 40, height: 50, depth: 60),
            axis: .vertical,
            setValue: 200,
            modifyDelta: 10
        ): Output_subscript_axis(
            afterSetValue: Size3D(width: 10, height: 20, depth: 200),
            readAfterSet: 20,
            afterModifyValue: Size3D(width: 10, height: 20, depth: 30),
            readAfterModify: 20
        ),
        
        Input_subscript_axis(
            initialValue: Size3D(width: CGFloat.nan, height: 20, depth: 30),
            initialProposal: Size3D(width: CGFloat.nan, height: 50, depth: 60),
            axis: .vertical,
            setValue: CGFloat.infinity,
            modifyDelta: 1
        ): Output_subscript_axis(
            afterSetValue: Size3D(width: CGFloat.nan, height: 20, depth: CGFloat.infinity),
            readAfterSet: 20,
            afterModifyValue: Size3D(width: CGFloat.nan, height: 20, depth: 21),
            readAfterModify: 20
        ),
        
        Input_subscript_axis(
            initialValue: Size3D(width: 10, height: CGFloat.nan, depth: -CGFloat.infinity),
            initialProposal: Size3D(width: 40, height: CGFloat.nan, depth: -CGFloat.infinity),
            axis: .vertical,
            setValue: -CGFloat.infinity,
            modifyDelta: 10
        ): Output_subscript_axis(
            afterSetValue: Size3D(width: 10, height: CGFloat.nan, depth: -CGFloat.infinity),
            readAfterSet: CGFloat.nan,
            afterModifyValue: Size3D(width: 10, height: CGFloat.nan, depth: -CGFloat.infinity),
            readAfterModify: CGFloat.nan
        )
    ]
    
    @Test(arguments: Self.subscript_axis_expectations)
    func test_subscript_axis(input: Input_subscript_axis, output: Output_subscript_axis) {
        var impl = MySwiftUICore.ViewSize3D(
            input.initialValue,
            proposal: MySwiftUICore._ProposedSize3D(
                width: input.initialProposal.width,
                height: input.initialProposal.height,
                depth: input.initialProposal.depth
            )
        )
        
        let implAxis: MySwiftUICore.Axis =
        input.axis == .horizontal ? .horizontal : .vertical
        
        impl[implAxis] = input.setValue
        let implReadAfterSet = impl[implAxis]
        
        #expect(impl.value.isEqual(to: output.afterSetValue))
        #expect(implReadAfterSet.bitPattern == output.readAfterSet.bitPattern)
        
        impl[implAxis] += input.modifyDelta
        let implReadAfterModify = impl[implAxis]
        
        #expect(impl.value.isEqual(to: output.afterModifyValue))
        #expect(implReadAfterModify.bitPattern == output.readAfterModify.bitPattern)
        
        var original = _SwiftUICorePrivate.ViewSize3D(
            input.initialValue,
            proposal: _SwiftUICorePrivate._ProposedSize3D(
                width: input.initialProposal.width,
                height: input.initialProposal.height,
                depth: input.initialProposal.depth
            )
        )
        
        let originalAxis: SwiftUI.Axis =
        input.axis == .horizontal ? .horizontal : .vertical
        
        original[originalAxis] = input.setValue
        let originalReadAfterSet = original[originalAxis]
        
        #expect(original.value.isEqual(to: output.afterSetValue))
        #expect(originalReadAfterSet.bitPattern == output.readAfterSet.bitPattern)
        
        original[originalAxis] += input.modifyDelta
        let originalReadAfterModify = original[originalAxis]
        
        #expect(original.value.isEqual(to: output.afterModifyValue))
        #expect(originalReadAfterModify.bitPattern == output.readAfterModify.bitPattern)
    }
}

extension ViewSize3DTests {
    struct Input_subscript_axis3D: Hashable {
        let initialValue: Size3D
        let initialProposal: Size3D
        let axis: _SwiftUICorePrivate._Axis3D
        let setValue: CGFloat
        let modifyDelta: CGFloat
    }
    
    struct Output_subscript_axis3D {
        let afterSetValue: Size3D
        let readAfterSet: CGFloat
        let afterModifyValue: Size3D
        let readAfterModify: CGFloat
    }
    
    static let subscript_axis3D_expectations: [Input_subscript_axis3D: Output_subscript_axis3D] = [
        Input_subscript_axis3D(
            initialValue: Size3D(width: 10, height: 20, depth: 30),
            initialProposal: Size3D(width: 40, height: 50, depth: 60),
            axis: .horizontal,
            setValue: 100,
            modifyDelta: 5
        ): Output_subscript_axis3D(
            afterSetValue: Size3D(width: 100, height: 20, depth: 30),
            readAfterSet: 100,
            afterModifyValue: Size3D(width: 105, height: 20, depth: 30),
            readAfterModify: 105
        ),
        
        Input_subscript_axis3D(
            initialValue: Size3D(width: 10, height: 20, depth: 30),
            initialProposal: Size3D(width: 40, height: 50, depth: 60),
            axis: .vertical,
            setValue: 200,
            modifyDelta: 10
        ): Output_subscript_axis3D(
            afterSetValue: Size3D(width: 10, height: 200, depth: 30),
            readAfterSet: 200,
            afterModifyValue: Size3D(width: 10, height: 210, depth: 30),
            readAfterModify: 210
        ),
        
        Input_subscript_axis3D(
            initialValue: Size3D(width: 10, height: 20, depth: 30),
            initialProposal: Size3D(width: 40, height: 50, depth: 60),
            axis: .depth,
            setValue: 300,
            modifyDelta: 15
        ): Output_subscript_axis3D(
            afterSetValue: Size3D(width: 10, height: 20, depth: 300),
            readAfterSet: 300,
            afterModifyValue: Size3D(width: 10, height: 20, depth: 315),
            readAfterModify: 315
        ),
        
        Input_subscript_axis3D(
            initialValue: Size3D(width: CGFloat.nan, height: 20, depth: -CGFloat.infinity),
            initialProposal: Size3D(width: CGFloat.nan, height: 50, depth: -CGFloat.infinity),
            axis: .depth,
            setValue: CGFloat.infinity,
            modifyDelta: 1
        ): Output_subscript_axis3D(
            afterSetValue: Size3D(width: CGFloat.nan, height: 20, depth: CGFloat.infinity),
            readAfterSet: CGFloat.infinity,
            afterModifyValue: Size3D(width: CGFloat.nan, height: 20, depth: CGFloat.infinity),
            readAfterModify: CGFloat.infinity
        )
    ]
    
    @Test(arguments: Self.subscript_axis3D_expectations)
    func test_subscript_axis3D(input: Input_subscript_axis3D, output: Output_subscript_axis3D) {
        var impl = MySwiftUICore.ViewSize3D(
            input.initialValue,
            proposal: MySwiftUICore._ProposedSize3D(
                width: input.initialProposal.width,
                height: input.initialProposal.height,
                depth: input.initialProposal.depth
            )
        )
        
        let implAxis: MySwiftUICore._Axis3D = {
            switch input.axis {
            case .horizontal:
                return .horizontal
            case .vertical:
                return .vertical
            case .depth:
                return .depth
            default:
                fatalError()
            }
        }()
        
        impl[implAxis] = input.setValue
        let implReadAfterSet = impl[implAxis]
        
        #expect(impl.value.isEqual(to: output.afterSetValue))
        #expect(implReadAfterSet.bitPattern == output.readAfterSet.bitPattern)
        
        impl[implAxis] += input.modifyDelta
        let implReadAfterModify = impl[implAxis]
        
        #expect(impl.value.isEqual(to: output.afterModifyValue))
        #expect(implReadAfterModify.bitPattern == output.readAfterModify.bitPattern)
        
        var original = _SwiftUICorePrivate.ViewSize3D(
            input.initialValue,
            proposal: _SwiftUICorePrivate._ProposedSize3D(
                width: input.initialProposal.width,
                height: input.initialProposal.height,
                depth: input.initialProposal.depth
            )
        )
        
        let originalAxis: _SwiftUICorePrivate._Axis3D = input.axis
        
        original[originalAxis] = input.setValue
        let originalReadAfterSet = original[originalAxis]
        
        #expect(original.value.isEqual(to: output.afterSetValue))
        #expect(originalReadAfterSet.bitPattern == output.readAfterSet.bitPattern)
        
        original[originalAxis] += input.modifyDelta
        let originalReadAfterModify = original[originalAxis]
        
        #expect(original.value.isEqual(to: output.afterModifyValue))
        #expect(originalReadAfterModify.bitPattern == output.readAfterModify.bitPattern)
    }
}

extension ViewSize3DTests {
    struct Input_init_depth_proposedDepth: Hashable {
        let viewSizeWidth: CGFloat
        let viewSizeHeight: CGFloat
        let proposalWidth: CGFloat?
        let proposalHeight: CGFloat?
        let depth: CGFloat
        let proposedDepth: CGFloat?
    }
    
    struct Output_init_depth_proposedDepth {
        let value: Size3D
        let _proposal: Size3D
    }
    
    static let init_depth_proposedDepth_expectations: [Input_init_depth_proposedDepth: Output_init_depth_proposedDepth] = [
        Input_init_depth_proposedDepth(
            viewSizeWidth: 10,
            viewSizeHeight: 20,
            proposalWidth: 30,
            proposalHeight: 40,
            depth: 50,
            proposedDepth: 60
        ): Output_init_depth_proposedDepth(
            value: Size3D(width: 10, height: 20, depth: 50),
            _proposal: Size3D(width: 30, height: 40, depth: 60)
        ),
        
        Input_init_depth_proposedDepth(
            viewSizeWidth: 10,
            viewSizeHeight: 20,
            proposalWidth: nil,
            proposalHeight: nil,
            depth: 50,
            proposedDepth: nil
        ): Output_init_depth_proposedDepth(
            value: Size3D(width: 10, height: 20, depth: 50),
            _proposal: Size3D(width: CGFloat.nan, height: CGFloat.nan, depth: CGFloat.nan)
        ),
        
        Input_init_depth_proposedDepth(
            viewSizeWidth: CGFloat.nan,
            viewSizeHeight: 20,
            proposalWidth: 30,
            proposalHeight: CGFloat.nan,
            depth: CGFloat.infinity,
            proposedDepth: nil
        ): Output_init_depth_proposedDepth(
            value: Size3D(width: CGFloat.nan, height: 20, depth: CGFloat.infinity),
            _proposal: Size3D(width: 30, height: CGFloat.nan, depth: CGFloat.nan)
        ),
        
        Input_init_depth_proposedDepth(
            viewSizeWidth: 10,
            viewSizeHeight: CGFloat.infinity,
            proposalWidth: 30,
            proposalHeight: 40,
            depth: -CGFloat.infinity,
            proposedDepth: CGFloat.infinity
        ): Output_init_depth_proposedDepth(
            value: Size3D(width: 10, height: CGFloat.infinity, depth: -CGFloat.infinity),
            _proposal: Size3D(width: 30, height: 40, depth: CGFloat.infinity)
        )
    ]
    
    @Test(arguments: Self.init_depth_proposedDepth_expectations)
    func test_init_depth_proposedDepth(
        input: Input_init_depth_proposedDepth,
        output: Output_init_depth_proposedDepth
    ) {
        let viewSizeImpl = MySwiftUICore.ViewSize(
            CGSize(width: input.viewSizeWidth, height: input.viewSizeHeight),
            proposal: MySwiftUICore._ProposedSize(
                width: input.proposalWidth,
                height: input.proposalHeight
            )
        )
        
        let impl = MySwiftUICore.ViewSize3D(
            viewSizeImpl,
            depth: input.depth,
            proposedDepth: input.proposedDepth
        )
        
        #expect(impl.value.isEqual(to: output.value))
        #expect(impl._proposal.isEqual(to: output._proposal))
        
        let viewSizeOriginal = _SwiftUICorePrivate.ViewSize(
            CGSize(width: input.viewSizeWidth, height: input.viewSizeHeight),
            proposal: SwiftUI._ProposedSize(
                width: input.proposalWidth,
                height: input.proposalHeight
            )
        )
        
        let original = _SwiftUICorePrivate.ViewSize3D(
            viewSizeOriginal,
            depth: input.depth,
            proposedDepth: input.proposedDepth
        )
        
        #expect(original.value.isEqual(to: output.value))
        #expect(original._proposal.isEqual(to: output._proposal))
    }
}

extension ViewSize3DTests {
    struct Input_init_usingDepthFrom: Hashable {
        let viewSizeWidth: CGFloat
        let viewSizeHeight: CGFloat
        let proposalWidth: CGFloat?
        let proposalHeight: CGFloat?
        
        let sourceDepthValue: CGFloat
        let sourceDepthProposal: CGFloat?
    }
    
    struct Output_init_usingDepthFrom {
        let value: Size3D
        let _proposal: Size3D
    }
    
    static let init_usingDepthFrom_expectations: [Input_init_usingDepthFrom: Output_init_usingDepthFrom] = [
        Input_init_usingDepthFrom(
            viewSizeWidth: 10,
            viewSizeHeight: 20,
            proposalWidth: 30,
            proposalHeight: 40,
            sourceDepthValue: 50,
            sourceDepthProposal: 60
        ): Output_init_usingDepthFrom(
            value: Size3D(width: 10, height: 20, depth: 50),
            _proposal: Size3D(width: 30, height: 40, depth: 60)
        ),
        
        Input_init_usingDepthFrom(
            viewSizeWidth: 10,
            viewSizeHeight: 20,
            proposalWidth: nil,
            proposalHeight: nil,
            sourceDepthValue: 50,
            sourceDepthProposal: nil
        ): Output_init_usingDepthFrom(
            value: Size3D(width: 10, height: 20, depth: 50),
            _proposal: Size3D(width: .nan, height: .nan, depth: .nan)
        ),
        
        Input_init_usingDepthFrom(
            viewSizeWidth: .nan,
            viewSizeHeight: 20,
            proposalWidth: 30,
            proposalHeight: .nan,
            sourceDepthValue: .infinity,
            sourceDepthProposal: nil
        ): Output_init_usingDepthFrom(
            value: Size3D(width: .nan, height: 20, depth: .infinity),
            _proposal: Size3D(width: 30, height: .nan, depth: .nan)
        ),
        
        Input_init_usingDepthFrom(
            viewSizeWidth: 10,
            viewSizeHeight: .infinity,
            proposalWidth: 30,
            proposalHeight: 40,
            sourceDepthValue: -.infinity,
            sourceDepthProposal: .infinity
        ): Output_init_usingDepthFrom(
            value: Size3D(width: 10, height: .infinity, depth: -.infinity),
            _proposal: Size3D(width: 30, height: 40, depth: .infinity)
        )
    ]
    
    @Test(arguments: Self.init_usingDepthFrom_expectations)
    func test_init_usingDepthFrom(
        input: Input_init_usingDepthFrom,
        output: Output_init_usingDepthFrom
    ) {
        let viewSizeImpl = MySwiftUICore.ViewSize(
            CGSize(width: input.viewSizeWidth, height: input.viewSizeHeight),
            proposal: MySwiftUICore._ProposedSize(
                width: input.proposalWidth,
                height: input.proposalHeight
            )
        )
        
        let source3DImpl = MySwiftUICore.ViewSize3D(
            Size3D(width: 0, height: 0, depth: input.sourceDepthValue),
            proposal: MySwiftUICore._ProposedSize3D(
                width: nil,
                height: nil,
                depth: input.sourceDepthProposal
            )
        )
        
        let impl = MySwiftUICore.ViewSize3D(
            viewSizeImpl,
            usingDepthFrom: source3DImpl
        )
        
        #expect(impl.value.isEqual(to: output.value))
        #expect(impl._proposal.isEqual(to: output._proposal))
        
        let viewSizeOriginal = _SwiftUICorePrivate.ViewSize(
            CGSize(width: input.viewSizeWidth, height: input.viewSizeHeight),
            proposal: SwiftUI._ProposedSize(
                width: input.proposalWidth,
                height: input.proposalHeight
            )
        )
        
        let source3DOriginal = _SwiftUICorePrivate.ViewSize3D(
            Size3D(width: 0, height: 0, depth: input.sourceDepthValue),
            proposal: _SwiftUICorePrivate._ProposedSize3D(
                width: nil,
                height: nil,
                depth: input.sourceDepthProposal
            )
        )
        
        let original = _SwiftUICorePrivate.ViewSize3D(
            viewSizeOriginal,
            usingDepthFrom: source3DOriginal
        )
        
        #expect(original.value.isEqual(to: output.value))
        #expect(original._proposal.isEqual(to: output._proposal))
    }
}

extension ViewSize3DTests {
    struct Input_init_depth_ViewDepth: Hashable {
        let viewSizeWidth: CGFloat
        let viewSizeHeight: CGFloat
        let proposalWidth: CGFloat?
        let proposalHeight: CGFloat?
        
        let depthValue: CGFloat
        let depthProposal: CGFloat?
    }
    
    struct Output_init_depth_ViewDepth {
        let value: Size3D
        let _proposal: Size3D
    }
    
    static let init_depth_ViewDepth_expectations: [Input_init_depth_ViewDepth: Output_init_depth_ViewDepth] = [
        Input_init_depth_ViewDepth(
            viewSizeWidth: 10,
            viewSizeHeight: 20,
            proposalWidth: 30,
            proposalHeight: 40,
            depthValue: 50,
            depthProposal: 60
        ): Output_init_depth_ViewDepth(
            value: Size3D(width: 10, height: 20, depth: 50),
            _proposal: Size3D(width: 30, height: 40, depth: 60)
        ),
        
        Input_init_depth_ViewDepth(
            viewSizeWidth: 10,
            viewSizeHeight: 20,
            proposalWidth: nil,
            proposalHeight: nil,
            depthValue: 50,
            depthProposal: nil
        ): Output_init_depth_ViewDepth(
            value: Size3D(width: 10, height: 20, depth: 50),
            _proposal: Size3D(width: .nan, height: .nan, depth: .nan)
        ),
        
        Input_init_depth_ViewDepth(
            viewSizeWidth: .nan,
            viewSizeHeight: 20,
            proposalWidth: 30,
            proposalHeight: .nan,
            depthValue: .infinity,
            depthProposal: nil
        ): Output_init_depth_ViewDepth(
            value: Size3D(width: .nan, height: 20, depth: .infinity),
            _proposal: Size3D(width: 30, height: .nan, depth: .nan)
        ),
        
        Input_init_depth_ViewDepth(
            viewSizeWidth: 10,
            viewSizeHeight: .infinity,
            proposalWidth: 30,
            proposalHeight: 40,
            depthValue: -.infinity,
            depthProposal: .infinity
        ): Output_init_depth_ViewDepth(
            value: Size3D(width: 10, height: .infinity, depth: -.infinity),
            _proposal: Size3D(width: 30, height: 40, depth: .infinity)
        ),
        
        Input_init_depth_ViewDepth(
            viewSizeWidth: 10,
            viewSizeHeight: 20,
            proposalWidth: 30,
            proposalHeight: 40,
            depthValue: .nan,
            depthProposal: .nan
        ): Output_init_depth_ViewDepth(
            value: Size3D(width: 10, height: 20, depth: .nan),
            _proposal: Size3D(width: 30, height: 40, depth: .nan)
        )
    ]
    
    @Test(arguments: Self.init_depth_ViewDepth_expectations)
    func test_init_depth_ViewDepth(
        input: Input_init_depth_ViewDepth,
        output: Output_init_depth_ViewDepth
    ) {
        let viewSizeImpl = MySwiftUICore.ViewSize(
            CGSize(width: input.viewSizeWidth, height: input.viewSizeHeight),
            proposal: MySwiftUICore._ProposedSize(
                width: input.proposalWidth,
                height: input.proposalHeight
            )
        )
        
        let depthImpl = MySwiftUICore.ViewDepth(
            input.depthValue,
            proposal: input.depthProposal
        )
        
        let impl = MySwiftUICore.ViewSize3D(
            viewSizeImpl,
            depth: depthImpl
        )
        
        #expect(impl.value.isEqual(to: output.value))
        #expect(impl._proposal.isEqual(to: output._proposal))
        
        let viewSizeOriginal = _SwiftUICorePrivate.ViewSize(
            CGSize(width: input.viewSizeWidth, height: input.viewSizeHeight),
            proposal: SwiftUI._ProposedSize(
                width: input.proposalWidth,
                height: input.proposalHeight
            )
        )
        
        let depthOriginal = _SwiftUICorePrivate.ViewDepth(
            input.depthValue,
            proposal: input.depthProposal
        )
        
        let original = _SwiftUICorePrivate.ViewSize3D(
            viewSizeOriginal,
            depth: depthOriginal
        )
        
        #expect(original.value.isEqual(to: output.value))
        #expect(original._proposal.isEqual(to: output._proposal))
    }
}

extension ViewSize3DTests {
    struct Input_equatable: Hashable {
        let lhsViewSizeValue: CGSize
        let lhsProposalWidth: CGFloat?
        let lhsProposalHeight: CGFloat?
        let lhsDepth: CGFloat
        let lhsProposedDepth: CGFloat?
        
        let rhsViewSizeValue: CGSize
        let rhsProposalWidth: CGFloat?
        let rhsProposalHeight: CGFloat?
        let rhsDepth: CGFloat
        let rhsProposedDepth: CGFloat?
        
        let expected: Bool
    }
    
    static let equatable_expectations: [Input_equatable] = [
        Input_equatable(
            lhsViewSizeValue: CGSize(width: 10, height: 20),
            lhsProposalWidth: 40,
            lhsProposalHeight: 50,
            lhsDepth: 30,
            lhsProposedDepth: 60,
            rhsViewSizeValue: CGSize(width: 10, height: 20),
            rhsProposalWidth: 40,
            rhsProposalHeight: 50,
            rhsDepth: 30,
            rhsProposedDepth: 60,
            expected: true
        ),
        
        Input_equatable(
            lhsViewSizeValue: CGSize(width: 10, height: 20),
            lhsProposalWidth: nil,
            lhsProposalHeight: nil,
            lhsDepth: 30,
            lhsProposedDepth: nil,
            rhsViewSizeValue: CGSize(width: 10, height: 20),
            rhsProposalWidth: nil,
            rhsProposalHeight: nil,
            rhsDepth: 30,
            rhsProposedDepth: nil,
            expected: true
        ),
        
        Input_equatable(
            lhsViewSizeValue: CGSize(width: 10, height: 20),
            lhsProposalWidth: 40,
            lhsProposalHeight: 50,
            lhsDepth: 30,
            lhsProposedDepth: 60,
            rhsViewSizeValue: CGSize(width: 10, height: 20),
            rhsProposalWidth: 40,
            rhsProposalHeight: 50,
            rhsDepth: 30,
            rhsProposedDepth: nil,
            expected: false
        ),
        
        Input_equatable(
            lhsViewSizeValue: CGSize(width: CGFloat.nan, height: 20),
            lhsProposalWidth: 40,
            lhsProposalHeight: 50,
            lhsDepth: CGFloat.infinity,
            lhsProposedDepth: CGFloat.infinity,
            rhsViewSizeValue: CGSize(width: CGFloat.nan, height: 20),
            rhsProposalWidth: 40,
            rhsProposalHeight: 50,
            rhsDepth: CGFloat.infinity,
            rhsProposedDepth: CGFloat.infinity,
            expected: false
        ),
        
        Input_equatable(
            lhsViewSizeValue: CGSize(width: 10, height: 20),
            lhsProposalWidth: 40,
            lhsProposalHeight: 50,
            lhsDepth: -CGFloat.infinity,
            lhsProposedDepth: -CGFloat.infinity,
            rhsViewSizeValue: CGSize(width: 10, height: 20),
            rhsProposalWidth: 40,
            rhsProposalHeight: 50,
            rhsDepth: CGFloat.infinity,
            rhsProposedDepth: -CGFloat.infinity,
            expected: false
        )
    ]
    
    @Test(arguments: Self.equatable_expectations)
    func test_equatable(input: Input_equatable) {
        let lhsViewSize = MySwiftUICore.ViewSize(
            input.lhsViewSizeValue,
            proposal: MySwiftUICore._ProposedSize(
                width: input.lhsProposalWidth,
                height: input.lhsProposalHeight
            )
        )
        
        let rhsViewSize = MySwiftUICore.ViewSize(
            input.rhsViewSizeValue,
            proposal: MySwiftUICore._ProposedSize(
                width: input.rhsProposalWidth,
                height: input.rhsProposalHeight
            )
        )
        
        let lhs = MySwiftUICore.ViewSize3D(
            lhsViewSize,
            depth: input.lhsDepth,
            proposedDepth: input.lhsProposedDepth
        )
        
        let rhs = MySwiftUICore.ViewSize3D(
            rhsViewSize,
            depth: input.rhsDepth,
            proposedDepth: input.rhsProposedDepth
        )
        
        #expect((lhs == rhs) == input.expected)
        
        let originalLhsViewSize = _SwiftUICorePrivate.ViewSize(
            input.lhsViewSizeValue,
            proposal: SwiftUI._ProposedSize(
                width: input.lhsProposalWidth,
                height: input.lhsProposalHeight
            )
        )
        
        let originalRhsViewSize = _SwiftUICorePrivate.ViewSize(
            input.rhsViewSizeValue,
            proposal: SwiftUI._ProposedSize(
                width: input.rhsProposalWidth,
                height: input.rhsProposalHeight
            )
        )
        
        let originalLhs = _SwiftUICorePrivate.ViewSize3D(
            originalLhsViewSize,
            depth: input.lhsDepth,
            proposedDepth: input.lhsProposedDepth
        )
        
        let originalRhs = _SwiftUICorePrivate.ViewSize3D(
            originalRhsViewSize,
            depth: input.rhsDepth,
            proposedDepth: input.rhsProposedDepth
        )
        
        #expect((originalLhs == originalRhs) == input.expected)
    }
}




extension _SwiftUICorePrivate.ViewSize3D {
    fileprivate var _proposal: Size3D {
        return Mirror(reflecting: self).descendant("_proposal") as! Size3D
    }
}
