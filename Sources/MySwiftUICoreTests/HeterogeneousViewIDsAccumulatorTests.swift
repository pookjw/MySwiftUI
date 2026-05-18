internal import Testing
@testable private import MySwiftUICore
private import _SwiftUICorePrivate

struct HeterogeneousViewIDsAccumulatorTests {
    @Test func test_finalize() {
        var original = _SwiftUICorePrivate::HeterogeneousViewIDsAccumulator()
        
        let values: ContiguousArray<Int> = [0, 1, 2]
        original.append(contentsOf: values)
        
        let viewIDs = original.finalize()
        fatalError()
    }
    
    @Test func test_count() {
        var original = _SwiftUICorePrivate::HeterogeneousViewIDsAccumulator()
        var impl = MySwiftUICore::HeterogeneousViewIDsAccumulator()
        
        #expect(original.count == 0)
        #expect(impl.count == 0)
        
        let values_1: ContiguousArray<Int> = [0, 1, 2]
        original.append(contentsOf: values_1)
        impl.append(contentsOf: values_1)
        
        #expect(original.count == 3)
        #expect(impl.count == 3)
        
        let values_2: ContiguousArray<String> = ["A", "B"]
        original.append(contentsOf: values_2)
        impl.append(contentsOf: values_2)
        
        #expect(original.count == 5)
        #expect(impl.count == 5)
        
        original.withBuffer(of: Int.self) { _ in }
        impl.withBuffer(of: Int.self) { _ in }
        
        #expect(original.count == 5)
        #expect(impl.count == 5)
    }
    
    @Test func test_isEmpty() {
        var original = _SwiftUICorePrivate::HeterogeneousViewIDsAccumulator()
        var impl = MySwiftUICore::HeterogeneousViewIDsAccumulator()
        
        #expect(original.isEmpty)
        #expect(impl.isEmpty)
        
        let values_1: ContiguousArray<Int> = [0, 1, 2]
        original.append(contentsOf: values_1)
        impl.append(contentsOf: values_1)
        
        #expect(!original.isEmpty)
        #expect(!impl.isEmpty)
        
        let values_2: ContiguousArray<String> = ["A", "B"]
        original.append(contentsOf: values_2)
        impl.append(contentsOf: values_2)
        
        #expect(!original.isEmpty)
        #expect(!impl.isEmpty)
        
        original.withBuffer(of: Int.self) { _ in }
        impl.withBuffer(of: Int.self) { _ in }
        
        #expect(!original.isEmpty)
        #expect(!impl.isEmpty)
    }
    
    @Test func test_append_contentsOf_() {
        var original = _SwiftUICorePrivate::HeterogeneousViewIDsAccumulator()
        var impl = MySwiftUICore::HeterogeneousViewIDsAccumulator()
        
        do {
            let values: ContiguousArray<Int> = [0, 1, 2]
            original.append(contentsOf: values)
            impl.append(contentsOf: values)
            
            original.withBuffer(of: Int.self) { array in
                #expect(array == [0, 1, 2])
            }
            impl.withBuffer(of: Int.self) { array in
                #expect(array == [0, 1, 2])
            }
        }
        
        do {
            let values: ContiguousArray<Int> = [3, 4, 5]
            original.append(contentsOf: values)
            impl.append(contentsOf: values)
            
            original.withBuffer(of: Int.self) { array in
                #expect(array == [0, 1, 2, 3, 4, 5])
            }
            impl.withBuffer(of: Int.self) { array in
                #expect(array == [0, 1, 2, 3, 4, 5])
            }
        }
        
        do {
            let values: ContiguousArray<String> = ["A", "B", "C"]
            original.append(contentsOf: values)
            impl.append(contentsOf: values)
            
            original.withBuffer(of: String.self) { array in
                #expect(array == ["A", "B", "C"])
            }
            impl.withBuffer(of: String.self) { array in
                #expect(array == ["A", "B", "C"])
            }
            
            original.withBuffer(of: Int.self) { array in
                #expect(array == [])
            }
            impl.withBuffer(of: Int.self) { array in
                #expect(array == [])
            }
            
            original.withBuffer(of: String.self) { array in
                #expect(array == [])
            }
            impl.withBuffer(of: String.self) { array in
                #expect(array == [])
            }
        }
    }
}
