private import _SwiftUICorePrivate
@testable @_private(sourceFile: "ViewSize.swift") private import MySwiftUICore
@testable @_private(sourceFile: "ViewSize3D.swift") private import MySwiftUICore
internal import Testing
private import SwiftUI
private import Spatial
private import MySwiftUITestUtils

fileprivate struct ViewSizeTests {
}

extension ViewSizeTests {
    @Test func test_zero() {
        let impl = MySwiftUICore.ViewSize.zero
        let original = _SwiftUICorePrivate.ViewSize.zero
        
        #expect(impl.value == .zero)
        #expect(impl._proposal == .zero)
        
        #expect(original.value == .zero)
        #expect(original._proposal == .zero)
    }
}

extension ViewSizeTests {
    @Test func test_invalidValue() {
        let impl = MySwiftUICore.ViewSize.invalidValue
        let original = _SwiftUICorePrivate.ViewSize.invalidValue
        
        #expect(impl.value == CGSize(width: -CGFloat.infinity, height: -CGFloat.infinity))
        #expect(impl._proposal == CGSize(width: -CGFloat.infinity, height: -CGFloat.infinity))
        
        #expect(original.value == CGSize(width: -CGFloat.infinity, height: -CGFloat.infinity))
        #expect(original._proposal == CGSize(width: -CGFloat.infinity, height: -CGFloat.infinity))
    }
}

extension ViewSizeTests {
    struct Input_init_proposal: Hashable {
        let value: CGSize
        let proposalWidth: CGFloat?
        let proposalHeight: CGFloat?
    }
    
    struct Output_init_proposal {
        let value: CGSize
        let _proposal: CGSize
    }
    
    static let init_proposal_expectations: [Input_init_proposal: Output_init_proposal] = [
        Input_init_proposal(
            value: CGSize(width: 10, height: 20),
            proposalWidth: 40,
            proposalHeight: 50
        ): Output_init_proposal(
            value: CGSize(width: 10, height: 20),
            _proposal: CGSize(width: 40, height: 50)
        ),
        
        Input_init_proposal(
            value: CGSize(width: CGFloat.nan, height: CGFloat.nan),
            proposalWidth: 40,
            proposalHeight: 50
        ): Output_init_proposal(
            value: CGSize(width: CGFloat.nan, height: CGFloat.nan),
            _proposal: CGSize(width: 40, height: 50)
        ),
        
        Input_init_proposal(
            value: CGSize(width: 10, height: 20),
            proposalWidth: 40,
            proposalHeight: nil
        ): Output_init_proposal(
            value: CGSize(width: 10, height: 20),
            _proposal: CGSize(width: 40, height: CGFloat.nan)
        ),
        
        Input_init_proposal(
            value: CGSize(width: 10, height: 20),
            proposalWidth: nil,
            proposalHeight: nil
        ): Output_init_proposal(
            value: CGSize(width: 10, height: 20),
            _proposal: CGSize(width: CGFloat.nan, height: CGFloat.nan)
        ),
        
        Input_init_proposal(
            value: CGSize(width: 10, height: 20),
            proposalWidth: CGFloat.infinity,
            proposalHeight: CGFloat.infinity
        ): Output_init_proposal(
            value: CGSize(width: 10, height: 20),
            _proposal: CGSize(width: CGFloat.infinity, height: CGFloat.infinity)
        ),
        
        Input_init_proposal(
            value: CGSize(width: 10, height: 20),
            proposalWidth: CGFloat.infinity,
            proposalHeight: nil
        ): Output_init_proposal(
            value: CGSize(width: 10, height: 20),
            _proposal: CGSize(width: CGFloat.infinity, height: CGFloat.nan)
        ),
        
        Input_init_proposal(
            value: CGSize(width: 10, height: 20),
            proposalWidth: -CGFloat.infinity,
            proposalHeight: 50
        ): Output_init_proposal(
            value: CGSize(width: 10, height: 20),
            _proposal: CGSize(width: -CGFloat.infinity, height: 50)
        ),
        
        Input_init_proposal(
            value: CGSize(width: 10, height: 20),
            proposalWidth: CGFloat.nan,
            proposalHeight: 50
        ): Output_init_proposal(
            value: CGSize(width: 10, height: 20),
            _proposal: CGSize(width: CGFloat.nan, height: 50)
        ),
        
        Input_init_proposal(
            value: CGSize(width: 10, height: 20),
            proposalWidth: CGFloat.nan,
            proposalHeight: CGFloat.nan
        ): Output_init_proposal(
            value: CGSize(width: 10, height: 20),
            _proposal: CGSize(width: CGFloat.nan, height: CGFloat.nan)
        ),
        
        Input_init_proposal(
            value: CGSize(width: CGFloat.infinity, height: -CGFloat.infinity),
            proposalWidth: 100,
            proposalHeight: 200
        ): Output_init_proposal(
            value: CGSize(width: CGFloat.infinity, height: -CGFloat.infinity),
            _proposal: CGSize(width: 100, height: 200)
        )
    ]
    
    
    @Test(arguments: Self.init_proposal_expectations) func test_init_proposal(input: Input_init_proposal, output: Output_init_proposal) {
        let impl = MySwiftUICore.ViewSize(
            input.value,
            proposal: MySwiftUICore._ProposedSize(width: input.proposalWidth, height: input.proposalHeight)
        )
        
        #expect(impl.value.isEqual(to: output.value))
        #expect(impl._proposal.isEqual(to: output._proposal))
        
        let original = _SwiftUICorePrivate.ViewSize(
            input.value,
            proposal: SwiftUI._ProposedSize(width: input.proposalWidth, height: input.proposalHeight)
        )
        
        #expect(original.value.isEqual(to: output.value))
        #expect(original._proposal.isEqual(to: output._proposal))
    }
}

