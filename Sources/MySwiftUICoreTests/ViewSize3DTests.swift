private import _SwiftUICorePrivate
@testable @_private(sourceFile: "ViewSize3D.swift") private import MySwiftUICore
internal import Testing
private import SwiftUI
private import Spatial
private import MySwiftUITestUtils

fileprivate struct ViewSize3DTests {
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
        Input_init_proposal(value: Size3D(width: 10, height: 20, depth: 30), proposalWidth: 40, proposalHeight: 50, proposalDepth: 60): Output_init_proposal(value: Size3D(width: 10, height: 20, depth: 30), _proposal: Size3D(width: 40, height: 50, depth: 60)),
        Input_init_proposal(value: Size3D(width: .nan, height: .nan, depth: .nan), proposalWidth: 40, proposalHeight: 50, proposalDepth: 60): Output_init_proposal(value: Size3D(width: 10, height: 20, depth: 30), _proposal: Size3D(width: .nan, height: .nan, depth: .nan)),
        
        Input_init_proposal(value: Size3D(width: 10, height: 20, depth: 30), proposalWidth: 40, proposalHeight: 50, proposalDepth: nil): Output_init_proposal(value: Size3D(width: 10, height: 20, depth: 30), _proposal: Size3D(width: 40, height: 50, depth: .nan)),
        Input_init_proposal(value: Size3D(width: 10, height: 20, depth: 30), proposalWidth: 40, proposalHeight: nil, proposalDepth: nil): Output_init_proposal(value: Size3D(width: 10, height: 20, depth: 30), _proposal: Size3D(width: 40, height: .nan, depth: .nan)),
        Input_init_proposal(value: Size3D(width: 10, height: 20, depth: 30), proposalWidth: nil, proposalHeight: nil, proposalDepth: nil): Output_init_proposal(value: Size3D(width: 10, height: 20, depth: 30), _proposal: Size3D(width: .nan, height: .nan, depth: .nan))
    ]
    
    @Test(arguments: Self.init_proposal_expectations) func test_init_proposal(input: Input_init_proposal, output: Output_init_proposal) {
        let impl = MySwiftUICore.ViewSize3D(
            input.value,
            proposal: MySwiftUICore._ProposedSize3D(width: input.proposalWidth, height: input.proposalHeight, depth: input.proposalDepth)
        )
        
        #expect(impl.value.isEqual(to: output.value))
        #expect(impl._proposal.isEqual(to: output._proposal))
        
        let original = _SwiftUICorePrivate.ViewSize3D(
            input.value,
            proposal: _SwiftUICorePrivate._ProposedSize3D(width: input.proposalWidth, height: input.proposalHeight, depth: input.proposalDepth)
        )
        
        #expect(original.value.isEqual(to: output.value))
        #expect(original._proposal.isEqual(to: output._proposal))
    }
}

extension ViewSize3DTests {
    // TODO
    struct Input_init_depth_proposedDepth: Hashable {
        
    }
}

extension _SwiftUICorePrivate.ViewSize3D {
    fileprivate var _proposal: Size3D {
        return Mirror(reflecting: self).descendant("_proposal") as! Size3D
    }
}
