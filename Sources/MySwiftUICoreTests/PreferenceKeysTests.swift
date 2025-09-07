internal import Testing
@_private(sourceFile: "PreferenceInputs.swift") @testable private import MySwiftUICore

struct PreferenceKeysTests {
    @Test
    func test() {
        var keys_1 = PreferenceKeys()
        
        #expect(keys_1.isEmpty)
        #expect(keys_1.count == 0)
        #expect(keys_1.startIndex == 0)
        #expect(keys_1.endIndex == 0)
        
        keys_1.add(MyKey_1.self)
        
        #expect(!keys_1.isEmpty)
        #expect(keys_1.count == 1)
        #expect(keys_1.startIndex == 0)
        #expect(keys_1.endIndex == 1)
        #expect(keys_1.contains(MyKey_1.self))
        #expect(!keys_1.contains(MyKey_2.self))
        #expect(keys_1[0] == MyKey_1.self)
        
        keys_1.add(MyKey_1.self)
        
        #expect(!keys_1.isEmpty)
        #expect(keys_1.count == 1)
        #expect(keys_1.startIndex == 0)
        #expect(keys_1.endIndex == 1)
        #expect(keys_1.contains(MyKey_1.self))
        #expect(!keys_1.contains(MyKey_2.self))
        #expect(keys_1[0] == MyKey_1.self)
        
        keys_1.add(MyKey_2.self)
        
        #expect(!keys_1.isEmpty)
        #expect(keys_1.count == 2)
        #expect(keys_1.startIndex == 0)
        #expect(keys_1.endIndex == 2)
        #expect(keys_1.contains(MyKey_1.self))
        #expect(keys_1.contains(MyKey_2.self))
        #expect(keys_1[0] == MyKey_1.self)
        #expect(keys_1[1] == MyKey_2.self)
        
        keys_1.remove(MyKey_1.self)
        
        #expect(!keys_1.isEmpty)
        #expect(keys_1.count == 1)
        #expect(keys_1.startIndex == 0)
        #expect(keys_1.endIndex == 1)
        #expect(!keys_1.contains(MyKey_1.self))
        #expect(keys_1.contains(MyKey_2.self))
        #expect(keys_1[0] == MyKey_2.self)
        
        var keys_2 = PreferenceKeys()
        keys_2.add(MyKey_3.self)
        
        let keys_3 = keys_1.union(keys_2)
        
        #expect(!keys_3.isEmpty)
        #expect(keys_3.count == 2)
        #expect(keys_3.startIndex == 0)
        #expect(keys_3.endIndex == 2)
        #expect(keys_3.contains(MyKey_2.self))
        #expect(keys_3.contains(MyKey_3.self))
        #expect(keys_3[0] == MyKey_2.self)
        #expect(keys_3[1] == MyKey_3.self)
        
        let keys_4 = keys_1.union(keys_2)
        #expect(keys_3 == keys_4)
        
        let keys_5 = keys_2.union(keys_1)
        #expect(keys_3 != keys_5)
    }
}

fileprivate struct MyKey_1: PreferenceKey {
    static var defaultValue: Bool {
        return true
    }
}

fileprivate struct MyKey_2: PreferenceKey {
    static var defaultValue: Bool {
        return true
    }
}

fileprivate struct MyKey_3: PreferenceKey {
    static var defaultValue: Bool {
        return true
    }
}
