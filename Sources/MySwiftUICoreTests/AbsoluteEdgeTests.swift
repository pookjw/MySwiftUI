private import _SwiftUICorePrivate
@testable private import MySwiftUICore
internal import Testing
private import SwiftUI

fileprivate struct AbsoluteEdgeTests {
    @Test func test_rawValue() {
        #expect(MySwiftUICore.AbsoluteEdge.top.rawValue == _SwiftUICorePrivate.AbsoluteEdge.top.rawValue)
        #expect(MySwiftUICore.AbsoluteEdge.left.rawValue == _SwiftUICorePrivate.AbsoluteEdge.left.rawValue)
        #expect(MySwiftUICore.AbsoluteEdge.bottom.rawValue == _SwiftUICorePrivate.AbsoluteEdge.bottom.rawValue)
        #expect(MySwiftUICore.AbsoluteEdge.right.rawValue == _SwiftUICorePrivate.AbsoluteEdge.right.rawValue)
    }
    
    @Test func test_allCases() {
        #expect(MySwiftUICore.AbsoluteEdge.allCases == [.top, .left, .bottom, .right])
        #expect(_SwiftUICorePrivate.AbsoluteEdge.allCases == [.top, .left, .bottom, .right])
    }
}

fileprivate struct AbsoluteEdgeSetTests {
    @Test func test_definitions() {
        #expect(MySwiftUICore.AbsoluteEdge.Set.top.rawValue == _SwiftUICorePrivate.AbsoluteEdge.Set.top.rawValue)
        #expect(MySwiftUICore.AbsoluteEdge.Set.left.rawValue == _SwiftUICorePrivate.AbsoluteEdge.Set.left.rawValue)
        #expect(MySwiftUICore.AbsoluteEdge.Set.bottom.rawValue == _SwiftUICorePrivate.AbsoluteEdge.Set.bottom.rawValue)
        #expect(MySwiftUICore.AbsoluteEdge.Set.right.rawValue == _SwiftUICorePrivate.AbsoluteEdge.Set.right.rawValue)
        #expect(MySwiftUICore.AbsoluteEdge.Set.all.rawValue == _SwiftUICorePrivate.AbsoluteEdge.Set.all.rawValue)
        #expect(MySwiftUICore.AbsoluteEdge.Set.horizontal.rawValue == _SwiftUICorePrivate.AbsoluteEdge.Set.horizontal.rawValue)
        #expect(MySwiftUICore.AbsoluteEdge.Set.vertical.rawValue == _SwiftUICorePrivate.AbsoluteEdge.Set.vertical.rawValue)
    }
    
    @Test func test_init_edge() {
        #expect(MySwiftUICore.AbsoluteEdge.Set(.top).rawValue == _SwiftUICorePrivate.AbsoluteEdge.Set(.top).rawValue)
        #expect(MySwiftUICore.AbsoluteEdge.Set(.left).rawValue == _SwiftUICorePrivate.AbsoluteEdge.Set(.left).rawValue)
        #expect(MySwiftUICore.AbsoluteEdge.Set(.bottom).rawValue == _SwiftUICorePrivate.AbsoluteEdge.Set(.bottom).rawValue)
        #expect(MySwiftUICore.AbsoluteEdge.Set(.right).rawValue == _SwiftUICorePrivate.AbsoluteEdge.Set(.right).rawValue)
    }
    
    @Test func test_contains() {
        // top
        #expect(MySwiftUICore.AbsoluteEdge.Set.top.contains(.top) == true)
        #expect(MySwiftUICore.AbsoluteEdge.Set.left.contains(.top) == false)
        #expect(MySwiftUICore.AbsoluteEdge.Set.bottom.contains(.top) == false)
        #expect(MySwiftUICore.AbsoluteEdge.Set.right.contains(.top) == false)
        #expect(MySwiftUICore.AbsoluteEdge.Set.all.contains(.top) == true)
        #expect(MySwiftUICore.AbsoluteEdge.Set.horizontal.contains(.top) == false)
        #expect(MySwiftUICore.AbsoluteEdge.Set.vertical.contains(.top) == true)
        
        #expect(_SwiftUICorePrivate.AbsoluteEdge.Set.top.contains(.top) == true)
        #expect(_SwiftUICorePrivate.AbsoluteEdge.Set.left.contains(.top) == false)
        #expect(_SwiftUICorePrivate.AbsoluteEdge.Set.bottom.contains(.top) == false)
        #expect(_SwiftUICorePrivate.AbsoluteEdge.Set.right.contains(.top) == false)
        #expect(_SwiftUICorePrivate.AbsoluteEdge.Set.all.contains(.top) == true)
        #expect(_SwiftUICorePrivate.AbsoluteEdge.Set.horizontal.contains(.top) == false)
        #expect(_SwiftUICorePrivate.AbsoluteEdge.Set.vertical.contains(.top) == true)
        
        // left
        #expect(MySwiftUICore.AbsoluteEdge.Set.top.contains(.left) == false)
        #expect(MySwiftUICore.AbsoluteEdge.Set.left.contains(.left) == true)
        #expect(MySwiftUICore.AbsoluteEdge.Set.bottom.contains(.left) == false)
        #expect(MySwiftUICore.AbsoluteEdge.Set.right.contains(.left) == false)
        #expect(MySwiftUICore.AbsoluteEdge.Set.all.contains(.left) == true)
        #expect(MySwiftUICore.AbsoluteEdge.Set.horizontal.contains(.left) == true)
        #expect(MySwiftUICore.AbsoluteEdge.Set.vertical.contains(.left) == false)
        
        #expect(_SwiftUICorePrivate.AbsoluteEdge.Set.top.contains(.left) == false)
        #expect(_SwiftUICorePrivate.AbsoluteEdge.Set.left.contains(.left) == true)
        #expect(_SwiftUICorePrivate.AbsoluteEdge.Set.bottom.contains(.left) == false)
        #expect(_SwiftUICorePrivate.AbsoluteEdge.Set.right.contains(.left) == false)
        #expect(_SwiftUICorePrivate.AbsoluteEdge.Set.all.contains(.left) == true)
        #expect(_SwiftUICorePrivate.AbsoluteEdge.Set.horizontal.contains(.left) == true)
        #expect(_SwiftUICorePrivate.AbsoluteEdge.Set.vertical.contains(.left) == false)
        
        // bottom
        #expect(MySwiftUICore.AbsoluteEdge.Set.top.contains(.bottom) == false)
        #expect(MySwiftUICore.AbsoluteEdge.Set.left.contains(.bottom) == false)
        #expect(MySwiftUICore.AbsoluteEdge.Set.bottom.contains(.bottom) == true)
        #expect(MySwiftUICore.AbsoluteEdge.Set.right.contains(.bottom) == false)
        #expect(MySwiftUICore.AbsoluteEdge.Set.all.contains(.bottom) == true)
        #expect(MySwiftUICore.AbsoluteEdge.Set.horizontal.contains(.bottom) == false)
        #expect(MySwiftUICore.AbsoluteEdge.Set.vertical.contains(.bottom) == true)
        
        #expect(_SwiftUICorePrivate.AbsoluteEdge.Set.top.contains(.bottom) == false)
        #expect(_SwiftUICorePrivate.AbsoluteEdge.Set.left.contains(.bottom) == false)
        #expect(_SwiftUICorePrivate.AbsoluteEdge.Set.bottom.contains(.bottom) == true)
        #expect(_SwiftUICorePrivate.AbsoluteEdge.Set.right.contains(.bottom) == false)
        #expect(_SwiftUICorePrivate.AbsoluteEdge.Set.all.contains(.bottom) == true)
        #expect(_SwiftUICorePrivate.AbsoluteEdge.Set.horizontal.contains(.bottom) == false)
        #expect(_SwiftUICorePrivate.AbsoluteEdge.Set.vertical.contains(.bottom) == true)
        
        // right
        #expect(MySwiftUICore.AbsoluteEdge.Set.top.contains(.right) == false)
        #expect(MySwiftUICore.AbsoluteEdge.Set.left.contains(.right) == false)
        #expect(MySwiftUICore.AbsoluteEdge.Set.bottom.contains(.right) == false)
        #expect(MySwiftUICore.AbsoluteEdge.Set.right.contains(.right) == true)
        #expect(MySwiftUICore.AbsoluteEdge.Set.all.contains(.right) == true)
        #expect(MySwiftUICore.AbsoluteEdge.Set.horizontal.contains(.right) == true)
        #expect(MySwiftUICore.AbsoluteEdge.Set.vertical.contains(.right) == false)
        
        #expect(_SwiftUICorePrivate.AbsoluteEdge.Set.top.contains(.right) == false)
        #expect(_SwiftUICorePrivate.AbsoluteEdge.Set.left.contains(.right) == false)
        #expect(_SwiftUICorePrivate.AbsoluteEdge.Set.bottom.contains(.right) == false)
        #expect(_SwiftUICorePrivate.AbsoluteEdge.Set.right.contains(.right) == true)
        #expect(_SwiftUICorePrivate.AbsoluteEdge.Set.all.contains(.right) == true)
        #expect(_SwiftUICorePrivate.AbsoluteEdge.Set.horizontal.contains(.right) == true)
        #expect(_SwiftUICorePrivate.AbsoluteEdge.Set.vertical.contains(.right) == false)
    }
    
    @Test func test_init_set_layoutDirection() {
        let directions: [MySwiftUICore.LayoutDirection] = [.leftToRight, .rightToLeft]
        
        let cases: [(MySwiftUICore.Edge.Set, MySwiftUICore.LayoutDirection, MySwiftUICore.AbsoluteEdge.Set)] = [
            (.top, .leftToRight, .top),
            (.top, .rightToLeft, .top),
            
            (.bottom, .leftToRight, .bottom),
            (.bottom, .rightToLeft, .bottom),
            
            (.leading, .leftToRight, .left),
            (.leading, .rightToLeft, .right),
            
            (.trailing, .leftToRight, .right),
            (.trailing, .rightToLeft, .left),
            
            (.vertical, .leftToRight, [.top, .bottom]),
            (.vertical, .rightToLeft, [.top, .bottom]),
            
            (.horizontal, .leftToRight, [.left, .right]),
            (.horizontal, .rightToLeft, [.left, .right]),
            
            ([.top, .leading], .leftToRight, [.top, .left]),
            ([.top, .leading], .rightToLeft, [.top, .right]),
            
            ([.top, .trailing], .leftToRight, [.top, .right]),
            ([.top, .trailing], .rightToLeft, [.top, .left]),
            
            ([.bottom, .leading], .leftToRight, [.bottom, .left]),
            ([.bottom, .leading], .rightToLeft, [.bottom, .right]),
            
            ([.bottom, .trailing], .leftToRight, [.bottom, .right]),
            ([.bottom, .trailing], .rightToLeft, [.bottom, .left]),
            
            (.all, .leftToRight, [.top, .bottom, .left, .right]),
            (.all, .rightToLeft, [.top, .bottom, .left, .right]),
        ]
        
        for (edgeSet, direction, expected) in cases {
            #expect(MySwiftUICore.AbsoluteEdge.Set(edgeSet, layoutDirection: direction) == expected)
            
            let original_edgeSet = SwiftUI.Edge.Set(rawValue: edgeSet.rawValue)
            let original_direction: SwiftUI.LayoutDirection = direction == .leftToRight ? .leftToRight : .rightToLeft
            let original_expected = _SwiftUICorePrivate.AbsoluteEdge.Set(rawValue: expected.rawValue)
            
            #expect(_SwiftUICorePrivate.AbsoluteEdge.Set(original_edgeSet, layoutDirection: original_direction) == original_expected)
        }
    }
}