extension ViewSizeTests {
    struct Input_init_size3D: Hashable {
        let value: Size3D
        let proposalWidth: CGFloat?
        let proposalHeight: CGFloat?
        let proposalDepth: CGFloat?
    }
    
    struct Output_init_size3D {
        let value: CGSize
        let _proposal: CGSize
    }
    
    static let init_size3D_expectations: [Input_init_size3D: Output_init_size3D] = [
        Input_init_size3D(
            value: Size3D(width: 10, height: 20, depth: 30),
            proposalWidth: 40,
            proposalHeight: 50,
            proposalDepth: 60
        ): Output_init_size3D(
            value: CGSize(width: 10, height: 20),
            _proposal: CGSize(width: 40, height: 50)
        ),
        
        Input_init_size3D(
            value: Size3D(width: CGFloat.nan, height: CGFloat.nan, depth: CGFloat.nan),
            proposalWidth: 40,
            proposalHeight: 50,
            proposalDepth: 60
        ): Output_init_size3D(
            value: CGSize(width: CGFloat.nan, height: CGFloat.nan),
            _proposal: CGSize(width: 40, height: 50)
        ),
        
        Input_init_size3D(
            value: Size3D(width: 10, height: 20, depth: 30),
            proposalWidth: 40,
            proposalHeight: nil,
            proposalDepth: 60
        ): Output_init_size3D(
            value: CGSize(width: 10, height: 20),
            _proposal: CGSize(width: 40, height: CGFloat.nan)
        ),
        
        Input_init_size3D(
            value: Size3D(width: 10, height: 20, depth: 30),
            proposalWidth: nil,
            proposalHeight: nil,
            proposalDepth: nil
        ): Output_init_size3D(
            value: CGSize(width: 10, height: 20),
            _proposal: CGSize(width: CGFloat.nan, height: CGFloat.nan)
        ),
        
        Input_init_size3D(
            value: Size3D(width: 10, height: 20, depth: 30),
            proposalWidth: CGFloat.infinity,
            proposalHeight: CGFloat.infinity,
            proposalDepth: CGFloat.infinity
        ): Output_init_size3D(
            value: CGSize(width: 10, height: 20),
            _proposal: CGSize(width: CGFloat.infinity, height: CGFloat.infinity)
        ),
        
        Input_init_size3D(
            value: Size3D(width: 10, height: 20, depth: 30),
            proposalWidth: CGFloat.infinity,
            proposalHeight: nil,
            proposalDepth: CGFloat.infinity
        ): Output_init_size3D(
            value: CGSize(width: 10, height: 20),
            _proposal: CGSize(width: CGFloat.infinity, height: CGFloat.nan)
        ),
        
        Input_init_size3D(
            value: Size3D(width: 10, height: 20, depth: 30),
            proposalWidth: -CGFloat.infinity,
            proposalHeight: 50,
            proposalDepth: -CGFloat.infinity
        ): Output_init_size3D(
            value: CGSize(width: 10, height: 20),
            _proposal: CGSize(width: -CGFloat.infinity, height: 50)
        ),
        
        Input_init_size3D(
            value: Size3D(width: 10, height: 20, depth: 30),
            proposalWidth: CGFloat.nan,
            proposalHeight: 50,
            proposalDepth: CGFloat.nan
        ): Output_init_size3D(
            value: CGSize(width: 10, height: 20),
            _proposal: CGSize(width: CGFloat.nan, height: 50)
        ),
        
        Input_init_size3D(
            value: Size3D(width: CGFloat.infinity, height: -CGFloat.infinity, depth: 0),
            proposalWidth: 100,
            proposalHeight: 200,
            proposalDepth: 300
        ): Output_init_size3D(
            value: CGSize(width: CGFloat.infinity, height: -CGFloat.infinity),
            _proposal: CGSize(width: 100, height: 200)
        )
    ]
    
