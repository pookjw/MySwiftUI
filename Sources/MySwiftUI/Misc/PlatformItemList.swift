internal import AttributeGraph
private import Foundation
private import MySwiftUICore
private import ObjectiveC

struct PlatformItemListViewGraph {
    private var rootList = WeakAttribute<PlatformItemList>()
    private var wasReadSinceLastUpdate: Bool = false
    private var needsUpdate: Bool = false
    
    private func readAndUpdate(graph: ViewGraph) {
        fatalError("TODO")
    }
}

extension PlatformItemListViewGraph: ViewGraphFeature {
    func modifyViewInputs(inputs: inout _ViewInputs, graph: ViewGraph) {
        fatalError("TODO")
    }
    
    func modifyViewOutputs(outputs: inout _ViewOutputs, inputs: _ViewInputs, graph: ViewGraph) {
        fatalError("TODO")
    }
    
    func uninstantiate(graph: ViewGraph) {
        fatalError("TODO")
    }
    
    func isHiddenForReuseDidChange(graph: ViewGraph) {
        fatalError("TODO")
    }
    
    func allowsAsyncUpdate(graph: ViewGraph) -> Bool? {
        fatalError("TODO")
    }
    
    mutating func needsUpdate(graph: ViewGraph) -> Bool {
        guard !needsUpdate else {
            return true
        }
        
        guard !wasReadSinceLastUpdate else {
            return false
        }
        
        guard graph.requestedOutputs.isSuperset(of: .platformItemList) else {
            return false
        }
        
        guard rootList.wrappedValue != nil else {
            return false
        }
        
        needsUpdate = true
        return true
    }
    
    func update(graph: ViewGraph) {
        guard needsUpdate else {
            return
        }
        
        if graph.requestedOutputs.isSuperset(of: .platformItemList) {
            readAndUpdate(graph: graph)
        }
    }
}

struct PlatformItemList {
    private var items: [PlatformItemList.Item]
}

extension PlatformItemList {
    struct Item {
        private var text: NSAttributedString?
        private var secondaryText: NSAttributedString?
        private var platformIdentifier: String?
        private var isExternal: Bool
        private var hierarchicalLevel: Int
        private var imageColorResolver: PlatformItemList.Item.ImageColorResolver?
        private var isEnabled: Bool
        private var resolvedImage: Image.Resolved?
        private var namedResolvedImage: Image.NamedResolved?
        private var systemItem: PlatformItemList.Item.SystemItem?
        private var selectionBehavior: PlatformItemList.Item.SelectionBehavior?
        private var keyboardShortcut: KeyboardShortcut?
        private var onHover: (Bool) -> ()?
        private var buttonRole: ButtonRole?
        private var accessibility: PlatformItemList.Item.Accessibility?
        private var secondaryNavigationBehavior: PlatformItemList.Item.SecondaryNavigationBehavior?
        private var label: NSAttributedString?
        private var tooltip: String?
        private var badge: String?
        private var children: PlatformItemList?
        private var labelGroupChildren: PlatformItemList?
        private var menuIndicatorVisibility: Visibility?
        private var controlSize: ControlSize?
        private var toggleState: ToggleState?
        private var commandOperation: CommandOperation?
        private var scaleDownMenuImage: Bool
        private var keepsMenuPresented: Bool
        private var isPopUpButton: Bool?
        private var menuOrder: MenuOrder
        private var menuItemAttributedTitleEnabled: Bool
        private var tint: Color?
    }
}

extension PlatformItemList.Item {
    struct ImageColorResolver {
        private var shapeStyle: AnyShapeStyle
    }
}

extension PlatformItemList.Item {
    enum SystemItem {
        case palette(PaletteSelectionEffect)
        case textField(PlatformTextFieldCoordinator)
        case shareLink(AnyShareConfiguration)
        case divider
        case spacer
        case section
        case labelGroup
        case controlGroup
        case helpLink
        case button
        case menu
    }
}

extension PlatformItemList.Item {
    struct SelectionBehavior {
        private var isMomentary: Bool
        private var isContainerSelection: Bool
        private var yieldsToContainerSelection: Bool
        private var isPickerOption: Bool
        private var visualStyle: PlatformItemList.Item.SelectionBehavior.VisualStyle
        private var onSelect: () -> ()?
        private var onDeselect: () -> ()?
        private var onActivate: (()?) -> Bool?
        private var platformSelector: Selector?
        private var springLoadingBehavior: SpringLoadingBehavior
    }
}

extension PlatformItemList.Item.SelectionBehavior {
    enum VisualStyle {
        case plain
        case checkmark
        case selected
    }
}

extension PlatformItemList.Item {
    struct Accessibility {
        private var properties: AccessibilityProperties
        private var environment: EnvironmentValues
    }
}

extension PlatformItemList.Item {
    struct SecondaryNavigationBehavior {
        private var value: AnyNavigationLinkPresentedValue?
        private var action: () -> ()?
    }
}
