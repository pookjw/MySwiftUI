// 942F1C857BFDDC6A403D8C4AF46F7566
private import MySwiftUICore

struct WindowLayoutComputer {
    private var engine: MutableBox<WindowLayoutEngine>
    private var seed: Int
}

fileprivate struct WindowLayoutEngine {
    private var windowLayout: AnyWindowLayout
    private var content: WindowLayoutRootView
    private var context: WindowPlacementContext
    private var cache: AnyWindowLayout.Cache
}