    @Test(arguments: Self.init_size3D_expectations) func test_init_size3D(input: Input_init_size3D, output: Output_init_size3D) {
        let impl = MySwiftUICore.ViewSize(
            MySwiftUICore.ViewSize3D(
                input.value,
                proposal: MySwiftUICore._ProposedSize3D(width: input.proposalWidth, height: input.proposalHeight, depth: input.proposalDepth)
            )
        )
        
        #expect(impl.value.isEqual(to: output.value))
        #expect(impl._proposal.isEqual(to: output._proposal))
        
        let original = _SwiftUICorePrivate.ViewSize(
            _SwiftUICorePrivate.ViewSize3D(
                input.value,
                proposal: _SwiftUICorePrivate._ProposedSize3D(width: input.proposalWidth, height: input.proposalHeight, depth: input.proposalDepth)
            )
        )
        
        #expect(original.value.isEqual(to: output.value))
        #expect(original._proposal.isEqual(to: output._proposal))
    }
}

extension ViewSizeTests {
    struct Input_proposal {
        let value: CGSize
        let proposalWidth: CGFloat?
        let proposalHeight: CGFloat?
        
        let newProposalWidth: CGFloat?
        let newProposalHeight: CGFloat?
    }
    
    static let proposal_expectations: [Input_proposal] = [
        Input_proposal(
            value: CGSize(width: 10, height: 20),
            proposalWidth: 40,
            proposalHeight: 50,
            newProposalWidth: 60,
            newProposalHeight: 70
        ),
        
        Input_proposal(
            value: CGSize(width: 10, height: 20),
            proposalWidth: nil,
            proposalHeight: nil,
            newProposalWidth: 60,
            newProposalHeight: 70
        ),
        
        Input_proposal(
            value: CGSize(width: 10, height: 20),
            proposalWidth: 40,
            proposalHeight: nil,
            newProposalWidth: nil,
            newProposalHeight: nil
        ),
        
        Input_proposal(
            value: CGSize(width: CGFloat.nan, height: CGFloat.nan),
            proposalWidth: 40,
            proposalHeight: 50,
            newProposalWidth: nil,
            newProposalHeight: nil
        ),
        
        Input_proposal(
            value: CGSize(width: 10, height: 20),
            proposalWidth: CGFloat.infinity,
            proposalHeight: CGFloat.infinity,
            newProposalWidth: 100,
            newProposalHeight: 200
        ),
        
        Input_proposal(
            value: CGSize(width: 10, height: 20),
            proposalWidth: 40,
            proposalHeight: 50,
            newProposalWidth: CGFloat.infinity,
            newProposalHeight: CGFloat.infinity
        ),
        
        Input_proposal(
            value: CGSize(width: 10, height: 20),
            proposalWidth: nil,
            proposalHeight: nil,
            newProposalWidth: nil,
            newProposalHeight: nil
        ),
        
        Input_proposal(
            value: CGSize(width: 10, height: 20),
            proposalWidth: CGFloat.nan,
            proposalHeight: 50,
            newProposalWidth: nil,
            newProposalHeight: nil
        ),
        
        Input_proposal(
            value: CGSize(width: 10, height: 20),
            proposalWidth: CGFloat.nan,
            proposalHeight: 50,
            newProposalWidth: nil,
            newProposalHeight: nil
        ),
        
        Input_proposal(
            value: CGSize(width: CGFloat.infinity, height: -CGFloat.infinity),
            proposalWidth: 100,
            proposalHeight: 200,
            newProposalWidth: -CGFloat.infinity,
            newProposalHeight: CGFloat.infinity
        )
    ]
    
    @Test(arguments: Self.proposal_expectations) func test_proposal(input: Input_proposal) {
        var impl = MySwiftUICore.ViewSize(
            input.value,
            proposal: MySwiftUICore._ProposedSize(width: input.proposalWidth, height: input.proposalHeight)
        )
        
        let impl_newProposal = MySwiftUICore._ProposedSize(width: input.newProposalWidth, height: input.newProposalHeight)
        impl.proposal = impl_newProposal
        #expect(impl.proposal == impl_newProposal)
        
        var original = _SwiftUICorePrivate.ViewSize(
            input.value,
            proposal: SwiftUI._ProposedSize(width: input.proposalWidth, height: input.proposalHeight)
        )
        
        let original_newProposal = SwiftUI._ProposedSize(width: input.newProposalWidth, height: input.newProposalHeight)
        original.proposal = original_newProposal
        #expect(original.proposal == original_newProposal)
    }
}

extension ViewSizeTests {
    struct Input_width {
        let initialValue: CGSize
        let proposalWidth: CGFloat?
        let proposalHeight: CGFloat?
        let newWidth: CGFloat
    }
    
    static let widthExpectations: [Input_width] = [
        Input_width(
            initialValue: CGSize(width: 10, height: 20),
            proposalWidth: 40,
            proposalHeight: 50,
            newWidth: 100
        ),
        Input_width(
            initialValue: CGSize(width: 10, height: 20),
            proposalWidth: nil,
            proposalHeight: nil,
            newWidth: CGFloat.infinity
        ),
        Input_width(
            initialValue: CGSize(width: 10, height: 20),
            proposalWidth: 40,
            proposalHeight: nil,
            newWidth: -CGFloat.infinity
        ),
        Input_width(
            initialValue: CGSize(width: CGFloat.nan, height: 20),
            proposalWidth: 40,
            proposalHeight: 50,
            newWidth: CGFloat.nan
        )
    ]
    
