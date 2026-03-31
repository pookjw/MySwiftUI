internal import Testing
@testable @_private(sourceFile: "Preferences.swift") private import MySwiftUICore
@testable @_private(sourceFile: "VersionSeed.swift") private import MySwiftUICore
private import _SwiftUICorePrivate
private import SwiftUI

private let nonEmptySeedArguments: [UInt32] = [
    1,
    2,
    0x1234_5678,
    0x9ABC_DEF0,
    .max
]

private let combineArguments: [(UInt32, UInt32, Int, Int)] = [
    (1, 2, 1, 1),
    (0x1234_5678, 0x9ABC_DEF0, 2, 1),
    (1, .max, 1, 2),
    (.max, 1, 2, 1)
]

fileprivate enum TestKey: CaseIterable {
    case key1
    case key2
    case key3
}

fileprivate typealias EntryInput = (key: TestKey, valueCount: Int, seed: UInt32)

struct PreferenceValuesTests {
    @Test
    func test_seed_empty() {
        let original = _SwiftUICorePrivate::PreferenceValues()
        let impl = MySwiftUICore.PreferenceValues()
        
        assertEquivalent(original: original, impl: impl)
    }
    
    @Test(arguments: nonEmptySeedArguments)
    func test_seed_afterSettingSingleKey(seed: UInt32) {
        for key in TestKey.allCases {
            let entries: [EntryInput] = [
                (key, 1, seed)
            ]
            let original = makeOriginalPreferenceValues(entries: entries)
            let impl = makeImplPreferenceValues(entries: entries)
            assertEquivalent(original: original, impl: impl)
        }
    }
    
    @Test(arguments: nonEmptySeedArguments)
    func test_seed_afterSettingMultipleKeys(seed: UInt32) {
        let entries: [EntryInput] = [
            (.key1, 1, seed),
            (.key2, 2, 0x1234_5678),
            (.key3, 3, .max)
        ]
        let original = makeOriginalPreferenceValues(entries: entries)
        let impl = makeImplPreferenceValues(entries: entries)
        
        assertEquivalent(original: original, impl: impl)
    }
    
    @Test
    func test_subscript_getter_defaultValue_allKeys() {
        let original = _SwiftUICorePrivate::PreferenceValues()
        let impl = MySwiftUICore.PreferenceValues()
        
        for key in TestKey.allCases {
            let originalValue = value(original: original, key: key)
            let implValue = value(impl: impl, key: key)
            
            #expect(originalValue.value.count == implValue.value.count)
            #expect(originalValue.seed.valueForTest == implValue.seed.value)
        }
    }
    
    @Test
    func test_subscript_setter_ignoresEmptySeed_allKeys() {
        var original = _SwiftUICorePrivate::PreferenceValues()
        var impl = MySwiftUICore.PreferenceValues()
        
        for (index, key) in TestKey.allCases.enumerated() {
            setValue(original: &original, key: key, valueCount: index &+ 1, seed: 0)
            setValue(impl: &impl, key: key, valueCount: index &+ 1, seed: 0)
        }
        
        assertEquivalent(original: original, impl: impl)
    }
    
    @Test(arguments: combineArguments)
    func test_subscript_setter_existingKey(
        firstSeed: UInt32,
        secondSeed: UInt32,
        firstCount: Int,
        secondCount: Int
    ) {
        for key in TestKey.allCases {
            var original = makeOriginalPreferenceValues(entries: [(key, firstCount, firstSeed)])
            var impl = makeImplPreferenceValues(entries: [(key, firstCount, firstSeed)])
            
            setValue(original: &original, key: key, valueCount: secondCount, seed: secondSeed)
            setValue(impl: &impl, key: key, valueCount: secondCount, seed: secondSeed)
            
            assertEquivalent(original: original, impl: impl)
        }
    }
    
    @Test(arguments: nonEmptySeedArguments)
    func test_combine_withEmptyOther(seed: UInt32) {
        let entries: [EntryInput] = [
            (.key1, 1, seed),
            (.key2, 2, 0x1234_5678),
            (.key3, 3, .max)
        ]
        
        var original = makeOriginalPreferenceValues(entries: entries)
        var impl = makeImplPreferenceValues(entries: entries)
        
        original.combine(with: .init())
        impl.combine(with: .init())
        
        assertEquivalent(original: original, impl: impl)
    }
    
    @Test(arguments: nonEmptySeedArguments)
    func test_combine_emptySelfCopiesOther(seed: UInt32) {
        let otherEntries: [EntryInput] = [
            (.key1, 2, seed),
            (.key2, 1, 0x1234_5678),
            (.key3, 3, .max)
        ]
        
        var original = _SwiftUICorePrivate::PreferenceValues()
        let originalOther = makeOriginalPreferenceValues(entries: otherEntries)
        
        var impl = MySwiftUICore.PreferenceValues()
        let implOther = makeImplPreferenceValues(entries: otherEntries)
        
        original.combine(with: originalOther)
        impl.combine(with: implOther)
        
        assertEquivalent(original: original, impl: impl)
    }
    
