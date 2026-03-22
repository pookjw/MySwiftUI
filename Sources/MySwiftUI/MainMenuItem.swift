// E9CAA77857A30CB2577863ECA37EC677
private import UIKit
@_spi(Internal) private import MySwiftUICore
internal import Foundation

final class MainMenuItemHost {
    private let viewGraph: ViewGraph // 0x10
    private var valuesNeedingUpdate = ViewGraphRootValues(rawValue: 0) // 0x18
    private var renderingPhase: ViewRenderingPhase = .rendering // 0x1a
    private var currentTimestamp = Time() // 0x20
    private var externalUpdateCount: Int = 0 // 0x28
    private var mainMenuItem: MainMenuItem // 0x30
    private var environment: EnvironmentValues // 0x60
    private var focusedValues: FocusedValues // 0x70
    private var focusStore: FocusStore // 0x90
    private unowned var delegate: (any MainMenuItemHostDelegate)? = nil // 0xa8
    
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
        let flatformItemListViewGraph = PlatformItemListViewGraph.init()
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
        assertUnimplemented()
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
        assertUnimplemented()
    }
    
    func requestUpdate(after time: Double) {
        assertUnimplemented()
    }
    
    func beginTransaction() {
        assertUnimplemented()
    }
}

extension MainMenuItemHost {
    struct RootView: View {
        fileprivate private(set) var itemContent: MainMenuItem.Content
        
        var body: some View {
            assertUnimplemented()
        }
    }
}

protocol MainMenuItemHostDelegate: AnyObject {
    // TODO
}

struct MenuBuilderContext {
    private var placementKind: MenuBuilderContext.PlacementKind = .unknown
    private var keyCommandMap: [KeyCommandID : () -> Void] = [:]
    private var placementMap = MenuBuilderContext.PlacementMap()
    private var menuElements: [UIMenuElement] = []
    private var operationMap: [UIMenuElement: CommandOperation] = [:]
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
    struct Content: Sendable {
        fileprivate private(set) var item: MainMenuItem
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
