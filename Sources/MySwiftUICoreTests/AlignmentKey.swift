private import _SwiftUICorePrivate
@testable @_private(sourceFile: "AlignmentKey.swift") private import MySwiftUICore
internal import Testing
private import SwiftUI
private import Spatial
private import MySwiftUITestUtils

fileprivate struct AlignmentKeyTests {}

extension AlignmentKeyTests {
    @Test func test_id() {
        let key_1 = AlignmentKey(id: MyAlignmentID_1.self, axis: .vertical)
        #expect(ObjectIdentifier(key_1.id) == ObjectIdentifier(MyAlignmentID_1.self))
        
        let key_2 = AlignmentKey(id: MyAlignmentID_2.self, axis: .vertical)
        #expect(ObjectIdentifier(key_2.id) == ObjectIdentifier(MyAlignmentID_2.self))
        
        #expect(ObjectIdentifier(key_1.id) == ObjectIdentifier(MyAlignmentID_1.self))
    }
    
    @Test func test_axis() {
        let horizontal = AlignmentKey(id: MyAlignmentID_1.self, axis: .horizontal)
        #expect(horizontal.axis == .horizontal)
        
        let vertical = AlignmentKey(id: MyAlignmentID_2.self, axis: .vertical)
        #expect(vertical.axis == .vertical)
    }
}

fileprivate struct MyAlignmentID_1: AlignmentID {
    static func defaultValue(in context: ViewDimensions) -> CGFloat {
        fatalError("Do not call")
    }
}

fileprivate struct MyAlignmentID_2: AlignmentID {
    static func defaultValue(in context: ViewDimensions) -> CGFloat {
        fatalError("Do not call")
    }
}
