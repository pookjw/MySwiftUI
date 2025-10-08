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
    
    @Test func test_getAndSet() {
        var propertyList = PropertyList()
        #expect(propertyList[MyPropertyKey_1.self] == 1)
        #expect(propertyList[MyPropertyKey_2.self] == 2)
        #expect(propertyList[MyPropertyKey_3.self] == 3)
        
        propertyList[MyPropertyKey_1.self] = 10
        #expect(propertyList[MyPropertyKey_1.self] == 10)
        
        propertyList[MyPropertyKey_2.self] = 20
        #expect(propertyList[MyPropertyKey_2.self] == 20)
        
        propertyList[MyPropertyKey_2.self] = 200
        #expect(propertyList[MyPropertyKey_2.self] == 200)
        
        propertyList[MyPropertyKey_3.self] = 30
        #expect(propertyList[MyPropertyKey_3.self] == 30)
    }
    
    @Test func test_merge() {
        var propertyList_1 = PropertyList()
        var propertyList_2 = PropertyList()
        
        propertyList_1[MyPropertyKey_1.self] = 10
        propertyList_1[MyPropertyKey_3.self] = 30
        
        propertyList_2[MyPropertyKey_1.self] = 100
        propertyList_2[MyPropertyKey_2.self] = 20
        
        propertyList_1.merge(propertyList_2)
        
        #expect(propertyList_1[MyPropertyKey_1.self] == 100)
        #expect(propertyList_1[MyPropertyKey_2.self] == 20)
        #expect(propertyList_1[MyPropertyKey_3.self] == 30)
    }
}

fileprivate struct MyPropertyKey_1: PropertyKey {
    static let defaultValue: Int = 1
}

fileprivate struct MyPropertyKey_2: PropertyKey {
    static let defaultValue: Int = 2
}

fileprivate struct MyPropertyKey_3: PropertyKey {
    static let defaultValue: Int = 3
}
