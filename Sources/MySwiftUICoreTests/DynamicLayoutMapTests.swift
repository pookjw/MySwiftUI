private import _SwiftUICorePrivate
@testable @_private(sourceFile: "DynamicView.swift") private import MySwiftUICore
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
        
        do {
            let key = (
                MySwiftUICore.DynamicContainerID(uniqueId: 10, viewIndex: 10),
                _SwiftUICorePrivate.DynamicContainerID(uniqueId: 10, viewIndex: 10)
            )
            
            let value = (
                MySwiftUICore.LayoutProxyAttributes.empty,
                _SwiftUICorePrivate.LayoutProxyAttributes.empty
            )
            
            impl[key.0] = value.0
            original[key.1] = value.1
            
            #expect(impl.map.isEmpty)
            #expect(impl.sortedArray.isEmpty)
            #expect(impl.sortedSeed == 0)
            #expect(original.map.isEmpty)
            #expect(original.sortedArray.isEmpty)
            #expect(original.sortedSeed == 0)
        }
        
        let key_1 = (
            MySwiftUICore.DynamicContainerID(uniqueId: 20, viewIndex: 20),
            _SwiftUICorePrivate.DynamicContainerID(uniqueId: 20, viewIndex: 20)
        )
        
        let value_1 = (
            MySwiftUICore.LayoutProxyAttributes.create(),
            _SwiftUICorePrivate.LayoutProxyAttributes.create()
        )
        
        impl[key_1.0] = value_1.0
        original[key_1.1] = value_1.1
        
        #expect(impl.map.count == 1)
        #expect(impl.sortedArray.isEmpty)
        #expect(impl.sortedSeed == 0)
        #expect(original.map.count == 1)
        #expect(original.sortedArray.isEmpty)
        #expect(original.sortedSeed == 0)
        
        print(original[key_1.1])
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
    
    fileprivate static var empty: _SwiftUICorePrivate.LayoutProxyAttributes {
        return _SwiftUICorePrivate.LayoutProxyAttributes(
            layoutComputer: OptionalAttribute(),
            traitsList: OptionalAttribute()
        )
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
    
    fileprivate static var empty: MySwiftUICore.LayoutProxyAttributes {
        return MySwiftUICore.LayoutProxyAttributes(
            layoutComputer: OptionalAttribute(),
            traitsList: OptionalAttribute()
        )
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
