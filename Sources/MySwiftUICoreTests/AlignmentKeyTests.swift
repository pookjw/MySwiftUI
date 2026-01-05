private import _SwiftUICorePrivate
@testable @_private(sourceFile: "AlignmentKey.swift") private import MySwiftUICore
internal import Testing
private import SwiftUI
private import Spatial
private import MySwiftUITestUtils

fileprivate struct AlignmentKeyTests {}

extension AlignmentKeyTests {
    @Test func test_id() {
        let key_1 = MySwiftUICore.AlignmentKey(id: MyAlignmentID_1.self, axis: .vertical)
        #expect(ObjectIdentifier(key_1.id) == ObjectIdentifier(MyAlignmentID_1.self))
        
        let key_2 = MySwiftUICore.AlignmentKey(id: MyAlignmentID_2.self, axis: .vertical)
        #expect(ObjectIdentifier(key_2.id) == ObjectIdentifier(MyAlignmentID_2.self))
        
        #expect(ObjectIdentifier(key_1.id) == ObjectIdentifier(MyAlignmentID_1.self))
    }
    
    @Test func test_axis() {
        let horizontal = AlignmentKey(id: MyAlignmentID_1.self, axis: .horizontal)
        #expect(horizontal.axis == .horizontal)
        
        let vertical = AlignmentKey(id: MyAlignmentID_2.self, axis: .vertical)
        #expect(vertical.axis == .vertical)
    }
    
    @Test func test_fraction() {
        let implKey = MySwiftUICore.AlignmentKey(id: MyAlignmentID_1.self, axis: .vertical)
        #expect(implKey.fraction == 1)
        
        let originalKey = SwiftUI.AlignmentKey(id: MyAlignmentID_3.self, axis: .horizontal)
        #expect(originalKey.fraction == 3)
    }
}

fileprivate struct MyAlignmentID_1: MySwiftUICore.AlignmentID {
    static func defaultValue(in context: MySwiftUICore.ViewDimensions) -> CGFloat {
        return 1
    }
}

fileprivate struct MyAlignmentID_2: MySwiftUICore.AlignmentID {
    static func defaultValue(in context: MySwiftUICore.ViewDimensions) -> CGFloat {
        return 2
    }
}

fileprivate struct MyAlignmentID_3: SwiftUI.AlignmentID {
    static func defaultValue(in context: SwiftUI.ViewDimensions) -> CGFloat {
        return 3
    }
}
