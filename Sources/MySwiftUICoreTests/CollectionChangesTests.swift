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
    
    @Test(
        arguments: [
            ([], []),
            ([], [0, 1, 2]),
            ([0, 1, 2], []),
            ([0, 1, 2], [0, 1, 2]),
            ([0, 1, 2], [2, 1, 0]),
            ([0, 1, 2], [1, 2, 3, 4]),
            ([0, 1, 2], [3, 4]),
            ([0, 1, 2], [1, 3, 2, 5, 4, 2]),
            ([1, 1, 2], [1, 2, 2, 1]),
            ([5, 5, 5], [5]),
            ([-2, -1, 0, 1], [-1, 0, 2])
        ]
    )
    func test_init_from_to(from: [Int], to: [Int]) async throws {
        let impl = MySwiftUICore.CollectionChanges(from: from, to: to)
        let original = _SwiftUICorePrivate.CollectionChanges(from: from, to: to)
        
        #expect(isEqual(impl: impl, original: original))
    }
}

extension _SwiftUICorePrivate.CollectionChanges {
    fileprivate var changes: [_SwiftUICorePrivate.CollectionChanges<A, B>.Element] {
        return Mirror(reflecting: self).descendant("changes") as! [_SwiftUICorePrivate.CollectionChanges<A, B>.Element]
    }
}

fileprivate func isEqual<A: Comparable, B: Comparable>(
    impl: MySwiftUICore.CollectionChanges<A, B>,
    original: _SwiftUICorePrivate.CollectionChanges<A, B>
) -> Bool {
    let indices = impl.changes.indices
    
    guard original.changes.indices == indices else {
        return false
    }
    
    for index in indices {
        let implElement = impl.changes[index]
        let originalElement = original.changes[index]
        
        guard isEqual(impl: implElement, original: originalElement) else {
            return false
        }
    }
    
    return true
}

fileprivate func isEqual<A: Comparable, B: Comparable>(
    impl: MySwiftUICore.CollectionChanges<A, B>.Element,
    original: _SwiftUICorePrivate.CollectionChanges<A, B>.Element
) -> Bool {
    switch (impl, original) {
    case (.removed(let a), .removed(let b)):
        return a == b
    case (.inserted(let a), .inserted(let b)):
        return a == b
    case (.matched(let a, let b), .matched(let c, let d)):
        return a == c && b == d
    default:
        return false
    }
}