    @Test(arguments: Self.widthExpectations)
    func test_width(input: Input_width) {
        var impl = MySwiftUICore.ViewSize(
            input.initialValue,
            proposal: MySwiftUICore._ProposedSize(
                width: input.proposalWidth,
                height: input.proposalHeight
            )
        )
        
        let originalProposal = impl.proposal
        impl.width = input.newWidth
        
        #expect(impl.value.width.bitPattern == input.newWidth.bitPattern)
        #expect(impl.value.height.bitPattern == input.initialValue.height.bitPattern)
        #expect(impl.proposal == originalProposal)
        
        var original = _SwiftUICorePrivate.ViewSize(
            input.initialValue,
            proposal: SwiftUI._ProposedSize(
                width: input.proposalWidth,
                height: input.proposalHeight
            )
        )
        
        let originalOriginalProposal = original.proposal
        original.width = input.newWidth
        
        #expect(original.value.width.bitPattern == input.newWidth.bitPattern)
        #expect(original.value.height.bitPattern == input.initialValue.height.bitPattern)
        #expect(original.proposal == originalOriginalProposal)
    }
}

extension ViewSizeTests {
    struct Input_height {
        let initialValue: CGSize
        let proposalWidth: CGFloat?
        let proposalHeight: CGFloat?
        let newHeight: CGFloat
    }
    
    static let heightExpectations: [Input_height] = [
        Input_height(
            initialValue: CGSize(width: 10, height: 20),
            proposalWidth: 40,
            proposalHeight: 50,
            newHeight: 200
        ),
        Input_height(
            initialValue: CGSize(width: 10, height: 20),
            proposalWidth: nil,
            proposalHeight: nil,
            newHeight: CGFloat.infinity
        ),
        Input_height(
            initialValue: CGSize(width: 10, height: 20),
            proposalWidth: 40,
            proposalHeight: nil,
            newHeight: -CGFloat.infinity
        ),
        Input_height(
            initialValue: CGSize(width: 10, height: CGFloat.nan),
            proposalWidth: 40,
            proposalHeight: 50,
            newHeight: CGFloat.nan
        )
    ]
    
    @Test(arguments: Self.heightExpectations)
    func test_height(input: Input_height) {
        var impl = MySwiftUICore.ViewSize(
            input.initialValue,
            proposal: MySwiftUICore._ProposedSize(
                width: input.proposalWidth,
                height: input.proposalHeight
            )
        )
        
        let originalProposal = impl.proposal
        impl.height = input.newHeight
        
        #expect(impl.value.height.bitPattern == input.newHeight.bitPattern)
        #expect(impl.value.width.bitPattern == input.initialValue.width.bitPattern)
        #expect(impl.proposal == originalProposal)
        
        var original = _SwiftUICorePrivate.ViewSize(
            input.initialValue,
            proposal: SwiftUI._ProposedSize(
                width: input.proposalWidth,
                height: input.proposalHeight
            )
        )
        
        let originalOriginalProposal = original.proposal
        original.height = input.newHeight
        
        #expect(original.value.height.bitPattern == input.newHeight.bitPattern)
        #expect(original.value.width.bitPattern == input.initialValue.width.bitPattern)
        #expect(original.proposal == originalOriginalProposal)
    }
}

extension ViewSizeTests {
    struct Input_subscript: Hashable {
        let initialValue: CGSize
        let proposalWidth: CGFloat?
        let proposalHeight: CGFloat?
        let axis: SwiftUI.Axis
        let newValue: CGFloat
    }
    
    struct Output_subscript {
        let value: CGSize
        let _proposal: CGSize
    }
    
    static let subscript_expectations: [Input_subscript: Output_subscript] = [
        Input_subscript(
            initialValue: CGSize(width: 10, height: 20),
            proposalWidth: 40,
            proposalHeight: 50,
            axis: .horizontal,
            newValue: 100
        ): Output_subscript(
            value: CGSize(width: 100, height: 20),
            _proposal: CGSize(width: 40, height: 50)
        ),
        
        Input_subscript(
            initialValue: CGSize(width: 10, height: 20),
            proposalWidth: 40,
            proposalHeight: 50,
            axis: .vertical,
            newValue: 200
        ): Output_subscript(
            value: CGSize(width: 10, height: 200),
            _proposal: CGSize(width: 40, height: 50)
        ),
        
        Input_subscript(
            initialValue: CGSize(width: 10, height: 20),
            proposalWidth: nil,
            proposalHeight: nil,
            axis: .horizontal,
            newValue: CGFloat.infinity
        ): Output_subscript(
            value: CGSize(width: CGFloat.infinity, height: 20),
            _proposal: CGSize(width: CGFloat.nan, height: CGFloat.nan)
        ),
        
        Input_subscript(
            initialValue: CGSize(width: 10, height: 20),
            proposalWidth: nil,
            proposalHeight: nil,
            axis: .vertical,
            newValue: -CGFloat.infinity
        ): Output_subscript(
            value: CGSize(width: 10, height: -CGFloat.infinity),
            _proposal: CGSize(width: CGFloat.nan, height: CGFloat.nan)
        ),
        
        Input_subscript(
            initialValue: CGSize(width: CGFloat.nan, height: 20),
            proposalWidth: 40,
            proposalHeight: 50,
            axis: .horizontal,
            newValue: CGFloat.nan
        ): Output_subscript(
            value: CGSize(width: CGFloat.nan, height: 20),
            _proposal: CGSize(width: 40, height: 50)
        )
    ]
    
