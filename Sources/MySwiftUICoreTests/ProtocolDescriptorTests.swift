@preconcurrency private import _SwiftUICorePrivate
@testable private import MySwiftUICore
private import _MySwiftUIShims
internal import Testing
private import SwiftUI

fileprivate struct ProtocolDescriptionTests {
    @Test func test_conformance() {
        #expect(ImplMyDescriptor.conformance(of: MySwiftUICore.Color.self)?.type == MySwiftUICore.Color.self)
        #expect(ImplMyDescriptor.conformance(of: NotView.self) == nil)
        
        #expect(OriginalMyDescriptor.conformance(of: SwiftUI.Color.self)?.type == SwiftUI.Color.self)
        #expect(OriginalMyDescriptor.conformance(of: NotView.self) == nil)
    }
}

fileprivate struct ImplMyDescriptor: MySwiftUICore.ProtocolDescriptor {
    static var descriptor: UnsafeRawPointer {
        return _MySwiftUIShims._viewProtocolDescriptor()
    }
}

fileprivate struct OriginalMyDescriptor: _SwiftUICorePrivate.ProtocolDescriptor {
    static var descriptor: UnsafeRawPointer {
        return withUnsafePointer(to: &_SwiftUICorePrivate.__viewProtocolDescriptor) { UnsafeRawPointer($0) }
    }
}

fileprivate struct NotView {}
