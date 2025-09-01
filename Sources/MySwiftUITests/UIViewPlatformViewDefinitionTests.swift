internal import Testing
@testable private import MySwiftUI
private import UIKit

struct UIViewPlatformViewDefinitionTests {
    @Test
    func test_mySwiftUI_platformViewDefinition() {
        let definition = UIView._mySwiftUI_platformViewDefinition()
        let expected = unsafeBitCast(UIViewPlatformViewDefinition.self, to: UnsafeRawPointer.self)
        #expect(definition == expected)
    }
}
