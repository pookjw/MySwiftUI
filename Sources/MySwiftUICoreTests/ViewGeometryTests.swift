private import _SwiftUICorePrivate
@testable private import MySwiftUICore
internal import Testing
private import SwiftUI

fileprivate struct ViewGeometryTests {}

extension ViewGeometryTests {
    @Test func test_isInvalid() {
        var impl = MySwiftUICore.ViewGeometry(
            origin: .zero,
            dimensions: MySwiftUICore.ViewDimensions(
                guideComputer: .defaultValue,
                size: .invalidValue
            )
        )
        
        var original = _SwiftUICorePrivate.ViewGeometry(
            origin: .zero,
            dimensions: _SwiftUICorePrivate.ViewDimensions(
                guideComputer: .defaultValue,
                size: .invalidValue
            )
        )
        
        #expect(!impl.isInvalid)
        #expect(!original.isInvalid)
        
        impl.origin.x = -10
        original.origin.x = -10
        #expect(!impl.isInvalid)
        #expect(!original.isInvalid)
        
        impl.origin.x = .nan
        original.origin.x = .nan
        #expect(impl.isInvalid)
        #expect(original.isInvalid)
        
        impl.origin.x = .infinity
        impl.origin.y = .infinity
        #expect(impl.isInvalid)
        #expect(original.isInvalid)
        
        impl.origin.x = -.infinity
        impl.origin.y = -.infinity
        #expect(impl.isInvalid)
        #expect(original.isInvalid)
    }
}
