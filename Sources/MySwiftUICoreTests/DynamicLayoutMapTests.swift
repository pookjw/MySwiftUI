private import _SwiftUICorePrivate
@testable @_private(sourceFile: "DynamicContainer.swift") private import MySwiftUICore
internal import Testing
private import SwiftUI
private import AttributeGraph

struct DynamicLayoutMapTests {
    @Test func test_init() {
        let impl = MySwiftUICore.DynamicLayoutMap()
        #expect(impl.map.isEmpty)
        #expect(impl.sortedArray.isEmpty)
        #expect(impl.sortedSeed == 0)
        
        let original = _SwiftUICorePrivate.DynamicLayoutMap()
        #expect(original.map.isEmpty)
        #expect(original.sortedArray.isEmpty)
        #expect(original.sortedSeed == 0)
    }
    
    @Test func test_subscript() {
        var impl = MySwiftUICore.DynamicLayoutMap()
        var original = _SwiftUICorePrivate.DynamicLayoutMap()
        
        
        let key_1 = (
            MySwiftUICore.DynamicContainerID(uniqueId: 10, viewIndex: 10),
            _SwiftUICorePrivate.DynamicContainerID(uniqueId: 10, viewIndex: 10)
        )
        
        #expect(impl[key_1.0].isEmpty)
        #expect(original[key_1.1].isEmpty)
        
        let value_1 = (
            MySwiftUICore.LayoutProxyAttributes(),
            _SwiftUICorePrivate.LayoutProxyAttributes()
        )
        
        impl[key_1.0] = value_1.0
        original[key_1.1] = value_1.1
        
        #expect(impl.map.isEmpty)
        #expect(impl.sortedArray.isEmpty)
        #expect(impl.sortedSeed == 0)
        #expect(impl[key_1.0].isEmpty)
        
        #expect(original.map.isEmpty)
        #expect(original.sortedArray.isEmpty)
        #expect(original.sortedSeed == 0)
        #expect(original[key_1.1].isEmpty)
        
        
        let key_2 = (
            MySwiftUICore.DynamicContainerID(uniqueId: 20, viewIndex: 20),
            _SwiftUICorePrivate.DynamicContainerID(uniqueId: 20, viewIndex: 20)
        )
        
        let value_2_1 = (
            MySwiftUICore.LayoutProxyAttributes.create(),
            _SwiftUICorePrivate.LayoutProxyAttributes.create()
        )
        
        impl[key_2.0] = value_2_1.0
        original[key_2.1] = value_2_1.1
        
        #expect(impl.map.count == 1)
        #expect(impl.sortedArray.isEmpty)
        #expect(impl.sortedSeed == 0)
        #expect(impl[key_2.0] == value_2_1.0)
        
        #expect(original.map.count == 1)
        #expect(original.sortedArray.isEmpty)
        #expect(original.sortedSeed == 0)
        #expect(original[key_2.1] == value_2_1.1)
        
        
        let key_3 = (
            MySwiftUICore.DynamicContainerID(uniqueId: 30, viewIndex: 30),
            _SwiftUICorePrivate.DynamicContainerID(uniqueId: 30, viewIndex: 30)
        )
        
        let value_3_1 = (
            MySwiftUICore.LayoutProxyAttributes.create(),
            _SwiftUICorePrivate.LayoutProxyAttributes.create()
        )
        
        impl[key_3.0] = value_3_1.0
        original[key_3.1] = value_3_1.1
        
        #expect(impl.map.count == 2)
        #expect(impl.sortedArray.isEmpty)
        #expect(impl.sortedSeed == 0)
        #expect(impl[key_2.0] == value_2_1.0)
        #expect(impl[key_3.0] == value_3_1.0)
        
        #expect(original.map.count == 2)
        #expect(original.sortedArray.isEmpty)
        #expect(original.sortedSeed == 0)
        #expect(original[key_2.1] == value_2_1.1)
        #expect(original[key_3.1] == value_3_1.1)
        
        
        let value_3_2 = (
            MySwiftUICore.LayoutProxyAttributes.create(),
            _SwiftUICorePrivate.LayoutProxyAttributes.create()
        )
        
        impl[key_3.0] = value_3_2.0
        original[key_3.1] = value_3_2.1
        
        #expect(impl.map.count == 2)
        #expect(impl.sortedArray.isEmpty)
        #expect(impl.sortedSeed == 0)
        #expect(impl[key_2.0] == value_2_1.0)
        #expect(impl[key_3.0] == value_3_2.0)
        
        #expect(original.map.count == 2)
        #expect(original.sortedArray.isEmpty)
        #expect(original.sortedSeed == 0)
        #expect(original[key_2.1] == value_2_1.1)
        #expect(original[key_3.1] == value_3_2.1)
        
        
        let value_2_2 = (
            MySwiftUICore.LayoutProxyAttributes.create(),
            _SwiftUICorePrivate.LayoutProxyAttributes.create()
        )
        
        impl[key_2.0] = value_2_2.0
        original[key_2.1] = value_2_2.1
        
        #expect(impl.map.count == 2)
        #expect(impl.sortedArray.isEmpty)
        #expect(impl.sortedSeed == 0)
        #expect(impl[key_2.0] == value_2_2.0)
        #expect(impl[key_3.0] == value_3_2.0)
        
        #expect(original.map.count == 2)
        #expect(original.sortedArray.isEmpty)
        #expect(original.sortedSeed == 0)
        #expect(original[key_2.1] == value_2_2.1)
        #expect(original[key_3.1] == value_3_2.1)
    }
    
