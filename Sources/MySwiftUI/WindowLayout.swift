// 09A3C6DE97140258F29D05369AB01813
private import MySwiftUICore

protocol WindowLayout {
    associatedtype Cache
    
    static var windowLayoutProperties: WindowLayoutProperties {
        get
    }
    
    func makeCache(content: WindowLayoutRootView, context: WindowPlacementContext) -> Self.Cache
    func updateCache(_ cache: inout Self.Cache, content: WindowLayoutRootView, context: WindowPlacementContext)
    func windowPlacement(content: WindowLayoutRootView, context: WindowPlacementContext, cache: inout Self.Cache) -> WindowPlacement
}

extension WindowLayout {
    static var windowLayoutProperties: WindowLayoutProperties {
        return WindowLayoutProperties()
    }
    
    func updateCache(_ cache: inout Self.Cache, content: WindowLayoutRootView, context: WindowPlacementContext) {
        assertUnimplemented()
    }
}

extension WindowLayout where Cache == Void {
    func makeCache(content: WindowLayoutRootView, context: WindowPlacementContext) -> Void {
        // nop
    }
}

struct WindowLayoutProperties {
    var triggers: WindowLayoutUpdateTriggers
    
    init() {
        self.triggers = [.initial]
    }
}

struct WindowLayoutUpdateTriggers: OptionSet {
    static var initial: WindowLayoutUpdateTriggers {
        return WindowLayoutUpdateTriggers(rawValue: 1 << 0)
    }
    
    static var displayConfiguration: WindowLayoutUpdateTriggers {
        return WindowLayoutUpdateTriggers(rawValue: 1 << 1)
    }
    
    static let all: WindowLayoutUpdateTriggers = [.initial, .displayConfiguration]
    
    init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    let rawValue: Int
}

protocol WindowLayoutHost : AnyObject {
    func windowLayoutComputerDidChange(computer: () -> WindowLayoutComputer)
}

struct AnyWindowLayout {
    private(set) var storage: AnyWindowLayoutStorageBase
    
    init<T: WindowLayout>(_ layout: T) {
        assertUnimplemented()
    }
}

extension AnyWindowLayout {
    struct Cache {
        private var type: Any.Type
        private var value: Any
    }
}

class AnyWindowLayoutStorageBase {
    func makeCache(content: WindowLayoutRootView, context: WindowPlacementContext) -> AnyWindowLayout.Cache {
        preconditionFailure()
    }
    
    func updateCache(_ cache: inout AnyWindowLayout.Cache, content: WindowLayoutRootView, context: WindowPlacementContext) {
        preconditionFailure()
    }
    
    func windowPlacement(content: WindowLayoutRootView, context: WindowPlacementContext, cache: inout AnyWindowLayout.Cache) -> WindowPlacement {
        preconditionFailure()
    }
}

final class AnyWindowLayoutStorage<T>: AnyWindowLayoutStorageBase {
    private let layout: T
    
    fileprivate override init() {
        assertUnimplemented()
    }
    
    override func makeCache(content: WindowLayoutRootView, context: WindowPlacementContext) -> AnyWindowLayout.Cache {
        assertUnimplemented()
    }
    
    override func updateCache(_ cache: inout AnyWindowLayout.Cache, content: WindowLayoutRootView, context: WindowPlacementContext) {
        assertUnimplemented()
    }
    
    override func windowPlacement(content: WindowLayoutRootView, context: WindowPlacementContext, cache: inout AnyWindowLayout.Cache) -> WindowPlacement {
        assertUnimplemented()
    }
}
