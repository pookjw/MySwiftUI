internal import Testing
@testable @_private(sourceFile: "VersionSeed.swift") private import MySwiftUICore
private import _SwiftUICorePrivate

private let valueArguments: [UInt32] = [
    0,
    1,
    2,
    3,
    0x0000_FFFF,
    0xFFFF_0000,
    0x7FFF_FFFF,
    0x8000_0000,
    0xFFFF_FFFE,
    .max
]

private let nodeViewArguments: [(UInt32, UInt32)] = [
    (0, 0),
    (1, 0),
    (0, 1),
    (1, 1),
    (0x0000_FFFF, 0x0000_FFFF),
    (0x00FF_00FF, 0x0F0F_0F0F),
    (0x7FFF_FFFF, 0x8000_0000),
    (.max, 0),
    (0, .max),
    (.max, .max)
]

struct VersionSeedTests {
    @Test func test_staticSeeds() {
        assertEquivalent(original: .invalid, impl: .invalid)
        assertEquivalent(original: .empty, impl: .empty)
    }
    
    @Test(arguments: valueArguments)
    func test_init_value(value: UInt32) {
        let original = _SwiftUICorePrivate::VersionSeed(value: value)
        let impl = MySwiftUICore.VersionSeed(value: value)
        assertEquivalent(original: original, impl: impl)
    }
    
    @Test(arguments: nodeViewArguments)
    func test_init_nodeId_viewSeed(nodeId: UInt32, viewSeed: UInt32) {
        let original = _SwiftUICorePrivate::VersionSeed(nodeId: nodeId, viewSeed: viewSeed)
        let impl = MySwiftUICore.VersionSeed(nodeId: nodeId, viewSeed: viewSeed)
        assertEquivalent(original: original, impl: impl)
    }
    
    @Test func test_matches_matrix() {
        let originalSeeds = makeOriginalSeeds()
        let implSeeds = makeImplSeeds()
        
        #expect(originalSeeds.count == implSeeds.count)
        
        for i in originalSeeds.indices {
            for j in originalSeeds.indices {
                #expect(originalSeeds[i].matches(originalSeeds[j]) == implSeeds[i].matches(implSeeds[j]))
            }
        }
    }
    
    @Test func test_merge_matrix() {
        let originalSeeds = makeOriginalSeeds()
        let implSeeds = makeImplSeeds()
        
        #expect(originalSeeds.count == implSeeds.count)
        
        for i in originalSeeds.indices {
            for j in originalSeeds.indices {
                var original = originalSeeds[i]
                let originalOther = originalSeeds[j]
                
                var impl = implSeeds[i]
                let implOther = implSeeds[j]
                
                original.merge(originalOther)
                impl.merge(implOther)
                
                assertEquivalent(original: original, impl: impl)
            }
        }
    }
    
    @Test(arguments: valueArguments)
    func test_mergeValue_fromAllSeeds(value: UInt32) {
        let originalSeeds = makeOriginalSeeds()
        let implSeeds = makeImplSeeds()
        
        #expect(originalSeeds.count == implSeeds.count)
        
        for i in originalSeeds.indices {
            var original = originalSeeds[i]
            var impl = implSeeds[i]
            
            original.mergeValue(value)
            impl.mergeValue(value)
            
            assertEquivalent(original: original, impl: impl)
        }
    }
    
    @Test func test_description() {
        let originalSeeds = makeOriginalSeeds()
        let implSeeds = makeImplSeeds()
        
        #expect(originalSeeds.count == implSeeds.count)
        
        for i in originalSeeds.indices {
            #expect(originalSeeds[i].description == implSeeds[i].description)
        }
    }
    
    @Test func test_isEmpty() {
        let originalSeeds = makeOriginalSeeds()
        let implSeeds = makeImplSeeds()
        
        #expect(originalSeeds.count == implSeeds.count)
        
        for i in originalSeeds.indices {
            #expect(originalSeeds[i].isEmpty == implSeeds[i].isEmpty)
        }
    }
    
    @Test func test_isInvalid() {
        let originalSeeds = makeOriginalSeeds()
        let implSeeds = makeImplSeeds()
        
        #expect(originalSeeds.count == implSeeds.count)
        
        for i in originalSeeds.indices {
            #expect(originalSeeds[i].isInvalid == implSeeds[i].isInvalid)
        }
    }
    
    @Test func test_merge_disassemblyBranchCases() {
        let branchCases: [(UInt32, UInt32)] = [
            (.max, 0x1234_5678), // self invalid -> unchanged
            (0x1234_5678, 0), // other empty -> unchanged
            (0, 0x1234_5678), // self empty -> other
            (0x1234_5678, .max), // other invalid -> other
            (1, 2) // normal merge path
        ]
        
        for (lhs, rhs) in branchCases {
            var original = _SwiftUICorePrivate::VersionSeed(value: lhs)
            let originalOther = _SwiftUICorePrivate::VersionSeed(value: rhs)
            original.merge(originalOther)
            
            var impl = MySwiftUICore.VersionSeed(value: lhs)
            let implOther = MySwiftUICore.VersionSeed(value: rhs)
            impl.merge(implOther)
            
            assertEquivalent(original: original, impl: impl)
        }
    }
    
    @Test func test_mergeValue_disassemblyBranchCases() {
        let branchCases: [(UInt32, UInt32)] = [
            (.max, 0x1234_5678), // invalid -> unchanged
            (0, 0x1234_5678), // empty -> store argument
            (0x1234_5678, 0x9ABC_DEF0) // normal merge path
        ]
        
        for (lhs, rhs) in branchCases {
            var original = _SwiftUICorePrivate::VersionSeed(value: lhs)
            original.mergeValue(rhs)
            
            var impl = MySwiftUICore.VersionSeed(value: lhs)
            impl.mergeValue(rhs)
            
            assertEquivalent(original: original, impl: impl)
        }
    }
}

fileprivate func makeOriginalSeeds() -> [_SwiftUICorePrivate::VersionSeed] {
    var result: [_SwiftUICorePrivate::VersionSeed] = [
        .invalid,
        .empty
    ]
    result.append(contentsOf: valueArguments.map { _SwiftUICorePrivate::VersionSeed(value: $0) })
    result.append(contentsOf: nodeViewArguments.map { _SwiftUICorePrivate::VersionSeed(nodeId: $0.0, viewSeed: $0.1) })
    return result
}

fileprivate func makeImplSeeds() -> [MySwiftUICore.VersionSeed] {
    var result: [MySwiftUICore.VersionSeed] = [
        .invalid,
        .empty
    ]
    result.append(contentsOf: valueArguments.map { MySwiftUICore.VersionSeed(value: $0) })
    result.append(contentsOf: nodeViewArguments.map { MySwiftUICore.VersionSeed(nodeId: $0.0, viewSeed: $0.1) })
    return result
}

fileprivate func assertEquivalent(
    original: _SwiftUICorePrivate::VersionSeed,
    impl: MySwiftUICore.VersionSeed
) {
    #expect(original.value == impl.valueForTest)
}

extension _SwiftUICorePrivate::VersionSeed {
    fileprivate var value: UInt32 {
        Mirror(reflecting: self).descendant("value") as! UInt32
    }
}

extension MySwiftUICore.VersionSeed {
    fileprivate var valueForTest: UInt32 {
        Mirror(reflecting: self).descendant("value") as! UInt32
    }
}
