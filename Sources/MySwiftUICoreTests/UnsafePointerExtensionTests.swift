private import _SwiftUICorePrivate
@testable private import MySwiftUICore
internal import Testing
private import SwiftUI

fileprivate struct UnsafePointerExtensionTests {
    @Test func test_null() {
        let impl = unsafe UnsafePointer<(Bool, Bool, Bool)>.null
        let original = unsafe UnsafePointer<(Bool, Bool, Bool)>._null
        #expect(Int(bitPattern: impl) == Int(bitPattern: original))
    }
}

fileprivate struct UnsafeMutablePointerExtensionTests {
    @Test func test_null() {
        let impl = unsafe UnsafeMutablePointer<(Bool, Bool, Bool)>.null
        let original = unsafe UnsafeMutablePointer<(Bool, Bool, Bool)>._null
        #expect(Int(bitPattern: impl) == Int(bitPattern: original))
    }
}
