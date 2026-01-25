@preconcurrency private import _SwiftUICorePrivate
@testable private import MySwiftUICore
private import _MySwiftUIShims
internal import Testing
private import SwiftUI
private import AttributeGraph

fileprivate struct TupleTypeDescriptionTests {
    @Test func test_init() {
        let implTupleType = TupleType((MySwiftUICore.EmptyView, MySwiftUICore.Color, NotView).self)
        let impl = MySwiftUICore.TupleTypeDescription<ImplMyTupleDescriptor>(implTupleType)
        
        #expect(impl.contentTypes.count == 2)
        for (index, conformance) in impl.contentTypes {
            if index == 0 {
                #expect(type(of: conformance.type) == MySwiftUICore.EmptyView.Type.self)
            } else if index == 1 {
                #expect(type(of: conformance.type) == MySwiftUICore.Color.Type.self)
            }
        }
        
        let originalTupleType = TupleType((SwiftUI.EmptyView, SwiftUI.Color, NotView).self)
        let original = _SwiftUICorePrivate.TupleTypeDescription<OriginalMyTupleDescriptor>(originalTupleType)
        
        #expect(original.contentTypes.count == 2)
        for (index, conformance) in original.contentTypes {
            if index == 0 {
                #expect(type(of: conformance.type) == SwiftUI.EmptyView.Type.self)
            } else if index == 1 {
                #expect(type(of: conformance.type) == SwiftUI.Color.Type.self)
            }
        }
    }
}

fileprivate struct TupleDescriptorTests {
    @Test func test_tupleDescription() {
        let implTupleType = TupleType((MySwiftUICore.EmptyView, MySwiftUICore.Color, NotView).self)
        #expect(ImplMyTupleDescriptor.typeCache[ObjectIdentifier((MySwiftUICore.EmptyView, MySwiftUICore.Color, NotView).self)] == nil)
        _ = ImplMyTupleDescriptor.tupleDescription(implTupleType)
        #expect(ImplMyTupleDescriptor.typeCache[ObjectIdentifier((MySwiftUICore.EmptyView, MySwiftUICore.Color, NotView).self)] != nil)
        
        let originalTupleType = TupleType((SwiftUI.EmptyView, SwiftUI.Color, NotView).self)
        #expect(OriginalMyTupleDescriptor.typeCache[ObjectIdentifier((SwiftUI.EmptyView, SwiftUI.Color, NotView).self)] == nil)
        _ = OriginalMyTupleDescriptor.tupleDescription(originalTupleType)
        #expect(OriginalMyTupleDescriptor.typeCache[ObjectIdentifier((SwiftUI.EmptyView, SwiftUI.Color, NotView).self)] != nil)
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

fileprivate struct NotView {}
