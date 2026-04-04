// 942F1C857BFDDC6A403D8C4AF46F7566
private import MySwiftUICore

struct WindowLayoutComputer: Equatable {
    private var engine: MutableBox<WindowLayoutEngine>
    private var seed: Int
    
    static func == (lhs: WindowLayoutComputer, rhs: WindowLayoutComputer) -> Bool {
        assertUnimplemented()
    }
    
    @inline(always) // 원래 없음
    var windowPlacement: WindowPlacement {
        return engine
            .value
            .windowLayout
            .storage
            .windowPlacement(
                content: engine.value.content,
                context: engine.value.context,
                cache: &engine.value.cache
            )
    }
}

fileprivate struct WindowLayoutEngine {
    private(set) var windowLayout: AnyWindowLayout
    private(set) var content: WindowLayoutRootView
    private(set) var context: WindowPlacementContext
    var cache: AnyWindowLayout.Cache
}