    @Test func test_remove() {
        var impl = MySwiftUICore.DynamicLayoutMap()
        var original = _SwiftUICorePrivate.DynamicLayoutMap()
        
        let key_1 = (
            MySwiftUICore.DynamicContainerID(uniqueId: 10, viewIndex: 10),
            _SwiftUICorePrivate.DynamicContainerID(uniqueId: 10, viewIndex: 10)
        )
        
        let value_1 = (
            MySwiftUICore.LayoutProxyAttributes.create(),
            _SwiftUICorePrivate.LayoutProxyAttributes.create()
        )
        
        let key_2 = (
            MySwiftUICore.DynamicContainerID(uniqueId: 20, viewIndex: 20),
            _SwiftUICorePrivate.DynamicContainerID(uniqueId: 20, viewIndex: 20)
        )
        
        let value_2 = (
            MySwiftUICore.LayoutProxyAttributes.create(),
            _SwiftUICorePrivate.LayoutProxyAttributes.create()
        )
        
        impl[key_1.0] = value_1.0
        impl[key_2.0] = value_2.0
        original[key_1.1] = value_1.1
        original[key_2.1] = value_2.1
        
        
        impl.remove(uniqueId: key_1.0.uniqueId)
        original.remove(uniqueId: key_1.1.uniqueId)
        
        #expect(impl.map.count == 1)
        #expect(impl.sortedArray.isEmpty)
        #expect(impl.sortedSeed == 0)
        #expect(impl[key_1.0].isEmpty)
        #expect(!impl[key_2.0].isEmpty)
        
        #expect(original.map.count == 1)
        #expect(original.sortedArray.isEmpty)
        #expect(original.sortedSeed == 0)
        #expect(original[key_1.1].isEmpty)
        #expect(!original[key_2.1].isEmpty)
        
        
        impl.remove(uniqueId: key_2.0.uniqueId)
        original.remove(uniqueId: key_2.1.uniqueId)
        
        #expect(impl.map.isEmpty)
        #expect(impl.sortedArray.isEmpty)
        #expect(impl.sortedSeed == 0)
        #expect(impl[key_1.0].isEmpty)
        #expect(impl[key_2.0].isEmpty)
        
        #expect(original.map.isEmpty)
        #expect(original.sortedArray.isEmpty)
        #expect(original.sortedSeed == 0)
        #expect(original[key_1.1].isEmpty)
        #expect(original[key_2.1].isEmpty)
    }
}

extension _SwiftUICorePrivate.DynamicLayoutMap {
    fileprivate var map: [(id: _SwiftUICorePrivate.DynamicContainerID, value: _SwiftUICorePrivate.LayoutProxyAttributes)] {
        return Mirror(reflecting: self).descendant("map") as! [(id: _SwiftUICorePrivate.DynamicContainerID, value: _SwiftUICorePrivate.LayoutProxyAttributes)]
    }
}

extension _SwiftUICorePrivate.LayoutProxyAttributes {
    fileprivate static func create() -> _SwiftUICorePrivate.LayoutProxyAttributes {
        return withGraphContext { 
            _SwiftUICorePrivate.LayoutProxyAttributes(
                layoutComputer: OptionalAttribute(Attribute(SwiftUICoreLayoutComputerRule())),
                traitsList: OptionalAttribute(Attribute(SwiftUICoreViewListRule()))
            )
        }
    }
}

extension MySwiftUICore.LayoutProxyAttributes {
    fileprivate static func create() -> MySwiftUICore.LayoutProxyAttributes {
        return withGraphContext { 
            MySwiftUICore.LayoutProxyAttributes(
                layoutComputer: OptionalAttribute(Attribute(MySwiftUICoreLayoutComputerRule())),
                traitsList: OptionalAttribute(Attribute(MySwiftUICoreViewListRule()))
            )
        }
    }
}

fileprivate struct SwiftUICoreLayoutComputerRule: Rule {
    var value: _SwiftUICorePrivate.LayoutComputer {
        fatalError("Do not call")
    }
}

fileprivate struct SwiftUICoreViewListRule: Rule {
    var value: any _SwiftUICorePrivate.ViewList {
        fatalError("Do not call")
    }
}

fileprivate struct MySwiftUICoreLayoutComputerRule: Rule {
    var value: MySwiftUICore.LayoutComputer {
        fatalError("Do not call")
    }
}

fileprivate struct MySwiftUICoreViewListRule: Rule {
    var value: any MySwiftUICore.ViewList {
        fatalError("Do not call")
    }
}

fileprivate func withGraphContext<T>(_ body: () -> T) -> T {
    let graph = Graph()
    let subgraph = Subgraph(graph: graph)
    let old = Subgraph.current
    Subgraph.current = subgraph
    let result = body()
    Subgraph.current = old
    return result
}
