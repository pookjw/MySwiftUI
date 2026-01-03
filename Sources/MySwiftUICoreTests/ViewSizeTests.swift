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

extension _SwiftUICorePrivate.ViewSize {
    fileprivate var _proposal: CGSize {
        return Mirror(reflecting: self).descendant("_proposal") as! CGSize
    }
}
