private import _SwiftUICorePrivate
@testable @_private(sourceFile: "ViewDepth.swift") private import MySwiftUICore
internal import Testing
private import SwiftUI

struct ViewDepthTests {
    @Test func test_init() {
        let values: [Input: (CGFloat, CGFloat)] = [
            Input(10, 20): (10, 20),
            
            Input(10, .infinity): (10, .infinity),
            Input(.infinity, 10): (.infinity, 10),
            Input(.infinity, .infinity): (.infinity, .infinity),
            
            Input(10, .nan): (10, .nan),
            Input(.nan, 10): (.nan, 10),
            Input(.nan, .nan): (.nan, .nan),
            
            Input(10, nil): (10, .nan),
            Input(.nan, nil): (.nan, .nan),
            
            Input(.infinity, .nan): (.infinity, .nan),
            Input(.infinity, nil): (.infinity, .nan),
            Input(.nan, .infinity): (.nan, .infinity),
        ]
        
        for (input, output) in values {
            let impl = MySwiftUICore.ViewDepth(input.a, proposal: input.b)
            let original = _SwiftUICorePrivate.ViewDepth(input.a, proposal: input.b)
            
            #expect(impl.value.bitPattern == output.0.bitPattern)
            #expect(impl._proposal.bitPattern == output.1.bitPattern)
            
            #expect(original.value.bitPattern == output.0.bitPattern)
            #expect(original._proposal.bitPattern == output.1.bitPattern)
        }
    }
    
    @Test func test_proposal() {
        let values: [Input: (CGFloat, CGFloat)] = [
            Input(10, 20): (10, 20),
            
            Input(10, .infinity): (10, .infinity),
            Input(.infinity, 10): (.infinity, 10),
            Input(.infinity, .infinity): (.infinity, .infinity),
            
            Input(10, .nan): (10, .nan),
            Input(.nan, 10): (.nan, 10),
            Input(.nan, .nan): (.nan, .nan),
            
            Input(10, nil): (10, .nan),
            Input(.nan, nil): (.nan, .nan),
            
            Input(.infinity, .nan): (.infinity, .nan),
            Input(.infinity, nil): (.infinity, .nan),
            Input(.nan, .infinity): (.nan, .infinity),
        ]
        
        for (input, output) in values {
            let impl = MySwiftUICore.ViewDepth(input.a, proposal: input.b)
            let original = _SwiftUICorePrivate.ViewDepth(input.a, proposal: input.b)
            
            #expect(impl.value.bitPattern == output.0.bitPattern)
            #expect(impl._proposal.bitPattern == output.1.bitPattern)
            
            #expect(original.value.bitPattern == output.0.bitPattern)
            #expect(original._proposal.bitPattern == output.1.bitPattern)
        }
    }
    
    @Test func test_animatableData() {
        let values: [(CGFloat, CGFloat, CGFloat)] = [
            (30, 30, 30),
            (.infinity, .infinity, .infinity),
            (.nan, .nan, .nan)
        ]
        
        for value in values {
            var impl = MySwiftUICore.ViewDepth(10, proposal: 20)
            var original = _SwiftUICorePrivate.ViewDepth(10, proposal: 20)
            
            impl.animatableData = value.0
            original.animatableData = value.0
            
            #expect(impl.animatableData.bitPattern == value.0.bitPattern)
            #expect(original.animatableData.bitPattern == value.0.bitPattern)
            #expect(impl.value.bitPattern == value.1.bitPattern)
            #expect(original.value.bitPattern == value.1.bitPattern)
            #expect(impl._proposal.bitPattern == value.2.bitPattern)
            #expect(original._proposal.bitPattern == value.2.bitPattern)
        }
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
