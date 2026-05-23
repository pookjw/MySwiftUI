internal import Testing
@testable @_private(sourceFile: "HeterogeneousViewIDsAccumulator.swift") private import MySwiftUICore
private import _SwiftUICorePrivate

struct HeterogeneousViewIDsAccumulatorTests {
    @Test func test_finalize() {
        do {
            var original = _SwiftUICorePrivate::HeterogeneousViewIDsAccumulator()
            var impl = MySwiftUICore::HeterogeneousViewIDsAccumulator()
            
            let values: ContiguousArray<Int> = [0, 1, 2]
            original.append(contentsOf: values)
            impl.append(contentsOf: values)
            
            let original_viewIDs = original.finalize()
            let impl_viewIDs = original.finalize()
            
            #expect(original_viewIDs.count == impl_viewIDs.count)
        }
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
    
    @Test func test_withExplicitID_() {
        var original = _SwiftUICorePrivate::HeterogeneousViewIDsAccumulator()
        var impl = MySwiftUICore::HeterogeneousViewIDsAccumulator()
        var called = false
        
        original.withExplicitID(3, isUnary: true) { original in
            impl.withExplicitID(3, isUnary: true) { impl in
                #expect(original.currentExplicitID?.0 as? Int == 3)
                #expect(original.currentExplicitID?.1 == true)
                
                #expect(impl.currentExplicitID?.0 as? Int == 3)
                #expect(impl.currentExplicitID?.1 == true)
                
                called = true
            }
        }
        
        #expect(called)
        #expect(original.currentExplicitID == nil)
        #expect(impl.currentExplicitID == nil)
    }
    
    @Test func test_append_index_implicitID_explicitID_() {
        var original = _SwiftUICorePrivate::HeterogeneousViewIDsAccumulator()
        var impl = MySwiftUICore::HeterogeneousViewIDsAccumulator()
        
        original.append(index: 0, implicitID: 1, explicitID: 2)
        impl.append(index: 0, implicitID: 1, explicitID: 2)
        
        original.withBuffer(of: _SwiftUICorePrivate::TypedCanonicalViewID<Int>.self) { array in
            #expect(array[0].index == 0)
            #expect(array[0].implicitID == 1)
            #expect(array[0].explicitID == 2)
        }
        
        impl.withBuffer(of: MySwiftUICore::TypedCanonicalViewID<Int>.self) { array in
            #expect(array[0].index == 0)
            #expect(array[0].implicitID == 1)
            #expect(array[0].explicitID == 2)
        }
        
        original.append(index: 0, implicitID: -1, explicitID: 4)
        impl.append(index: 0, implicitID: -1, explicitID: 4)
        
        original.withBuffer(of: Int.self) { array in
            #expect(array[0] == 4)
        }
        
        impl.withBuffer(of: Int.self) { array in
            #expect(array[0] == 4)
        }
    }
    
    @Test func test_append_index_implicitID_() {
        var original = _SwiftUICorePrivate::HeterogeneousViewIDsAccumulator()
        var impl = MySwiftUICore::HeterogeneousViewIDsAccumulator()
        
        original.append(index: 0, implicitID: 1)
        impl.append(index: 0, implicitID: 1)
        
        #expect(original.count == 1)
        #expect(impl.count == 1)
        
        original.append(index: 1, implicitID: 2)
        impl.append(index: 1, implicitID: 2)
        
        #expect(original.count == 2)
        #expect(impl.count == 2)
    }
    
    @Test func test_appendWithUnsafeOutputBuffer() {
        var original = _SwiftUICorePrivate::HeterogeneousViewIDsAccumulator()
        var impl = MySwiftUICore::HeterogeneousViewIDsAccumulator()
        
        original.appendWithUnsafeOutputBuffer(explicitID: Int.self, count: 3) { buffer in
            buffer.initialize(at: 0, index: 0, implicitID: 1, explicitID: 2)
            buffer.initialize(at: 1, index: 1, implicitID: 3, explicitID: 4)
            buffer.initialize(at: 2, index: 2, implicitID: 5, explicitID: 6)
        }
        
        unsafe impl.appendWithUnsafeOutputBuffer(explicitID: Int.self, count: 3) { buffer in
            unsafe buffer.initialize(at: 0, index: 0, implicitID: 1, explicitID: 2)
            unsafe buffer.initialize(at: 1, index: 1, implicitID: 3, explicitID: 4)
            unsafe buffer.initialize(at: 2, index: 2, implicitID: 5, explicitID: 6)
        }
        
        var called = false
        
        original.withBuffer(of: _SwiftUICorePrivate::TypedCanonicalViewID<Int>.self) { array in
            #expect(array[0].index == 0)
            #expect(array[0].implicitID == 1)
            #expect(array[0].explicitID == 2)
            
            #expect(array[1].index == 1)
            #expect(array[1].implicitID == 3)
            #expect(array[1].explicitID == 4)
            
            #expect(array[2].index == 2)
            #expect(array[2].implicitID == 5)
            #expect(array[2].explicitID == 6)
            
            called = true
        }
        
        #expect(called)
        called = false
        
        impl.withBuffer(of: MySwiftUICore::TypedCanonicalViewID<Int>.self) { array in
            #expect(array[0].index == 0)
            #expect(array[0].implicitID == 1)
            #expect(array[0].explicitID == 2)
            
            #expect(array[1].index == 1)
            #expect(array[1].implicitID == 3)
            #expect(array[1].explicitID == 4)
            
            #expect(array[2].index == 2)
            #expect(array[2].implicitID == 5)
            #expect(array[2].explicitID == 6)
            
            called = true
        }
        
        #expect(called)
    }
    
    @Test func test_appendWithoutExplicitID() {
//        do {
//            var original = _SwiftUICorePrivate::HeterogeneousViewIDsAccumulator()
//            var impl = MySwiftUICore::HeterogeneousViewIDsAccumulator()
//            
//            original.appendWithoutExplicitID(indices: 2..<5, implicitID: 11)
//            impl.appendWithoutExplicitID(indices: 2..<5, implicitID: 11)
//            
//            let expected: [(index: Int32, implicitID: Int32)] = [
//                (2, 11),
//                (3, 11),
//                (4, 11),
//            ]
//            
//            #expect(original.count == expected.count)
//            #expect(impl.count == expected.count)
//            
//            impl.withBuffer(of: MySwiftUICore::TypedCanonicalViewID<MySwiftUICore::Nil>.self) { array in
//                #expect(array.count == expected.count)
//                
//                for offset in 0..<min(array.count, expected.count) {
//                    #expect(array[offset].index == expected[offset].index)
//                    #expect(array[offset].implicitID == expected[offset].implicitID)
//                    #expect(array[offset].explicitID == nil)
//                }
//            }
//        }
//        
//        do {
//            var original = _SwiftUICorePrivate::HeterogeneousViewIDsAccumulator()
//            var impl = MySwiftUICore::HeterogeneousViewIDsAccumulator()
//            
//            original.appendWithoutExplicitID(indices: 4..<4, implicitID: 11)
//            impl.appendWithoutExplicitID(indices: 4..<4, implicitID: 11)
//            
//            #expect(original.count == 0)
//            #expect(impl.count == 0)
//            #expect(original.isEmpty)
//            #expect(impl.isEmpty)
//            
//            impl.withBuffer(of: MySwiftUICore::TypedCanonicalViewID<MySwiftUICore::Nil>.self) { array in
//                #expect(array.isEmpty)
//            }
//        }
//        
//        do {
//            var original = _SwiftUICorePrivate::HeterogeneousViewIDsAccumulator()
//            var impl = MySwiftUICore::HeterogeneousViewIDsAccumulator()
//            
//            original.append(index: 0, implicitID: 1)
//            impl.append(index: 0, implicitID: 1)
//            
//            original.appendWithoutExplicitID(indices: 3..<6, implicitID: 9)
//            impl.appendWithoutExplicitID(indices: 3..<6, implicitID: 9)
//            
//            let expected: [(index: Int32, implicitID: Int32)] = [
//                (0, 1),
//                (3, 9),
//                (4, 9),
//                (5, 9),
//            ]
//            
//            #expect(original.count == expected.count)
//            #expect(impl.count == expected.count)
//            
//            impl.withBuffer(of: MySwiftUICore::TypedCanonicalViewID<MySwiftUICore::Nil>.self) { array in
//                #expect(array.count == expected.count)
//                
//                for offset in 0..<min(array.count, expected.count) {
//                    #expect(array[offset].index == expected[offset].index)
//                    #expect(array[offset].implicitID == expected[offset].implicitID)
//                    #expect(array[offset].explicitID == nil)
//                }
//            }
//        }
        
        do {
            var original = _SwiftUICorePrivate::HeterogeneousViewIDsAccumulator()
            var impl = MySwiftUICore::HeterogeneousViewIDsAccumulator()
            let values: ContiguousArray<String> = ["A", "B"]
            
            original.append(contentsOf: values)
            impl.append(contentsOf: values)
            
            original.appendWithoutExplicitID(indices: 8..<10, implicitID: 4)
            impl.appendWithoutExplicitID(indices: 8..<10, implicitID: 4)
            
            let expected: [(index: Int32, implicitID: Int32)] = [
                (8, 4),
                (9, 4),
            ]
            
            #expect(original.count == expected.count)
            #expect(impl.count == expected.count)
            
            impl.withBuffer(of: MySwiftUICore::TypedCanonicalViewID<MySwiftUICore::Nil>.self) { array in
                #expect(array.count == expected.count)
                
                for offset in 0..<min(array.count, expected.count) {
                    #expect(array[offset].index == expected[offset].index)
                    #expect(array[offset].implicitID == expected[offset].implicitID)
                    #expect(array[offset].explicitID == nil)
                }
            }
        }
        
        do {
            var original = _SwiftUICorePrivate::HeterogeneousViewIDsAccumulator()
            var impl = MySwiftUICore::HeterogeneousViewIDsAccumulator()
            
            original.withExplicitID("explicit", isUnary: true) { original in
                original.appendWithoutExplicitID(indices: 5..<8, implicitID: 12)
            }
            
            impl.withExplicitID("explicit", isUnary: true) { impl in
                impl.appendWithoutExplicitID(indices: 5..<8, implicitID: 12)
            }
            
            let expected: [(index: Int32, implicitID: Int32, explicitID: String)] = [
                (5, 12, "explicit"),
                (6, 12, "explicit"),
                (7, 12, "explicit"),
            ]
            
            #expect(original.currentExplicitID == nil)
            #expect(impl.currentExplicitID == nil)
            
            original.withBuffer(of: _SwiftUICorePrivate::TypedCanonicalViewID<String>.self) { array in
                #expect(array.count == expected.count)
                
                for offset in 0..<min(array.count, expected.count) {
                    #expect(array[offset].index == expected[offset].index)
                    #expect(array[offset].implicitID == expected[offset].implicitID)
                    #expect(array[offset].explicitID == expected[offset].explicitID)
                }
            }
            
            impl.withBuffer(of: MySwiftUICore::TypedCanonicalViewID<String>.self) { array in
                #expect(array.count == expected.count)
                
                for offset in 0..<min(array.count, expected.count) {
                    #expect(array[offset].index == expected[offset].index)
                    #expect(array[offset].implicitID == expected[offset].implicitID)
                    #expect(array[offset].explicitID == expected[offset].explicitID)
                }
            }
        }
        
        do {
            var original = _SwiftUICorePrivate::HeterogeneousViewIDsAccumulator()
            var impl = MySwiftUICore::HeterogeneousViewIDsAccumulator()
            
            original.withExplicitID(42, isUnary: false) { original in
                original.appendWithoutExplicitID(indices: 1..<4, implicitID: 12)
            }
            
            impl.withExplicitID(42, isUnary: false) { impl in
                impl.appendWithoutExplicitID(indices: 1..<4, implicitID: 12)
            }
            
            let expected: [(index: Int32, implicitID: Int32, explicitID: Int)] = [
                (1, -1, 42),
                (2, -1, 42),
                (3, -1, 42),
            ]
            
            #expect(original.currentExplicitID == nil)
            #expect(impl.currentExplicitID == nil)
            
            original.withBuffer(of: _SwiftUICorePrivate::TypedCanonicalViewID<Int>.self) { array in
                #expect(array.count == expected.count)
                
                for offset in 0..<min(array.count, expected.count) {
                    #expect(array[offset].index == expected[offset].index)
                    #expect(array[offset].implicitID == expected[offset].implicitID)
                    #expect(array[offset].explicitID == expected[offset].explicitID)
                }
            }
            
            impl.withBuffer(of: MySwiftUICore::TypedCanonicalViewID<Int>.self) { array in
                #expect(array.count == expected.count)
                
                for offset in 0..<min(array.count, expected.count) {
                    #expect(array[offset].index == expected[offset].index)
                    #expect(array[offset].implicitID == expected[offset].implicitID)
                    #expect(array[offset].explicitID == expected[offset].explicitID)
                }
            }
        }
    }
    
    @Test func test_append_indices_implicitID_explicitID_() {
        var original = _SwiftUICorePrivate::HeterogeneousViewIDsAccumulator()
        var impl = MySwiftUICore::HeterogeneousViewIDsAccumulator()
        
        original.append(indices: 3..<10, implicitID: 100, explicitID: 200)
        impl.append(indices: 3..<10, implicitID: 100, explicitID: 200)
    }
}

extension _SwiftUICorePrivate::HeterogeneousViewIDsAccumulator {
    fileprivate var currentExplicitID: (any Hashable, isUnary: Bool)? {
        return Mirror(reflecting: self)
            .descendant("currentExplicitID") as? (any Hashable, isUnary: Bool)
    }
}
