// CE84B1BFBEAEAB6361605407E54625A3
internal import AttributeGraph
private import Foundation
@_spi(Internal) internal import MySwiftUICore
private import ObjectiveC

struct PlatformItemListViewGraph {
    private var rootList = WeakAttribute<PlatformItemList>()
    private var wasReadSinceLastUpdate: Bool = false
    private var needsUpdate: Bool = false
    
    @discardableResult
    fileprivate mutating func readAndUpdate(graph: ViewGraph) -> PlatformItemList {
        /*
         self -> x20 -> x19
         graph -> x0 -> x22
         */
        guard var (list, changed) = rootList.changedValue(options: []) else {
            return PlatformItemList(items: [])
        }
        
        self.wasReadSinceLastUpdate = true
        
        if graph.data.isHiddenForReuse {
            list = PlatformItemList(items: [])
        }
        
        // <+200>
        if needsUpdate || changed {
            // <+212>
            self.wasReadSinceLastUpdate = false
            self.needsUpdate = false
            
            if
                let delegate = graph.delegate,
                let casted = delegate.as(PlatformItemListHost.self)
            {
                casted.platformItemListDidChange { 
                    // $s7SwiftUI25PlatformItemListViewGraphV13readAndUpdate33_5ABD7A14C7C58F4077FE3D37EE0D7F9DLL5graphAA0cdE0VAA0fG0C_tFAHyXEfU_TA
                    assertUnimplemented()
                }
            }
        }
        
        // <+384>
        return list
    }
}

extension PlatformItemListViewGraph: ViewGraphFeature {
    mutating func modifyViewInputs(inputs: inout _ViewInputs, graph: ViewGraph) {
        if graph.requestedOutputs.isSuperset(of: .platformItemList) {
            inputs.addPlatformItemListKey(flags: AllPlatformItemListFlags.self, editOperation: nil)
            wasReadSinceLastUpdate = true
        }
    }
    
    mutating func modifyViewOutputs(outputs: inout _ViewOutputs, inputs: _ViewInputs, graph: ViewGraph) {
        /*
         self = x19
         outputs = x20
         */
        let items: Attribute<PlatformItemList>? = unsafe outputs.preferences[PlatformItemList.Key.self]
        self.rootList = WeakAttribute(items)
    }
    
    func uninstantiate(graph: ViewGraph) {
        assertUnimplemented()
    }
    
    func isHiddenForReuseDidChange(graph: ViewGraph) {
        assertUnimplemented()
    }
    
