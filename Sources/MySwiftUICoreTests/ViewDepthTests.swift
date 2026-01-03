private import _SwiftUICorePrivate
@testable @_private(sourceFile: "ViewDepth.swift") private import MySwiftUICore
internal import Testing
private import SwiftUI

fileprivate struct ViewDepthTests {}

extension ViewDepthTests {
    static let initExpectations: [Input: (CGFloat, CGFloat)] = [
        Input(10, 20): (10, 20),
        
        Input(10, .infinity): (10, .infinity),
        Input(.infinity, 10): (.infinity, 10),
        Input(.infinity, .infinity): (.infinity, .infinity),
        
        Input(10, -CGFloat.infinity): (10, -CGFloat.infinity),
        Input(-CGFloat.infinity, 10): (-CGFloat.infinity, 10),
        Input(-CGFloat.infinity, -CGFloat.infinity): (-CGFloat.infinity, -CGFloat.infinity),
        
        Input(10, .nan): (10, .nan),
        Input(.nan, 10): (.nan, 10),
        Input(.nan, .nan): (.nan, .nan),
        
        Input(10, nil): (10, .nan),
        Input(.nan, nil): (.nan, .nan),
        
        Input(.infinity, .nan): (.infinity, .nan),
        Input(.infinity, nil): (.infinity, .nan),
        Input(.nan, .infinity): (.nan, .infinity),
        
        Input(-CGFloat.infinity, .nan): (-CGFloat.infinity, .nan),
        Input(-CGFloat.infinity, nil): (-CGFloat.infinity, .nan),
        Input(.nan, -CGFloat.infinity): (.nan, -CGFloat.infinity)
    ]
    
    @Test(arguments: Self.initExpectations) func test_init(input: Input, expectation: (CGFloat, CGFloat)) throws {
        let impl = MySwiftUICore.ViewDepth(input.a, proposal: input.b)
        let original = _SwiftUICorePrivate.ViewDepth(input.a, proposal: input.b)
        
        #expect(impl.value.bitPattern == expectation.0.bitPattern)
        #expect(impl._proposal.bitPattern == expectation.1.bitPattern)
        
        #expect(original.value.bitPattern == expectation.0.bitPattern)
        #expect(original._proposal.bitPattern == expectation.1.bitPattern)
    }
}

extension ViewDepthTests {
    static let proposalExpectations: [Input: (CGFloat, CGFloat)] = [
        Input(10, 20): (10, 20),
        
        Input(10, .infinity): (10, .infinity),
        Input(.infinity, 10): (.infinity, 10),
        Input(.infinity, .infinity): (.infinity, .infinity),
        
        Input(10, -CGFloat.infinity): (10, -CGFloat.infinity),
        Input(-CGFloat.infinity, 10): (-CGFloat.infinity, 10),
        Input(-CGFloat.infinity, -CGFloat.infinity): (-CGFloat.infinity, -CGFloat.infinity),
        
        Input(10, .nan): (10, .nan),
        Input(.nan, 10): (.nan, 10),
        Input(.nan, .nan): (.nan, .nan),
        
        Input(10, nil): (10, .nan),
        Input(.nan, nil): (.nan, .nan),
        
        Input(.infinity, .nan): (.infinity, .nan),
        Input(.infinity, nil): (.infinity, .nan),
        Input(.nan, .infinity): (.nan, .infinity),
        
        Input(-CGFloat.infinity, .nan): (-CGFloat.infinity, .nan),
        Input(-CGFloat.infinity, nil): (-CGFloat.infinity, .nan),
        Input(.nan, -CGFloat.infinity): (.nan, -CGFloat.infinity)
    ]
    
    
    @Test(arguments: Self.proposalExpectations) func test_proposal(input: Input, expectation: (CGFloat, CGFloat)) {
        let impl = MySwiftUICore.ViewDepth(input.a, proposal: input.b)
        let original = _SwiftUICorePrivate.ViewDepth(input.a, proposal: input.b)
        
        #expect(impl.value.bitPattern == expectation.0.bitPattern)
        #expect(impl._proposal.bitPattern == expectation.1.bitPattern)
        
        #expect(original.value.bitPattern == expectation.0.bitPattern)
        #expect(original._proposal.bitPattern == expectation.1.bitPattern)
    }
}