    @Test(arguments: Self.subscript_expectations)
    func test_subscript(input: Input_subscript, output: Output_subscript) {
        let implAxis: MySwiftUICore.Axis = input.axis == .horizontal ? .horizontal : .vertical
        
        var impl = MySwiftUICore.ViewSize(
            input.initialValue,
            proposal: MySwiftUICore._ProposedSize(
                width: input.proposalWidth,
                height: input.proposalHeight
            )
        )
        
        let expectedInitial: CGFloat = input.axis == .horizontal ? input.initialValue.width : input.initialValue.height
        
        #expect(impl[implAxis].bitPattern == expectedInitial.bitPattern)
        
        impl[implAxis] = input.newValue
        
        let expectedAfter: CGFloat = input.axis == .horizontal ? output.value.width : output.value.height
        
        #expect(impl[implAxis].bitPattern == expectedAfter.bitPattern)
        #expect(impl.value.isEqual(to: output.value))
        #expect(impl._proposal.isEqual(to: output._proposal))
        
        
        var original = _SwiftUICorePrivate.ViewSize(
            input.initialValue,
            proposal: SwiftUI._ProposedSize(
                width: input.proposalWidth,
                height: input.proposalHeight
            )
        )
        
        #expect(original[input.axis].bitPattern == expectedInitial.bitPattern)
        
        original[input.axis] = input.newValue
        
        #expect(original[input.axis].bitPattern == expectedAfter.bitPattern)
        #expect(original.value.isEqual(to: output.value))
        #expect(original._proposal.isEqual(to: output._proposal))
    }
}

extension ViewSizeTests {
    struct Input_animatableData: Hashable {
        let initialValue: CGSize
        let proposalWidth: CGFloat?
        let proposalHeight: CGFloat?
        let newAnimatableDataFirst: CGFloat
        let newAnimatableDataSecond: CGFloat
    }
    
    struct Output_animatableData {
        let value: CGSize
        let _proposal: CGSize
    }
    
    static let animatableData_expectations: [Input_animatableData: Output_animatableData] = [
        Input_animatableData(
            initialValue: CGSize(width: 10, height: 20),
            proposalWidth: 40,
            proposalHeight: 50,
            newAnimatableDataFirst: 100,
            newAnimatableDataSecond: 200
        ): Output_animatableData(
            value: CGSize(width: 100, height: 200),
            _proposal: CGSize(width: 100, height: 200)
        ),
        
        Input_animatableData(
            initialValue: CGSize(width: 10, height: 20),
            proposalWidth: nil,
            proposalHeight: nil,
            newAnimatableDataFirst: CGFloat.infinity,
            newAnimatableDataSecond: 30
        ): Output_animatableData(
            value: CGSize(width: CGFloat.infinity, height: 30),
            _proposal: CGSize(width: CGFloat.infinity, height: 30)
        ),
        
        Input_animatableData(
            initialValue: CGSize(width: 10, height: 20),
            proposalWidth: 40,
            proposalHeight: 50,
            newAnimatableDataFirst: -CGFloat.infinity,
            newAnimatableDataSecond: CGFloat.infinity
        ): Output_animatableData(
            value: CGSize(width: -CGFloat.infinity, height: CGFloat.infinity),
            _proposal: CGSize(width: -CGFloat.infinity, height: CGFloat.infinity)
        ),
        
        Input_animatableData(
            initialValue: CGSize(width: CGFloat.nan, height: 20),
            proposalWidth: 40,
            proposalHeight: 50,
            newAnimatableDataFirst: CGFloat.nan,
            newAnimatableDataSecond: CGFloat.nan
        ): Output_animatableData(
            value: CGSize(width: CGFloat.nan, height: CGFloat.nan),
            _proposal: CGSize(width: CGFloat.nan, height: CGFloat.nan)
        )
    ]
    