    func allowsAsyncUpdate(graph: ViewGraph) -> Bool? {
        assertUnimplemented()
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
    
    mutating func update(graph: ViewGraph) {
        guard needsUpdate else {
            return
        }
        
        if graph.requestedOutputs.isSuperset(of: .platformItemList) {
            readAndUpdate(graph: graph)
        }
    }
}

struct PlatformItemList {
    fileprivate var items: [PlatformItemList.Item]
}

extension PlatformItemList {
    fileprivate struct Key: @unsafe PreferenceKey {
        static nonisolated(unsafe) let defaultValue = PlatformItemList(items: [])
        
        static func reduce(value: inout PlatformItemList, nextValue: () -> PlatformItemList) {
            value.items.append(contentsOf: nextValue().items)
        }
    }
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

struct AllPlatformItemListFlags: PlatformItemListFlags {
    static var flags: PlatformItemListFlagsSet {
        return PlatformItemListFlagsSet(rawValue: .max)
    }
}

extension ViewRendererHost {
    var platformItemList: PlatformItemList {
        return self.updateViewGraph { graph in
            // $s7SwiftUI16ViewRendererHostPAAE16platformItemListAA08PlatformgH0VvgAfA0C5GraphCXEfU_
            Update.assertIsActive()
            graph.instantiateIfNeeded()
            
            guard let platformItemListViewGraph = unsafe graph[PlatformItemListViewGraph.self] else {
                return PlatformItemList(items: [])
            }
            
            return unsafe platformItemListViewGraph.pointee.readAndUpdate(graph: graph)
        }
    }
}

extension _ViewInputs {
    @_specialize(exported: false, where T == AllPlatformItemListFlags)
//    @_specialize(exported: false, where T == LabelPlatformItemListFlags)
//    @_specialize(exported: false, where T == TextPlatformItemListFlags)
//    @_specialize(exported: false, where T == WidgetMetadataPlatformItemListFlags)
    mutating func addPlatformItemListKey<T: PlatformItemListFlags>(flags: T.Type, editOperation: PlatformItemListFlagsSet.EditOperation?) {
        unsafe self.preferences.add(PlatformItemList.Key.self)
        
        self.requestedTextRepresentation = PlatformItemListTextRepresentable.self
        self.requestedImageRepresentation = PlatformItemListImageRepresentable.self
        self.requestedNamedImageRepresentation = PlatformItemListNamedImageRepresentable.self
        self.requestedSpacerRepresentation = PlatformItemListSpacerRepresentable.self
        
        // inlined
        self.requestedDividerRepresentation = PlatformItemListDividerRepresentable.self
        
        // inlined
        self.requestedViewThatFitsRepresentation = PlatformItemListViewThatFitsRepresentable.self
        
        self.requestedHiddenRepresentation = PlatformItemListHiddenRepresentable.self
        
        // inlined
        self.requestedDynamicHiddenRepresentation = PlatformItemListDynamicHiddenRepresentable.self
        
        // <+440>
        if let editOperation {
            switch editOperation {
            case .unknown0:
                // <+460>
                self[PlatformItemListFlagsInput.self] = []
            case .unknown1:
                // <+520>
                self[PlatformItemListFlagsInput.self].formUnion(T.flags)
            }
        }
    }
    
    mutating func makeRootAccessibilityRelationshipScope() {
        if unsafe self[AccessibilityRelationshipScope.self] == nil {
            unsafe self[AccessibilityRelationshipScope.self] = AccessibilityRelationshipScope()
        }
    }
}

struct PlatformItemListTextRepresentable: PlatformTextRepresentable {
    static func shouldMakeRepresentation(inputs: MySwiftUICore._ViewInputs) -> Bool {
        assertUnimplemented()
    }
    
    static func representationOptions(inputs: MySwiftUICore._ViewInputs) -> MySwiftUICore.PlatformTextRepresentationOptions {
        assertUnimplemented()
    }
    
    static func makeRepresentation(inputs: MySwiftUICore._ViewInputs, context: AttributeGraph.Attribute<MySwiftUICore.PlatformTextRepresentableContext>, outputs: inout MySwiftUICore._ViewOutputs) {
        assertUnimplemented()
    }
}

extension PlatformItemListTextRepresentable {
    fileprivate struct PlatformRepresentation {
        @Attribute private var context: PlatformTextRepresentableContext
    }
}

struct PlatformItemListImageRepresentable: PlatformImageRepresentable {
    static func shouldMakeRepresentation(inputs: MySwiftUICore._ViewInputs) -> Bool {
        assertUnimplemented()
    }
    
    static func makeRepresentation(inputs: MySwiftUICore._ViewInputs, context: AttributeGraph.Attribute<MySwiftUICore.PlatformImageRepresentableContext>, outputs: inout MySwiftUICore._ViewOutputs) {
        assertUnimplemented()
    }
}

extension PlatformItemListImageRepresentable {
    fileprivate struct PlatformRepresentation {
        @Attribute private var context: PlatformImageRepresentableContext
    }
}

struct PlatformItemListNamedImageRepresentable: PlatformNamedImageRepresentable {
    static func shouldMakeRepresentation(inputs: MySwiftUICore._ViewInputs) -> Bool {
        assertUnimplemented()
    }
    
    static func makeRepresentation(inputs: MySwiftUICore._ViewInputs, context: AttributeGraph.Attribute<MySwiftUICore.PlatformNamedImageRepresentableContext>, outputs: inout MySwiftUICore._ViewOutputs) {
        assertUnimplemented()
    }
}

extension PlatformItemListNamedImageRepresentable {
    fileprivate struct NamedResolvedRule {
        @Attribute private var context: Attribute<PlatformNamedImageRepresentableContext>
    }
}

struct PlatformItemListSpacerRepresentable: PlatformSpacerRepresentable {
    static func shouldMakeRepresentation(inputs: MySwiftUICore._ViewInputs) -> Bool {
        assertUnimplemented()
    }
    
