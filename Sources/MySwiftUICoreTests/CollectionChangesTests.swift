internal import Testing
@testable @_private(sourceFile: "CollectionChanges.swift") private import MySwiftUICore
private import _SwiftUICorePrivate

struct CollectionChangesTests {
    @Test func test_init() {
        let original = _SwiftUICorePrivate.CollectionChanges<Int, Int>()
        #expect(original.changes.isEmpty)
        
        let impl = MySwiftUICore.CollectionChanges<Int, Int>()
        #expect(impl.changes.isEmpty)
    }
    
    @Test func test_init_from_to() async throws {
        let from = [0, 1, 2]
        let to = [1, 2, 3]
        
        let original = _SwiftUICorePrivate.CollectionChanges(from: from, to: to)
        #expect(!original.changes.isEmpty)
        
        fatalError("TODO")
    }
}

extension _SwiftUICorePrivate.CollectionChanges {
    fileprivate var changes: [_SwiftUICorePrivate.CollectionChanges<A, B>.Element] {
        return Mirror(reflecting: self).descendant("changes") as! [_SwiftUICorePrivate.CollectionChanges<A, B>.Element]
    }
}