extension ViewDepthTests {
    static let equalityExpectations: [Input] = [
        Input(10, 20),
        Input(10, nil),
        Input(10, .nan),
        Input(10, .infinity),
        Input(10, -CGFloat.infinity),
        
        Input(.infinity, 20),
        Input(.infinity, nil),
        Input(.infinity, .nan),
        Input(.infinity, .infinity),
        
        Input(-CGFloat.infinity, 20),
        Input(-CGFloat.infinity, nil),
        Input(-CGFloat.infinity, .nan),
        Input(-CGFloat.infinity, -CGFloat.infinity)
    ]
    
    
    @Test(arguments: Self.equalityExpectations) func testEquality(input: Input) {
        #expect(MySwiftUICore.ViewDepth(input.a, proposal: input.b) == MySwiftUICore.ViewDepth(input.a, proposal: input.b))
        #expect(_SwiftUICorePrivate.ViewDepth(input.a, proposal: input.b) == _SwiftUICorePrivate.ViewDepth(input.a, proposal: input.b))
    }
}

extension ViewDepthTests {
    static let notEqualityLhsExpectations: [Input] = [
        Input(10, 20),
        Input(0, 0),
        Input(-1, 1),
        Input(.nan, 20),
        Input(.nan, nil),
        Input(.nan, .nan),
        Input(.nan, .infinity),
        Input(.infinity, 20),
        Input(.infinity, nil),
        Input(.infinity, .nan),
        
        Input(-CGFloat.infinity, 20),
        Input(-CGFloat.infinity, nil),
        Input(-CGFloat.infinity, .nan)
    ]
    
    static let notEqualityRhsExpectations: [Input] = [
        Input(10, 30),
        Input(20, 20),
        Input(0, 1),
        Input(1, -1),
        Input(10, nil),
        Input(10, .nan),
        Input(.nan, 20),
        Input(.nan, 0),
        Input(10, .infinity),
        Input(.infinity, 20),
        
        Input(.infinity, 20),
        Input(.infinity, nil),
        Input(.infinity, .nan)
    ]
    
    
    @Test(arguments: Self.notEqualityLhsExpectations.indices) func testNotEquality(index: Array<Input>.Index) {
        let lhs = Self.notEqualityLhsExpectations[index]
        let rhs = Self.notEqualityRhsExpectations[index]
        
        #expect(MySwiftUICore.ViewDepth(lhs.a, proposal: lhs.b) != MySwiftUICore.ViewDepth(rhs.a, proposal: rhs.b))
        #expect(_SwiftUICorePrivate.ViewDepth(lhs.a, proposal: lhs.b) != _SwiftUICorePrivate.ViewDepth(rhs.a, proposal: rhs.b))
    }
}

extension ViewDepthTests {
    static let animatableDataExpectations: [CGFloat: (CGFloat, CGFloat)] = [
        30: (30, 30),
        .infinity: (.infinity, .infinity),
        -CGFloat.infinity: (-CGFloat.infinity, -CGFloat.infinity),
        .nan: (.nan, .nan)
    ]
    
    
    @Test(arguments: Self.animatableDataExpectations) func test_animatableData(input: CGFloat, expectation: (CGFloat, CGFloat)) {
        var impl = MySwiftUICore.ViewDepth(10, proposal: 20)
        var original = _SwiftUICorePrivate.ViewDepth(10, proposal: 20)
        
        impl.animatableData = input
        original.animatableData = input
        
        #expect(impl.animatableData.bitPattern == input.bitPattern)
        #expect(original.animatableData.bitPattern == input.bitPattern)
        #expect(impl.value.bitPattern == expectation.0.bitPattern)
        #expect(original.value.bitPattern == expectation.0.bitPattern)
        #expect(impl._proposal.bitPattern == expectation.1.bitPattern)
        #expect(original._proposal.bitPattern == expectation.1.bitPattern)
    }
}

fileprivate struct Input: Hashable {
    let a: CGFloat
    let b: CGFloat?
    
    init(_ a: CGFloat, _ b: CGFloat?) {
        self.a = a
        self.b = b
    }
}

extension CGFloat {
    fileprivate static var nan2: CGFloat {
        return CGFloat(bitPattern: CGFloat.nan.bitPattern &+ 1)
    }
}

extension _SwiftUICorePrivate.ViewDepth {
    fileprivate var _proposal: CGFloat {
        return Mirror(reflecting: self).descendant("_proposal") as! CGFloat
    }
}