    @Test(arguments: Self.animatableData_expectations)
    func test_animatableData(input: Input_animatableData, output: Output_animatableData) {
        var impl = MySwiftUICore.ViewSize(
            input.initialValue,
            proposal: MySwiftUICore._ProposedSize(
                width: input.proposalWidth,
                height: input.proposalHeight
            )
        )
        
        let initialAnimatable = impl.animatableData
        #expect(initialAnimatable.first.bitPattern == input.initialValue.width.bitPattern)
        #expect(initialAnimatable.second.bitPattern == input.initialValue.height.bitPattern)
        
        impl.animatableData = MySwiftUICore.AnimatablePair(
            input.newAnimatableDataFirst,
            input.newAnimatableDataSecond
        )
        
        #expect(impl.value.isEqual(to: output.value))
        #expect(impl._proposal.isEqual(to: output._proposal))
        #expect(impl.animatableData.first.bitPattern == input.newAnimatableDataFirst.bitPattern)
        #expect(impl.animatableData.second.bitPattern == input.newAnimatableDataSecond.bitPattern)
        
        var original = _SwiftUICorePrivate.ViewSize(
            input.initialValue,
            proposal: SwiftUI._ProposedSize(
                width: input.proposalWidth,
                height: input.proposalHeight
            )
        )
        
        let originalInitialAnimatable = original.animatableData
        #expect(originalInitialAnimatable.first.bitPattern == input.initialValue.width.bitPattern)
        #expect(originalInitialAnimatable.second.bitPattern == input.initialValue.height.bitPattern)
        
        original.animatableData = SwiftUI.AnimatablePair(
            input.newAnimatableDataFirst,
            input.newAnimatableDataSecond
        )
        
        #expect(original.value.isEqual(to: output.value))
        #expect(original._proposal.isEqual(to: output._proposal))
        #expect(original.animatableData.first.bitPattern == input.newAnimatableDataFirst.bitPattern)
        #expect(original.animatableData.second.bitPattern == input.newAnimatableDataSecond.bitPattern)
    }
}

extension ViewSizeTests {
    struct Input_fixed: Hashable {
        let size: CGSize
    }
    
    struct Output_fixed {
        let value: CGSize
        let _proposal: CGSize
    }
    
    static let fixed_expectations: [Input_fixed: Output_fixed] = [
        Input_fixed(
            size: CGSize(width: 10, height: 20)
        ): Output_fixed(
            value: CGSize(width: 10, height: 20),
            _proposal: CGSize(width: 10, height: 20)
        ),
        
        Input_fixed(
            size: CGSize(width: CGFloat.infinity, height: 30)
        ): Output_fixed(
            value: CGSize(width: CGFloat.infinity, height: 30),
            _proposal: CGSize(width: CGFloat.infinity, height: 30)
        ),
        
        Input_fixed(
            size: CGSize(width: -CGFloat.infinity, height: CGFloat.infinity)
        ): Output_fixed(
            value: CGSize(width: -CGFloat.infinity, height: CGFloat.infinity),
            _proposal: CGSize(width: -CGFloat.infinity, height: CGFloat.infinity)
        ),
        
        Input_fixed(
            size: CGSize(width: CGFloat.nan, height: CGFloat.nan)
        ): Output_fixed(
            value: CGSize(width: CGFloat.nan, height: CGFloat.nan),
            _proposal: CGSize(width: CGFloat.nan, height: CGFloat.nan)
        )
    ]
    
    @Test(arguments: Self.fixed_expectations)
    func test_fixed(input: Input_fixed, output: Output_fixed) {
        let impl = MySwiftUICore.ViewSize.fixed(input.size)
        
        #expect(impl.value.isEqual(to: output.value))
        #expect(impl._proposal.isEqual(to: output._proposal))
        
        let original = _SwiftUICorePrivate.ViewSize.fixed(input.size)
        
        #expect(original.value.isEqual(to: output.value))
        #expect(original._proposal.isEqual(to: output._proposal))
    }
}

extension ViewSizeTests {
    struct Input_inset: Hashable {
        let value: CGSize
        let proposalWidth: CGFloat?
        let proposalHeight: CGFloat?
        let insetsTop: CGFloat
        let insetsLeading: CGFloat
        let insetsBottom: CGFloat
        let insetsTrailing: CGFloat
    }
    
    struct Output_inset {
        let value: CGSize
        let _proposal: CGSize
    }
    