    @Test(arguments: combineArguments)
    func test_combine_sameKey(
        lhsSeed: UInt32,
        rhsSeed: UInt32,
        lhsCount: Int,
        rhsCount: Int
    ) {
        for key in TestKey.allCases {
            var original = makeOriginalPreferenceValues(entries: [(key, lhsCount, lhsSeed)])
            let originalOther = makeOriginalPreferenceValues(entries: [(key, rhsCount, rhsSeed)])
            
            var impl = makeImplPreferenceValues(entries: [(key, lhsCount, lhsSeed)])
            let implOther = makeImplPreferenceValues(entries: [(key, rhsCount, rhsSeed)])
            
            original.combine(with: originalOther)
            impl.combine(with: implOther)
            
            assertEquivalent(original: original, impl: impl)
        }
    }
    
    @Test
    func test_combine_disjointKeys_allPairs() {
        for lhsKey in TestKey.allCases {
            for rhsKey in TestKey.allCases where lhsKey != rhsKey {
                var original = makeOriginalPreferenceValues(entries: [(lhsKey, 1, 1)])
                let originalOther = makeOriginalPreferenceValues(entries: [(rhsKey, 2, 2)])
                
                var impl = makeImplPreferenceValues(entries: [(lhsKey, 1, 1)])
                let implOther = makeImplPreferenceValues(entries: [(rhsKey, 2, 2)])
                
                original.combine(with: originalOther)
                impl.combine(with: implOther)
                
                assertEquivalent(original: original, impl: impl)
            }
        }
    }
    
    @Test
    func test_combine_overlapAndDisjointKeys() {
        let lhsEntries: [EntryInput] = [
            (.key1, 1, 0x1111_1111),
            (.key2, 2, 0x2222_2222)
        ]
        let rhsEntries: [EntryInput] = [
            (.key2, 3, 0x3333_3333),
            (.key3, 4, 0x4444_4444)
        ]
        
        var original = makeOriginalPreferenceValues(entries: lhsEntries)
        let originalOther = makeOriginalPreferenceValues(entries: rhsEntries)
        
        var impl = makeImplPreferenceValues(entries: lhsEntries)
        let implOther = makeImplPreferenceValues(entries: rhsEntries)
        
        original.combine(with: originalOther)
        impl.combine(with: implOther)
        
        assertEquivalent(original: original, impl: impl)
    }
}

fileprivate func makeOriginalPreferenceValues(entries: [EntryInput]) -> _SwiftUICorePrivate::PreferenceValues {
    var values = _SwiftUICorePrivate::PreferenceValues()
    
    for entry in entries {
        setValue(
            original: &values,
            key: entry.key,
            valueCount: entry.valueCount,
            seed: entry.seed
        )
    }
    
    return values
}

fileprivate func makeImplPreferenceValues(entries: [EntryInput]) -> MySwiftUICore.PreferenceValues {
    var values = MySwiftUICore.PreferenceValues()
    
    for entry in entries {
        setValue(
            impl: &values,
            key: entry.key,
            valueCount: entry.valueCount,
            seed: entry.seed
        )
    }
    
    return values
}

fileprivate func setValue(
    original values: inout _SwiftUICorePrivate::PreferenceValues,
    key: TestKey,
    valueCount: Int,
    seed: UInt32
) {
    let value = makeValues(count: valueCount)
    let seedValue = _SwiftUICorePrivate::VersionSeed(value: seed)
    
    switch key {
    case .key1:
        values[MyOriginalKey1.self] = .init(value: value, seed: seedValue)
    case .key2:
        values[MyOriginalKey2.self] = .init(value: value, seed: seedValue)
    case .key3:
        values[MyOriginalKey3.self] = .init(value: value, seed: seedValue)
    }
}

fileprivate func setValue(
    impl values: inout MySwiftUICore.PreferenceValues,
    key: TestKey,
    valueCount: Int,
    seed: UInt32
) {
    let value = makeValues(count: valueCount)
    let seedValue = MySwiftUICore.VersionSeed(value: seed)
    
    switch key {
    case .key1:
        values[MyImplKey1.self] = .init(value: value, seed: seedValue)
    case .key2:
        values[MyImplKey2.self] = .init(value: value, seed: seedValue)
    case .key3:
        values[MyImplKey3.self] = .init(value: value, seed: seedValue)
    }
}

fileprivate func value(
    original values: _SwiftUICorePrivate::PreferenceValues,
    key: TestKey
) -> _SwiftUICorePrivate::PreferenceValues.Value<[Int]> {
    switch key {
    case .key1:
        return values[MyOriginalKey1.self]
    case .key2:
        return values[MyOriginalKey2.self]
    case .key3:
        return values[MyOriginalKey3.self]
    }
}