    static func makeRepresentation(inputs: MySwiftUICore._ViewInputs, outputs: inout MySwiftUICore._ViewOutputs) {
        assertUnimplemented()
    }
}

struct PlatformItemListDividerRepresentable: PlatformDividerRepresentable {
    static func shouldMakeRepresentation(inputs: MySwiftUICore._ViewInputs) -> Bool {
        assertUnimplemented()
    }
    
    static func makeRepresentation(inputs: MySwiftUICore._ViewInputs, outputs: inout MySwiftUICore._ViewOutputs) {
        assertUnimplemented()
    }
}

struct PlatformItemListViewThatFitsRepresentable: PlatformViewThatFitsRepresentable {
    static func shouldMakeRepresentation(inputs: MySwiftUICore._ViewInputs) -> Bool {
        assertUnimplemented()
    }
    
    static func makeRepresentation(inputs: MySwiftUICore._ViewInputs, state: SizeFittingState, outputs: inout MySwiftUICore._ViewOutputs) {
        assertUnimplemented()
    }
}

extension PlatformItemListViewThatFitsRepresentable {
    fileprivate struct FittingChildrenPlatformItemList {
        private let state: SizeFittingState
    }
}

struct PlatformItemListHiddenRepresentable: PlatformHiddenRepresentable {
    static func makeRepresentation(inputs: inout MySwiftUICore._ViewInputs, allowedKeys: MySwiftUICore.AllowedPreferenceKeysWhileHidden) {
        assertUnimplemented()
    }
}

struct PlatformItemListDynamicHiddenRepresentable: PlatformDynamicHiddenRepresentable  {
    static func shouldMakeRepresentation(inputs: MySwiftUICore._ViewInputs) -> Bool {
        assertUnimplemented()
    }
    
    static func makeRepresentation(inputs: MySwiftUICore._ViewInputs, modifier: AttributeGraph.Attribute<DynamicHiddenModifier>, outputs: inout MySwiftUICore._ViewOutputs) {
        assertUnimplemented()
    }
}

extension PlatformItemListDynamicHiddenRepresentable {
    fileprivate struct PlatformItemListTransform {
        // TODO
    }
}

struct PlatformItemListTransformModifier<T: PlatformItemListFlags>: PrimitiveViewModifier, MultiViewModifier {
    private(set) var transform: (inout PlatformItemList) -> Void
    
    static nonisolated func _makeView(modifier: _GraphValue<PlatformItemListTransformModifier<T>>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        // <+188>
        // x22
        var outputs = body(_Graph(), inputs)
        // x29 - 0x60
        let platformItemListFlags = inputs[PlatformItemListFlagsInput.self]
        
        if
            unsafe ((T.flags.rawValue & ~platformItemListFlags.rawValue) == 0) &&
                inputs.preferences.contains(PlatformItemList.Key.self)
        {
            // <+368>
            let modifierAttribute = modifier.value
            let platformItemList = unsafe outputs[PlatformItemList.Key.self]
            let transformRule = PlatformItemListTransformModifier.Transform(modifier: modifierAttribute, _list: OptionalAttribute(platformItemList))
            let transformAttribute = Attribute(transformRule)
            
            unsafe outputs[PlatformItemList.Key.self] = transformAttribute
        }
        
        // <+660>
        return outputs
    }
}

extension PlatformItemListTransformModifier {
    fileprivate struct Transform: Rule {
        @Attribute private(set) var modifier: PlatformItemListTransformModifier<T>
        private(set) var _list: OptionalAttribute<PlatformItemList>
        
        var list: PlatformItemList? {
            return _list.wrappedValue
        }
        
        var value: PlatformItemList {
            var list = self.list ?? PlatformItemList(items: [])
            self.modifier.transform(&list)
            return list
        }
    }
}
