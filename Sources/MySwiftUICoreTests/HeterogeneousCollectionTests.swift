internal import Testing
@testable @_private(sourceFile: "HeterogeneousCollection.swift") private import MySwiftUICore
private import _SwiftUICorePrivate

struct HeterogeneousCollectionTests {
    @Test func test_init() {
        do {
            let original = _SwiftUICorePrivate::HeterogeneousCollection([])
            let impl = MySwiftUICore::HeterogeneousCollection([])
            
            #expect(original.count == impl.count)
        }
    }
}

fileprivate final class OriginalCollection : _SwiftUICorePrivate::AbstractHomogeneousCollection {
}

fileprivate final class ImplCollection : MySwiftUICore::AbstractHomogeneousCollection {
}
