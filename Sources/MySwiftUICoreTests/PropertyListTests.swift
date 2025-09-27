internal import Testing
@_private(sourceFile: "PropertyList.swift") @testable private import MySwiftUICore

struct PropertyListTests {
    @Test func test_find1() throws {
        let element = TypedElement<MyPropertyKey_1>(
            value: 1,
            before: TypedElement<MyPropertyKey_2>(
                value: 2,
                before: TypedElement<MyPropertyKey_1>(
                    value: 1,
                    before: nil,
                    after: TypedElement<MyPropertyKey_1>(
                        value: 1,
                        before: TypedElement<MyPropertyKey_2>(
                            value: 2,
                            before: nil,
                            after: nil
                        ),
                        after: nil
                    ),
                ),
                after: nil
            ),
            after: TypedElement<MyPropertyKey_2>(
                value: 2,
                before: TypedElement<MyPropertyKey_1>(
                    value: 1,
                    before: nil,
                    after: TypedElement<MyPropertyKey_1>(
                        value: 1,
                        before: TypedElement<MyPropertyKey_2>(
                            value: 2,
                            before: nil,
                            after: nil
                        ),
                        after: TypedElement<MyPropertyKey_3>(
                            value: 3,
                            before: TypedElement<MyPropertyKey_2>(
                                value: 2,
                                before: nil,
                                after: nil
                            ),
                            after: TypedElement<MyPropertyKey_1>(
                                value: 1,
                                before: nil,
                                after: nil
                            )
                        )
                    ),
                ),
                after: nil
            )
        )
        
        do {
            let result = find1(.passUnretained(element), key: MyPropertyKey_3.self, filter: BloomFilter())
            let unwrapped = try #require(result).takeUnretainedValue()
            #expect(unwrapped.value == 3)
        }
    }
}

fileprivate struct MyPropertyKey_1: PropertyKey {
    static let defaultValue: Int = 0
}

fileprivate struct MyPropertyKey_2: PropertyKey {
    static let defaultValue: Int = 0
}

fileprivate struct MyPropertyKey_3: PropertyKey {
    static let defaultValue: Int = 0
}
