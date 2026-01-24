@preconcurrency private import _SwiftUICorePrivate
@testable private import MySwiftUICore
private import _MySwiftUIShims
internal import Testing
private import SwiftUI
private import AttributeGraph

struct TupleTypeDescriptionTests {
    @Test func test_init() {
        let tupleType = TupleType((Int, String).self)
        
        let original = _SwiftUICorePrivate.TupleTypeDescription<OriginalMyTupleDescriptor>(tupleType)
//        let original = _SwiftUICorePrivate
    }
}

fileprivate struct ImplMyTupleDescriptor: MySwiftUICore.TupleDescriptor {
    static nonisolated(unsafe) var typeCache: [ObjectIdentifier: MySwiftUICore.TupleTypeDescription<ImplMyTupleDescriptor>] = [:]
    
    static var descriptor: UnsafeRawPointer {
        return _MySwiftUIShims._viewProtocolDescriptor()
    }
}

fileprivate struct OriginalMyTupleDescriptor: _SwiftUICorePrivate.TupleDescriptor {
    static nonisolated(unsafe) var typeCache: [ObjectIdentifier: _SwiftUICorePrivate.TupleTypeDescription<OriginalMyTupleDescriptor>] = [:]
    
    static var descriptor: UnsafeRawPointer {
        return withUnsafePointer(to: &_SwiftUICorePrivate.__viewProtocolDescriptor) { UnsafeRawPointer($0) }
    }
}