fileprivate func value(
    impl values: MySwiftUICore.PreferenceValues,
    key: TestKey
) -> MySwiftUICore.PreferenceValues.Value<[Int]> {
    switch key {
    case .key1:
        return values[MyImplKey1.self]
    case .key2:
        return values[MyImplKey2.self]
    case .key3:
        return values[MyImplKey3.self]
    }
}

fileprivate func makeValues(count: Int) -> [Int] {
    return Array(0..<count)
}

fileprivate struct KeySnapshot: Equatable {
    var valueCount: Int
    var seed: UInt32
}

fileprivate struct PreferenceValuesSnapshot: Equatable {
    var seed: UInt32
    var entriesCount: Int
    var key1: KeySnapshot
    var key2: KeySnapshot
    var key3: KeySnapshot
}

fileprivate func assertEquivalent(
    original: _SwiftUICorePrivate::PreferenceValues,
    impl: MySwiftUICore.PreferenceValues
) {
    #expect(snapshot(original: original) == snapshot(impl: impl))
}

fileprivate func snapshot(original: _SwiftUICorePrivate::PreferenceValues) -> PreferenceValuesSnapshot {
    return PreferenceValuesSnapshot(
        seed: original.seed.valueForTest,
        entriesCount: original.entriesCountForTest,
        key1: keySnapshot(original: original, key: .key1),
        key2: keySnapshot(original: original, key: .key2),
        key3: keySnapshot(original: original, key: .key3)
    )
}

fileprivate func snapshot(impl: MySwiftUICore.PreferenceValues) -> PreferenceValuesSnapshot {
    return PreferenceValuesSnapshot(
        seed: impl.seed.value,
        entriesCount: impl.entries.count,
        key1: keySnapshot(impl: impl, key: .key1),
        key2: keySnapshot(impl: impl, key: .key2),
        key3: keySnapshot(impl: impl, key: .key3)
    )
}

fileprivate func keySnapshot(
    original values: _SwiftUICorePrivate::PreferenceValues,
    key: TestKey
) -> KeySnapshot {
    let entry = value(original: values, key: key)
    return KeySnapshot(valueCount: entry.value.count, seed: entry.seed.valueForTest)
}

fileprivate func keySnapshot(
    impl values: MySwiftUICore.PreferenceValues,
    key: TestKey
) -> KeySnapshot {
    let entry = value(impl: values, key: key)
    return KeySnapshot(valueCount: entry.value.count, seed: entry.seed.value)
}

fileprivate struct MyOriginalKey1: SwiftUI::PreferenceKey {
    fileprivate static var defaultValue: [Int] {
        return []
    }
    
    fileprivate static func reduce(value: inout [Int], nextValue: () -> [Int]) {
        value.append(contentsOf: nextValue())
    }
}

fileprivate struct MyOriginalKey2: SwiftUI::PreferenceKey {
    fileprivate static var defaultValue: [Int] {
        return []
    }
    
    fileprivate static func reduce(value: inout [Int], nextValue: () -> [Int]) {
        value.append(contentsOf: nextValue())
    }
}

fileprivate struct MyOriginalKey3: SwiftUI::PreferenceKey {
    fileprivate static var defaultValue: [Int] {
        return []
    }
    
    fileprivate static func reduce(value: inout [Int], nextValue: () -> [Int]) {
        value.append(contentsOf: nextValue())
    }
}

fileprivate struct MyImplKey1: MySwiftUICore.PreferenceKey {
    fileprivate static var defaultValue: [Int] {
        return []
    }
    
    fileprivate static func reduce(value: inout [Int], nextValue: () -> [Int]) {
        value.append(contentsOf: nextValue())
    }
}

fileprivate struct MyImplKey2: MySwiftUICore.PreferenceKey {
    fileprivate static var defaultValue: [Int] {
        return []
    }
    
    fileprivate static func reduce(value: inout [Int], nextValue: () -> [Int]) {
        value.append(contentsOf: nextValue())
    }
}

fileprivate struct MyImplKey3: MySwiftUICore.PreferenceKey {
    fileprivate static var defaultValue: [Int] {
        return []
    }
    
    fileprivate static func reduce(value: inout [Int], nextValue: () -> [Int]) {
        value.append(contentsOf: nextValue())
    }
}

extension _SwiftUICorePrivate::PreferenceValues {
    fileprivate var entriesCountForTest: Int {
        return (Mirror(reflecting: self).descendant("entries") as! [Any]).count
    }
}

extension _SwiftUICorePrivate::VersionSeed {
    fileprivate var valueForTest: UInt32 {
        return Mirror(reflecting: self).descendant("value") as! UInt32
    }
}
