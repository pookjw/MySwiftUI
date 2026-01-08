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
}
