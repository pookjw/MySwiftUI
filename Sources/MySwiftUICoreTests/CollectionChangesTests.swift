internal import Testing
@testable @_private(sourceFile: "CollectionChanges.swift") private import MySwiftUICore
private import _SwiftUICorePrivate

private let fromToArguments: [([Int], [Int])] = [
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

struct CollectionChangesTests {
    @Test func test_init() {
        let impl = MySwiftUICore.CollectionChanges<Int, Int>()
        let original = _SwiftUICorePrivate.CollectionChanges<Int, Int>()
        
        #expect(normalizedChanges(impl: impl).isEmpty)
        #expect(normalizedChanges(original: original).isEmpty)
        #expect(impl.startIndex == original.startIndex)
        #expect(impl.endIndex == original.endIndex)
    }
    
    @Test(arguments: fromToArguments)
    func test_init_from_to(from: [Int], to: [Int]) {
        let impl = MySwiftUICore.CollectionChanges(from: from, to: to)
        let original = _SwiftUICorePrivate.CollectionChanges(from: from, to: to)
        
        #expect(normalizedChanges(impl: impl) == normalizedChanges(original: original))
    }
    
    @Test(arguments: fromToArguments)
    func test_collection_conformance_from_to(from: [Int], to: [Int]) {
        let impl = MySwiftUICore.CollectionChanges(from: from, to: to)
        let original = _SwiftUICorePrivate.CollectionChanges(from: from, to: to)
        
        #expect(impl.startIndex == original.startIndex)
        #expect(impl.endIndex == original.endIndex)
        
        let implForward = normalizedForwardIteration(impl: impl)
        let originalForward = normalizedForwardIteration(original: original)
        #expect(implForward == originalForward)
        
        let implBackward = normalizedBackwardIteration(impl: impl)
        let originalBackward = normalizedBackwardIteration(original: original)
        #expect(implBackward == originalBackward)
        #expect(implBackward == Array(implForward.reversed()))
        #expect(originalBackward == Array(originalForward.reversed()))
    }
    
    @Test(arguments: fromToArguments)
    func test_removed_inserted_matched_sequences_from_to(from: [Int], to: [Int]) {
        let impl = MySwiftUICore.CollectionChanges(from: from, to: to)
        let original = _SwiftUICorePrivate.CollectionChanges(from: from, to: to)
        
        let implChanges = normalizedChanges(impl: impl)
        let originalChanges = normalizedChanges(original: original)
        
        #expect(removedRanges(from: implChanges) == removedRanges(from: originalChanges))
        #expect(insertedRanges(from: implChanges) == insertedRanges(from: originalChanges))
        #expect(matchedRanges(from: implChanges) == matchedRanges(from: originalChanges))
    }
}

extension _SwiftUICorePrivate.CollectionChanges {
    fileprivate var changes: [_SwiftUICorePrivate.CollectionChanges<A, B>.Element] {
        return Mirror(reflecting: self).descendant("changes") as! [_SwiftUICorePrivate.CollectionChanges<A, B>.Element]
    }
}

fileprivate enum NormalizedChange<A: Comparable, B: Comparable>: Equatable {
    case removed(Range<A>)
    case inserted(Range<B>)
    case matched(Range<A>, Range<B>)
}

fileprivate struct NormalizedMatch<A: Comparable, B: Comparable>: Equatable {
    let from: Range<A>
    let to: Range<B>
}

fileprivate func normalizedChanges<A: Comparable, B: Comparable>(
    impl: MySwiftUICore.CollectionChanges<A, B>
) -> [NormalizedChange<A, B>] {
    return impl.changes.map { normalize($0) }
}

fileprivate func normalizedChanges<A: Comparable, B: Comparable>(
    original: _SwiftUICorePrivate.CollectionChanges<A, B>
) -> [NormalizedChange<A, B>] {
    return original.changes.map { normalize($0) }
}

fileprivate func normalizedForwardIteration<A: Comparable, B: Comparable>(
    impl: MySwiftUICore.CollectionChanges<A, B>
) -> [NormalizedChange<A, B>] {
    var index = impl.startIndex
    var result: [NormalizedChange<A, B>] = []
    while index < impl.endIndex {
        result.append(normalize(impl[index]))
        index = impl.index(after: index)
    }
    
    return result
}

fileprivate func normalizedForwardIteration<A: Comparable, B: Comparable>(
    original: _SwiftUICorePrivate.CollectionChanges<A, B>
) -> [NormalizedChange<A, B>] {
    var index = original.startIndex
    var result: [NormalizedChange<A, B>] = []
    while index < original.endIndex {
        result.append(normalize(original[index]))
        index = original.index(after: index)
    }
    
    return result
}

fileprivate func normalizedBackwardIteration<A: Comparable, B: Comparable>(
    impl: MySwiftUICore.CollectionChanges<A, B>
) -> [NormalizedChange<A, B>] {
    guard impl.startIndex < impl.endIndex else {
        return []
    }
    
    var index = impl.endIndex
    var result: [NormalizedChange<A, B>] = []
    while index > impl.startIndex {
        index = impl.index(before: index)
        result.append(normalize(impl[index]))
    }
    
    return result
}

fileprivate func normalizedBackwardIteration<A: Comparable, B: Comparable>(
    original: _SwiftUICorePrivate.CollectionChanges<A, B>
) -> [NormalizedChange<A, B>] {
    guard original.startIndex < original.endIndex else {
        return []
    }
    
    var index = original.endIndex
    var result: [NormalizedChange<A, B>] = []
    while index > original.startIndex {
        index = original.index(before: index)
        result.append(normalize(original[index]))
    }
    
    return result
}

fileprivate func removedRanges<A: Comparable, B: Comparable>(
    from changes: [NormalizedChange<A, B>]
) -> [Range<A>] {
    return changes.compactMap { change in
        switch change {
        case .removed(let range):
            return range
        default:
            return nil
        }
    }
}

fileprivate func insertedRanges<A: Comparable, B: Comparable>(
    from changes: [NormalizedChange<A, B>]
) -> [Range<B>] {
    return changes.compactMap { change in
        switch change {
        case .inserted(let range):
            return range
        default:
            return nil
        }
    }
}

fileprivate func matchedRanges<A: Comparable, B: Comparable>(
    from changes: [NormalizedChange<A, B>]
) -> [NormalizedMatch<A, B>] {
    return changes.compactMap { change in
        switch change {
        case .matched(let lhs, let rhs):
            return NormalizedMatch(from: lhs, to: rhs)
        default:
            return nil
        }
    }
}

fileprivate func normalize<A: Comparable, B: Comparable>(
    _ element: MySwiftUICore.CollectionChanges<A, B>.Element
) -> NormalizedChange<A, B> {
    switch element {
    case .removed(let range):
        return .removed(range)
    case .inserted(let range):
        return .inserted(range)
    case .matched(let lhs, let rhs):
        return .matched(lhs, rhs)
    }
}

fileprivate func normalize<A: Comparable, B: Comparable>(
    _ element: _SwiftUICorePrivate.CollectionChanges<A, B>.Element
) -> NormalizedChange<A, B> {
    switch element {
    case .removed(let range):
        return .removed(range)
    case .inserted(let range):
        return .inserted(range)
    case .matched(let lhs, let rhs):
        return .matched(lhs, rhs)
    @unknown default:
        fatalError("Unknown _SwiftUICorePrivate.CollectionChanges.Element")
    }
}
