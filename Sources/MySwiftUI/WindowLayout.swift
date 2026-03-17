// 8A277925612D2191C60D4EC55A8223CA

struct WindowLayoutProvider {
    var makeLayout: () -> AnyWindowLayout
}

struct DefaultPlacementWindowLayoutProvider {
    private var makePlacement: MakePlacement
    
    // TODO
}

struct IdealWindowPlacementLayout {
    private var makePlacement: MakePlacement
    
    // TODO
}

protocol WindowLayoutHost: AnyObject {
    // TODO
}

struct AnyWindowLayout {
    // TODO
}

fileprivate enum MakePlacement {
//    case v1((WindowLayoutRootView, WindowPlacementContext) -> WindowPlacement)
//    case v2((WindowLayoutRoot, WindowPlacementContext) -> WindowPlacement)
}