    static let inset_expectations: [Input_inset: Output_inset] = [
        Input_inset(
            value: CGSize(width: 100, height: 80),
            proposalWidth: 100,
            proposalHeight: 80,
            insetsTop: 10,
            insetsLeading: 10,
            insetsBottom: 10,
            insetsTrailing: 10
        ): Output_inset(
            value: CGSize(width: 80, height: 60),
            _proposal: CGSize(width: 80, height: 60)
        ),
        
        Input_inset(
            value: CGSize(width: 15, height: 15),
            proposalWidth: 15,
            proposalHeight: 15,
            insetsTop: 10,
            insetsLeading: 10,
            insetsBottom: 10,
            insetsTrailing: 10
        ): Output_inset(
            value: CGSize(width: 0, height: 0),
            _proposal: CGSize(width: 0, height: 0)
        ),
        
        Input_inset(
            value: CGSize(width: CGFloat.nan, height: 100),
            proposalWidth: 100,
            proposalHeight: 100,
            insetsTop: 10,
            insetsLeading: 10,
            insetsBottom: 10,
            insetsTrailing: 10
        ): Output_inset(
            value: CGSize(width: 0, height: 80),
            _proposal: CGSize(width: 80, height: 80)
        ),
        
        Input_inset(
            value: CGSize(width: 100, height: CGFloat.nan),
            proposalWidth: 100,
            proposalHeight: 100,
            insetsTop: 10,
            insetsLeading: 10,
            insetsBottom: 10,
            insetsTrailing: 10
        ): Output_inset(
            value: CGSize(width: 80, height: 0),
            _proposal: CGSize(width: 80, height: 80)
        ),
        
        Input_inset(
            value: CGSize(width: CGFloat.infinity, height: 100),
            proposalWidth: CGFloat.infinity,
            proposalHeight: 100,
            insetsTop: 10,
            insetsLeading: 10,
            insetsBottom: 10,
            insetsTrailing: 10
        ): Output_inset(
            value: CGSize(width: CGFloat.infinity, height: 80),
            _proposal: CGSize(width: CGFloat.infinity, height: 80)
        ),
        
        Input_inset(
            value: CGSize(width: 50, height: 40),
            proposalWidth: nil,
            proposalHeight: nil,
            insetsTop: 10,
            insetsLeading: 30,
            insetsBottom: 10,
            insetsTrailing: 30
        ): Output_inset(
            value: CGSize(width: 0, height: 20),
            _proposal: CGSize(width: CGFloat.nan, height: CGFloat.nan)
        ),
        
        Input_inset(
            value: CGSize(width: CGFloat.nan, height: CGFloat.nan),
            proposalWidth: nil,
            proposalHeight: nil,
            insetsTop: 10,
            insetsLeading: 10,
            insetsBottom: 10,
            insetsTrailing: 10
        ): Output_inset(
            value: CGSize(width: 0, height: 0),
            _proposal: CGSize(width: CGFloat.nan, height: CGFloat.nan)
        )
    ]
    
    @Test(arguments: Self.inset_expectations)
    func test_inset(input: Input_inset, output: Output_inset) {
        let impl = MySwiftUICore.ViewSize(
            input.value,
            proposal: MySwiftUICore._ProposedSize(
                width: input.proposalWidth,
                height: input.proposalHeight
            )
        ).inset(
            by: MySwiftUICore.EdgeInsets(
                top: input.insetsTop,
                leading: input.insetsLeading,
                bottom: input.insetsBottom,
                trailing: input.insetsTrailing
            )
        )
        
        #expect(impl.value.isEqual(to: output.value))
        #expect(impl._proposal.isEqual(to: output._proposal))
        
        let original = _SwiftUICorePrivate.ViewSize(
            input.value,
            proposal: SwiftUI._ProposedSize(
                width: input.proposalWidth,
                height: input.proposalHeight
            )
        ).inset(
            by: SwiftUI.EdgeInsets(
                top: input.insetsTop,
                leading: input.insetsLeading,
                bottom: input.insetsBottom,
                trailing: input.insetsTrailing
            )
        )
        
        #expect(original.value.isEqual(to: output.value))
        #expect(original._proposal.isEqual(to: output._proposal))
    }
}

extension ViewSizeTests {
    struct Input_equatable: Hashable {
        let lhsValue: CGSize
        let lhsProposalWidth: CGFloat?
        let lhsProposalHeight: CGFloat?
        let rhsValue: CGSize
        let rhsProposalWidth: CGFloat?
        let rhsProposalHeight: CGFloat?
        let expected: Bool
    }
    
