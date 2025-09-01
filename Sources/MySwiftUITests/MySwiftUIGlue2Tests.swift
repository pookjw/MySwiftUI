internal import Testing
@testable private import MySwiftUI
@testable private import MySwiftUICore
@testable private import _MySwiftUIShims

struct MySwiftUIGlue2Tests {
    @Test
    func test_initializeMyCoreGlue2() {
        let glue = _initializeMyCoreGlue2()
        #expect(type(of: glue) == MySwiftUIGlue2.self)
    }
}
