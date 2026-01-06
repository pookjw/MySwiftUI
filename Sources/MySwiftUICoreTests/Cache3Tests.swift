internal import Testing
@testable @_private(sourceFile: "Cache3.swift") private import MySwiftUICore 
private import MySwiftUITestUtils
private import _SwiftUICorePrivate

fileprivate struct Cache3Tests {
    @Test func test_init() {
        let impl = MySwiftUICore.Cache3<MyKey, MyValue>()
        let original = _SwiftUICorePrivate.Cache3<MyKey, MyValue>()
        #expect(isEqual(impl: impl, original: original))
    }
    
    @Test func test_get() {
        var impl = MySwiftUICore.Cache3<MyKey, MyValue>()
        var original = _SwiftUICorePrivate.Cache3<MyKey, MyValue>()
        
        var called = false
        
        let key_1 = MyKey(key: 1)
        let value_1_1 = MyValue(value: 11)
        #expect(impl.get(key_1, makeValue: { called = true; return value_1_1 }).value == value_1_1.value)
        #expect(called)
        called = false
        #expect(original.get(key_1, makeValue: { called = true; return value_1_1 }).value == value_1_1.value)
        #expect(called)
        called = false
        #expect(impl.find(key_1)?.value == value_1_1.value)
        #expect(original.find(key_1)?.value == value_1_1.value)
        
        let value_1_2 = MyValue(value: 12)
        #expect(impl.get(key_1, makeValue: { called = true; return value_1_2 }).value == value_1_1.value)
        #expect(!called)
        called = false
        #expect(original.get(key_1, makeValue: { called = true; return value_1_2 }).value == value_1_1.value)
        #expect(!called)
        called = false
        #expect(impl.find(key_1)?.value == value_1_1.value)
        #expect(original.find(key_1)?.value == value_1_1.value)
        
        let value_1_3 = MyValue(value: 13)
        impl.put(key_1, value: value_1_3)
        original.put(key_1, value: value_1_3)
        #expect(impl.get(key_1, makeValue: { called = true; return value_1_2 }).value == value_1_3.value)
        #expect(!called)
        called = false
        #expect(original.get(key_1, makeValue: { called = true; return value_1_2 }).value == value_1_3.value)
        #expect(!called)
        called = false
    }
    
    @Test func test_find() {
        var impl = MySwiftUICore.Cache3<MyKey, MyValue>()
        var original = _SwiftUICorePrivate.Cache3<MyKey, MyValue>()
        
        let key_1 = MyKey(key: 1)
        let value_1 = MyValue(value: 1)
        #expect(impl.find(key_1) == nil)
        #expect(original.find(key_1) == nil)
        impl.put(key_1, value: value_1)
        original.put(key_1, value: value_1)
        #expect(impl.find(key_1)?.value == value_1.value)
        #expect(original.find(key_1)?.value == value_1.value)
        
        let key_2 = MyKey(key: 2)
        let value_2 = MyValue(value: 2)
        #expect(impl.find(key_2) == nil)
        #expect(original.find(key_2) == nil)
        impl.put(key_2, value: value_2)
        original.put(key_2, value: value_2)
        #expect(impl.find(key_2)?.value == value_2.value)
        #expect(original.find(key_2)?.value == value_2.value)
        
        let key_3 = MyKey(key: 3)
        let value_3 = MyValue(value: 3)
        #expect(impl.find(key_3) == nil)
        #expect(original.find(key_3) == nil)
        impl.put(key_3, value: value_3)
        original.put(key_3, value: value_3)
        #expect(impl.find(key_3)?.value == value_3.value)
        #expect(original.find(key_3)?.value == value_3.value)
        
        let key_4 = MyKey(key: 4)
        let value_4 = MyValue(value: 4)
        #expect(impl.find(key_4) == nil)
        #expect(original.find(key_4) == nil)
        impl.put(key_4, value: value_4)
        original.put(key_4, value: value_4)
        #expect(impl.find(key_4)?.value == value_4.value)
        #expect(original.find(key_4)?.value == value_4.value)
        
        #expect(impl.find(key_1) == nil)
        #expect(original.find(key_1) == nil)
        #expect(impl.find(key_2)?.value == value_2.value)
        #expect(original.find(key_2)?.value == value_2.value)
        #expect(impl.find(key_3)?.value == value_3.value)
        #expect(original.find(key_3)?.value == value_3.value)
        
        let value_4_2 = MyValue(value: 42)
        impl.put(key_4, value: value_4_2)
        original.put(key_4, value: value_4_2)
        #expect(impl.find(key_4)?.value == value_4_2.value)
        #expect(original.find(key_4)?.value == value_4_2.value)
    }
    
    @Test func test_put() {
        var impl = MySwiftUICore.Cache3<MyKey, MyValue>()
        var original = _SwiftUICorePrivate.Cache3<MyKey, MyValue>()
        
        let key_1 = MyKey(key: 1)
        let value_1 = MyValue(value: 1)
        
        impl.put(key_1, value: value_1)
        original.put(key_1, value: value_1)
        #expect(isEqual(impl: impl, original: original))
        
        
        let key_2 = MyKey(key: 2)
        let value_2 = MyValue(value: 2)
        
        impl.put(key_2, value: value_2)
        original.put(key_2, value: value_2)
        #expect(isEqual(impl: impl, original: original))
        
        
        let key_3 = MyKey(key: 3)
        let value_3 = MyValue(value: 3)
        
        impl.put(key_3, value: value_3)
        original.put(key_3, value: value_3)
        #expect(isEqual(impl: impl, original: original))
        
        
        let key_4 = MyKey(key: 4)
        let value_4 = MyValue(value: 4)
        
        impl.put(key_4, value: value_4)
        original.put(key_4, value: value_4)
        #expect(isEqual(impl: impl, original: original))
    }
    
    @Test func test_map() {
        var impl = MySwiftUICore.Cache3<MyKey, MyValue>()
        var original = _SwiftUICorePrivate.Cache3<MyKey, MyValue>()
        
        do {
            var count = 0
            let transformedImpl = impl.map { incoming in
                #expect(incoming == nil)
                count += 1
                return nil
            }
            #expect(count == 3)
            
            count = 0
            let transformedOriginal = original.map { incoming in
                #expect(incoming == nil)
                count += 1
                return nil
            }
            #expect(count == 3)
            
            #expect(isEqual(impl: transformedImpl, original: transformedOriginal))
        }
        
        do {
            let key_1 = MyKey(key: 1)
            let value_1 = MyValue(value: 1)
            impl.put(key_1, value: value_1)
            original.put(key_1, value: value_1)
            
            let key_2 = MyKey(key: 2)
            let value_2 = MyValue(value: 2)
            impl.put(key_2, value: value_2)
            original.put(key_2, value: value_2)
            
            let key_3 = MyKey(key: 3)
            let value_3 = MyValue(value: 3)
            
            var count = 0
            let transformedImpl = impl.map { incoming in
                defer {
                    count += 1
                }
                
                if count == 0 {
                    #expect(incoming?.key == key_2)
                } else if count == 1 {
                    #expect(incoming?.key == key_1)
                } else if count == 2 {
                    #expect(incoming?.key == nil)
                    return (key_3, value_3)
                }
                
                return incoming
            }
            #expect(count == 3)
            
            count = 0
            let transformedOriginal = original.map { incoming in
                defer {
                    count += 1
                }
                
                if count == 0 {
                    #expect(incoming?.key == key_2)
                } else if count == 1 {
                    #expect(incoming?.key == key_1)
                } else if count == 2 {
                    #expect(incoming?.key == nil)
                    return (key_3, value_3)
                }
                
                return incoming
            }
            #expect(count == 3)
            
            #expect(transformedImpl.find(key_1)?.value == value_1.value)
            #expect(transformedImpl.find(key_2)?.value == value_2.value)
            #expect(transformedImpl.find(key_3)?.value == value_3.value)
            #expect(transformedOriginal.find(key_1)?.value == value_1.value)
            #expect(transformedOriginal.find(key_2)?.value == value_2.value)
            #expect(transformedOriginal.find(key_3)?.value == value_3.value)
            #expect(isEqual(impl: transformedImpl, original: transformedOriginal))
        }
    }
}

extension _SwiftUICorePrivate.Cache3 {
    fileprivate var store: ((key: Key, value: Value)?, (key: Key, value: Value)?, (key: Key, value: Value)?) {
        return Mirror(reflecting: self).descendant("store") as! ((key: Key, value: Value)?, (key: Key, value: Value)?, (key: Key, value: Value)?)
    }
}

fileprivate struct MyKey: Equatable {
    let key: Int
}

fileprivate struct MyValue {
    let value: Int
}

fileprivate func isEqual(impl: MySwiftUICore.Cache3<MyKey, MyValue>, original: _SwiftUICorePrivate.Cache3<MyKey, MyValue>) -> Bool {
    return impl.store.0?.key == original.store.0?.key &&
    impl.store.0?.value.value == original.store.0?.value.value &&
    impl.store.1?.key == original.store.1?.key &&
    impl.store.1?.value.value == original.store.1?.value.value &&
    impl.store.2?.key == original.store.2?.key &&
    impl.store.2?.value.value == original.store.2?.value.value
}