    static let equatable_expectations: [Input_equatable] = [
        Input_equatable(
            lhsValue: CGSize(width: 10, height: 20),
            lhsProposalWidth: 40,
            lhsProposalHeight: 50,
            rhsValue: CGSize(width: 10, height: 20),
            rhsProposalWidth: 40,
            rhsProposalHeight: 50,
            expected: true
        ),
        
        Input_equatable(
            lhsValue: CGSize(width: 10, height: 20),
            lhsProposalWidth: CGFloat.nan,
            lhsProposalHeight: CGFloat.nan,
            rhsValue: CGSize(width: 10, height: 20),
            rhsProposalWidth: nil,
            rhsProposalHeight: nil,
            expected: true
        ),
        
        Input_equatable(
            lhsValue: CGSize(width: 10, height: 20),
            lhsProposalWidth: CGFloat.nan,
            lhsProposalHeight: CGFloat.nan,
            rhsValue: CGSize(width: 10, height: 20),
            rhsProposalWidth: CGFloat.nan,
            rhsProposalHeight: CGFloat.nan,
            expected: true
        ),
        
        Input_equatable(
            lhsValue: CGSize(width: 10, height: 20),
            lhsProposalWidth: CGFloat.nan,
            lhsProposalHeight: 50,
            rhsValue: CGSize(width: 10, height: 20),
            rhsProposalWidth: 40,
            rhsProposalHeight: 50,
            expected: false
        ),
        
        Input_equatable(
            lhsValue: CGSize(width: 10, height: 20),
            lhsProposalWidth: 40,
            lhsProposalHeight: CGFloat.nan,
            rhsValue: CGSize(width: 10, height: 20),
            rhsProposalWidth: 40,
            rhsProposalHeight: 60,
            expected: false
        ),
        
        Input_equatable(
            lhsValue: CGSize(width: CGFloat.nan, height: 20),
            lhsProposalWidth: 40,
            lhsProposalHeight: 50,
            rhsValue: CGSize(width: CGFloat.nan, height: 20),
            rhsProposalWidth: 40,
            rhsProposalHeight: 50,
            expected: true
        ),
        
        Input_equatable(
            lhsValue: CGSize(width: CGFloat.nan, height: 20),
            lhsProposalWidth: 40,
            lhsProposalHeight: 50,
            rhsValue: CGSize(width: 10, height: 20),
            rhsProposalWidth: 40,
            rhsProposalHeight: 50,
            expected: false
        ),
        
        Input_equatable(
            lhsValue: CGSize(width: CGFloat.infinity, height: 20),
            lhsProposalWidth: CGFloat.infinity,
            lhsProposalHeight: 50,
            rhsValue: CGSize(width: CGFloat.infinity, height: 20),
            rhsProposalWidth: CGFloat.infinity,
            rhsProposalHeight: 50,
            expected: true
        ),
        
        Input_equatable(
            lhsValue: CGSize(width: CGFloat.infinity, height: 20),
            lhsProposalWidth: CGFloat.infinity,
            lhsProposalHeight: 50,
            rhsValue: CGSize(width: -CGFloat.infinity, height: 20),
            rhsProposalWidth: CGFloat.infinity,
            rhsProposalHeight: 50,
            expected: false
        ),
        
        Input_equatable(
            lhsValue: CGSize(width: -CGFloat.infinity, height: 20),
            lhsProposalWidth: -CGFloat.infinity,
            lhsProposalHeight: 50,
            rhsValue: CGSize(width: -CGFloat.infinity, height: 20),
            rhsProposalWidth: -CGFloat.infinity,
            rhsProposalHeight: 50,
            expected: true
        ),
        
        Input_equatable(
            lhsValue: CGSize(width: -CGFloat.infinity, height: 20),
            lhsProposalWidth: -CGFloat.infinity,
            lhsProposalHeight: 50,
            rhsValue: CGSize(width: CGFloat.infinity, height: 20),
            rhsProposalWidth: -CGFloat.infinity,
            rhsProposalHeight: 50,
            expected: false
        ),
        
        Input_equatable(
            lhsValue: CGSize(width: CGFloat.infinity, height: CGFloat.infinity),
            lhsProposalWidth: CGFloat.nan,
            lhsProposalHeight: CGFloat.nan,
            rhsValue: CGSize(width: CGFloat.infinity, height: CGFloat.infinity),
            rhsProposalWidth: nil,
            rhsProposalHeight: nil,
            expected: true
        ),
        
        Input_equatable(
            lhsValue: CGSize(width: CGFloat.nan, height: CGFloat.nan),
            lhsProposalWidth: CGFloat.nan,
            lhsProposalHeight: CGFloat.nan,
            rhsValue: CGSize(width: CGFloat.nan, height: CGFloat.nan),
            rhsProposalWidth: CGFloat.nan,
            rhsProposalHeight: CGFloat.nan,
            expected: false
        ),
        
        Input_equatable(
            lhsValue: CGSize(width: CGFloat.nan, height: CGFloat.nan),
            lhsProposalWidth: CGFloat.nan,
            lhsProposalHeight: CGFloat.nan,
            rhsValue: CGSize(width: CGFloat.infinity, height: CGFloat.nan),
            rhsProposalWidth: CGFloat.nan,
            rhsProposalHeight: CGFloat.nan,
            expected: false
        )
    ]
    
    @Test(arguments: Self.equatable_expectations)
    func test_equatable(input: Input_equatable) {
        let lhs = MySwiftUICore.ViewSize(
            input.lhsValue,
            proposal: MySwiftUICore._ProposedSize(
                width: input.lhsProposalWidth,
                height: input.lhsProposalHeight
            )
        )
        
        let rhs = MySwiftUICore.ViewSize(
            input.rhsValue,
            proposal: MySwiftUICore._ProposedSize(
                width: input.rhsProposalWidth,
                height: input.rhsProposalHeight
            )
        )
        
        #expect((lhs == rhs) == input.expected)
        
        let originalLhs = _SwiftUICorePrivate.ViewSize(
            input.lhsValue,
            proposal: SwiftUI._ProposedSize(
                width: input.lhsProposalWidth,
                height: input.lhsProposalHeight
            )
        )
        
        let originalRhs = _SwiftUICorePrivate.ViewSize(
            input.rhsValue,
            proposal: SwiftUI._ProposedSize(
                width: input.rhsProposalWidth,
                height: input.rhsProposalHeight
            )
        )
        
        #expect((originalLhs == originalRhs) == input.expected)
    }
}



extension _SwiftUICorePrivate.ViewSize {
    fileprivate var _proposal: CGSize {
        return Mirror(reflecting: self).descendant("_proposal") as! CGSize
    }
}
