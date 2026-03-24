// E9CAA77857A30CB2577863ECA37EC677
private import UIKit
@_spi(Internal) private import MySwiftUICore
internal import Foundation

final class MainMenuItemHost {
    let viewGraph: ViewGraph // 0x10
    var valuesNeedingUpdate = ViewGraphRootValues(rawValue: 0) // 0x18
    var renderingPhase: ViewRenderingPhase = .rendering // 0x1a
    var currentTimestamp = Time() // 0x20
    var externalUpdateCount: Int = 0 // 0x28
    var mainMenuItem: MainMenuItem // 0x30
    private var environment: EnvironmentValues // 0x60
    var focusedValues: FocusedValues // 0x70
    private var focusStore: FocusStore // 0x90
    unowned var delegate: (any MainMenuItemHostDelegate)? = nil // 0xa8
    
    init(_ item: MainMenuItem, environment: EnvironmentValues, focusedValues: FocusedValues, focusStore: FocusStore) {
        /*
         item -> x0 -> x29 - 0xa0
         environment -> x1 -> x29 - 0x98
         focusedValues -> x2 -> x29 - 0x90
         focusStore -> x3 -> x29 - 0x88
         */
        // <+300>
        self.mainMenuItem = item
        self.environment = environment
        self.focusedValues = focusedValues
        self.focusStore = focusStore
        
        // <+436>
        Update.begin()
        
        let viewGraph = ViewGraph(rootViewType: MainMenuItemHost.RootView.self, requestedOutputs: [.platformItemList, .focus])
        self.viewGraph = viewGraph
        
        let focusViewGraph = FocusViewGraph(graph: viewGraph)
        viewGraph.append(feature: focusViewGraph)
        
        // <+792>
        let flatformItemListViewGraph = PlatformItemListViewGraph()
        viewGraph.append(feature: flatformItemListViewGraph)
        viewGraph.append(feature: MainMenuItemViewGraph())
        
        // <+892>
        let rootView = MainMenuItemHost.RootView(
            itemContent: MainMenuItem.Content(item: item)
        )
        viewGraph.setRootView(rootView)
        viewGraph.setEnvironment(environment)
        viewGraph.setFocusedValues(focusedValues)
        viewGraph.setFocusStore(focusStore)
        
        self.initializeViewGraph()
        Update.end()
    }
}

extension MainMenuItemHost: ViewGraphRootValueUpdater {
    func updateRootView() {
        let rootView = MainMenuItemHost.RootView(
            itemContent: MainMenuItem.Content(item: mainMenuItem)
        )
        viewGraph.setRootView(rootView)
    }
    
    func updateEnvironment() {
        assertUnimplemented()
    }
    
    func updateSize() {
        assertUnimplemented()
    }
    
    func updateSafeArea() {
        assertUnimplemented()
    }
    
    func updateContainerSize() {
        assertUnimplemented()
    }
    
    func updateFocusedValues() {
        assertUnimplemented()
    }
    
    func `as`<T>(_ type: T.Type) -> T? {
        if let result = _specialize(self as (any ViewGraphOwner), for: T.self) {
            return result
        } else if let result = _specialize(self as (any ViewGraphDelegate), for: T.self) {
            return result
        } else {
            return nil
        }
    }
    
    func requestUpdate(after time: Double) {
        self.updateViewGraph { graph in
            // $s7SwiftUI16MainMenuItemHostC13requestUpdate5afterySd_tFyAA9ViewGraphCXEfU_TA
            if let delegate {
                delegate.menuHostDidChangeMenuItems(self)
            }
            
            _ = graph.updatePreferences()
        }
    }
    
    func beginTransaction() {
        assertUnimplemented()
    }
}

extension MainMenuItemHost: ViewGraphOwner {
}

extension MainMenuItemHost: ViewRendererHost {
}

extension MainMenuItemHost {
    struct RootView: View {
        fileprivate private(set) var itemContent: MainMenuItem.Content
        
        typealias Body = ModifiedContent<MainMenuItem.Content, PlatformItemListTransformModifier<AllPlatformItemListFlags>>
        
        var body: Body {
            ModifiedContent(
                content: itemContent,
                modifier: PlatformItemListTransformModifier<AllPlatformItemListFlags>(
                    transform: { list in
                        assertUnimplemented()
                    }
                )
            )
        }
    }
}

protocol MainMenuItemHostDelegate: AnyObject {
    func menuHostDidChangeMenuItems(_ host: MainMenuItemHost)
}

struct MenuBuilderContext {
    private var placementKind: MenuBuilderContext.PlacementKind = .unknown // 0x0
    private var keyCommandMap: [KeyCommandID : () -> Void] = [:] // 0x8
    private var placementMap = MenuBuilderContext.PlacementMap() // 0x10
    private var menuElements: [UIMenuElement] = [] // 0x18
    private var operationMap: [UIMenuElement: CommandOperation] = [:] // 0x20
}

fileprivate struct MainMenuItemViewGraph: ViewGraphFeature {
    // TODO
}

struct MainMenuItem: Sendable {
    private(set) var name: String
    private(set) var id: MainMenuItem.Identifier
    private(set) var groups: [CommandAccumulator.Result]
}

extension MainMenuItem {
    struct Content: View {
        fileprivate private(set) var item: MainMenuItem
        
        var body: some View {
            ForEach(item.groups.indices, id: \.self) { index in
                // $s7SwiftUI12MainMenuItemV7ContentV4bodyQrvgAA7AnyViewVSicfU_TA
                AnyView(assertUnimplemented())
            }
        }
    }
    
    enum Identifier {
        case custom(UUID)
        case app
        case file
        case edit
        case format
        case view
        case window
        case help
        case dock
        case invalid
        case root
    }
}
