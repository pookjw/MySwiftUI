// 6DB75E0CE0288E045EA78648825F4153
public import MySwiftUICore
internal import AttributeGraph
private import os.log
private import CoreGraphics
private import Spatial

extension View {
    nonisolated public func sheet<Item, Content>(
        item: Binding<Item?>,
        onDismiss: (() -> Void)? = nil,
        @ViewBuilder content: @escaping (Item) -> Content
    ) -> some View where Item : Identifiable, Content : View {
        assertUnimplemented()
    }
    
    nonisolated public func sheet<Content>(
        isPresented: Binding<Bool>,
        onDismiss: (() -> Void)? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View where Content : View {
        let modifier = SheetPresentationModifier<Content, NullSheetAnchor<SheetPreference.Key>>(
            isPresented: isPresented,
            onDismiss: onDismiss,
            sheetContent: content,
            placement: .automatic,
            drawsBackground: true
        )
        
        return self.modifier(modifier)
    }
}

fileprivate struct ItemSheetPresentationModifier {
    // TODO
}

fileprivate struct SheetPresentationModifier<T : View, U : SheetAnchorProvider> : ViewModifier {
    @Binding private var isPresented: Bool // 0x0
    @safe private nonisolated(unsafe) var onDismiss: (() -> Void)? // 0x8
    @safe private nonisolated(unsafe) var sheetContent: () -> T // 0x18
    private var placement: SheetPreference.Placement // 0x30
    private var drawsBackground: Bool // 0x34
    private var anchorProvider: U // 0x44 (offset field)
    private var activeInspector: Bool? // 0x48 (offset field)
    
    func body(content: Content) -> some View {
        /*
         self -> x20 -> x23
         content -> x0 -> x29 - 0xd0
         */
        // <+684>
        content
            .modifier(
                CoreSheetPresentationModifier(
                    content: self.isPresented ? AnyView(
                        SheetContent(content: self.sheetContent())
                            .environment(
                                \.presentationMode,
                                 self
                                    .$isPresented
                                    .projecting(PresentationMode.FromIsPresented())
                            )
                    ) : nil,
                    onDismiss: { _ in
                        // $s7SwiftUI25SheetPresentationModifier33_6DB75E0CE0288E045EA78648825F4153LLV4body7contentQrAA05_ViewE8_ContentVyADyxq_GG_tFySbcfU0_TA
                        assertUnimplemented()
                    },
                    placement: self.placement,
                    drawsBackground: self.drawsBackground,
                    itemID: nil,
                    anchorProvider: self.anchorProvider,
                    activeInspector: self.activeInspector
                )
            )
            .modifier(
                EntityPresentationContext
                    .PreferenceTransformModifier<SheetPreference.Key>()
            )
    }
}

extension SheetPresentationModifier where U == NullSheetAnchor<SheetPreference.Key> {
    nonisolated init(
        isPresented: Binding<Bool>,
        onDismiss: (() -> Void)?,
        sheetContent: @escaping () -> T,
        placement: SheetPreference.Placement,
        drawsBackground: Bool
    ) {
        self._isPresented = isPresented
        self.onDismiss = onDismiss
        self.sheetContent = sheetContent
        self.placement = placement
        self.drawsBackground = drawsBackground
        self.anchorProvider = NullSheetAnchor<SheetPreference.Key>()
        self.activeInspector = nil
    }
}

fileprivate struct CoreSheetPresentationModifier<T : SheetAnchorProvider> : EnvironmentalModifier {
    @Namespace nonisolated var namespace: Namespace.ID // 0x0
    @safe nonisolated(unsafe) var content: AnyView? // 0x8
    @safe nonisolated(unsafe) var onDismiss: ((Bool) -> Void)? // 0x10
    var placement: SheetPreference.Placement // 0x20
    var drawsBackground: Bool // 0x21
    @safe nonisolated(unsafe) var itemID: AnyHashable? // 0x28
    @safe nonisolated(unsafe) var anchorProvider: T // 0x38 (offset field)
    var activeInspector: Bool? // 0x3c (offset field)
    
    nonisolated static var _tracksEnvironmentDependencies: Bool {
        return !isLinkedOnOrAfter(.v5)
    }

    nonisolated func resolve(in environment: EnvironmentValues) -> some ViewModifier {
        /*
         self -> x20 -> x21/x20 - 0xa8
         environment -> x0 -> x29 - 0x78
         */
        // <+252>
        self.anchorProvider.preferenceTransformModifier { value, transaction in
            // $s7SwiftUI29CoreSheetPresentationModifier33_6DB75E0CE0288E045EA78648825F4153LLV7resolve2inQrAA17EnvironmentValuesV_tFyAA0D10PreferenceV5ValueOz_AA11TransactionVtcfU_TA
            /*
             value -> x0 -> x19
             transaction -> x1 -> x25
             environment -> x2 -> x21
             self -> x3 -> x20
             */
            // <+164>
            // x23
            var copy_1 = environment
            ResetGlassEnvironmentModifier.makeEnvironment(&copy_1)
            // x28
            let copy_2 = value
            
            if let content {
                // <+232>
                switch copy_2 {
                case .notPresented(_):
                    // <+364>
                    // <+412>
                    break
                case .sheet(_):
                    // <+264>
                    Log.externalWarning("Currently, only presenting a single sheet is supported.\nThe next sheet will be presented when the currently presented sheet gets dismissed.")
                    // <+328>
                    return
                case .unspecified:
                    // <+396>
                    // <+412>
                    break
                }
                
                // <+412>
                let preference = SheetPreference(
                    content: content,
                    onDismiss: self.onDismiss,
                    viewID: self.namespace,
                    itemID: self.itemID,
                    placement: self.placement,
                    drawsBackground: self.drawsBackground,
                    transaction: transaction,
                    environment: copy_1,
                    activeInspector: self.activeInspector,
                    entityContext: nil,
                    sourceRect: nil
                )
                
                value = .sheet(preference)
            } else {
                // <+296>
                switch copy_2 {
                case .notPresented(var views):
                    // <+668>
                    views[self.namespace] = transaction
                    value = .notPresented(views: views)
                case .sheet(_):
                    // <+328>
                    break
                case .unspecified:
                    // <+772>
                    value = .notPresented(views: [self.namespace: transaction])
                }
            }
        }
        .requiring(AllowPresentationPredicate.self)
    }
}

fileprivate protocol SheetAnchorProvider {
    associatedtype Modifier : ViewModifier

    nonisolated func preferenceTransformModifier(
        for transform: @escaping (inout SheetPreference.Value, Transaction) -> Void
    ) -> Modifier
}

fileprivate struct NullSheetAnchor<T : PreferenceKey> : SheetAnchorProvider where T.Value == SheetPreference.Value {
    typealias Modifier = TransactionalPreferenceTransformModifier<T>

    nonisolated func preferenceTransformModifier(
        for transform: @escaping (inout SheetPreference.Value, Transaction) -> Void
    ) -> Modifier {
        return TransactionalPreferenceTransformModifier<T>(transform: transform)
    }
}

struct SheetPreference {
    private(set) var content: AnyView // 0x0
    fileprivate private(set) var onDismiss: ((Bool) -> Void)? // 0x8
    private(set) var viewID: Namespace.ID // 0x18
    fileprivate private(set) var itemID: AnyHashable? // 0x20
    private(set) var placement: SheetPreference.Placement // 0x48
    private(set) var drawsBackground: Bool // 0x49
    private(set) var transaction: Transaction // 0x50
    private(set) var environment: EnvironmentValues // 0x58 (0x2c - offset field)
    fileprivate private(set) var activeInspector: Bool? // 0x68
    private(set) var entityContext: EntityPresentationContext? // 0x70 (0x34 - offset field)
    private(set) var sourceRect: Anchor<CGRect>? // 0xe0
}

extension SheetPreference {
    enum Placement {
        case automatic
        case overFullScreen
        case formSheet
        case blurOverFullScreen
        case fullScreenSheet
        case popover
        case pageSheet
    }
    
    struct InspectorKey : HostPreferenceKey {
        @safe static nonisolated(unsafe) let defaultValue = SheetPreference.Value.unspecified
        
        static func reduce(value: inout SheetPreference.Value, nextValue: () -> SheetPreference.Value) {
            assertUnimplemented()
        }
    }
    
    enum Value : CustomDebugStringConvertible, EntityPresentationContextAware {
        case notPresented(views: [Namespace.ID: Transaction])
        case sheet(SheetPreference)
        case unspecified
        
        var viewIDs: Set<Namespace.ID> {
            assertUnimplemented()
        }
        
        var debugDescription: String {
            assertUnimplemented()
        }
        
        mutating func setEntityContext(_ context: EntityPresentationContext?) {
            /*
             self -> x20
             context -> x0 -> x26
             */
            // <+260>
            switch self {
            case .notPresented(_):
                // <+432>
                break
            case .sheet(var preference):
                // <+324>
                preference.entityContext = context
                self = .sheet(preference)
            case .unspecified:
                // <+460>
                break
            }
        }
        
        func dismissalTransaction(for id: Namespace.ID) -> Transaction? {
            assertUnimplemented()
        }
    }
    
    struct Key : HostPreferenceKey {
        static var defaultValue: SheetPreference.Value {
            return .unspecified
        }
        
        static func reduce(value: inout SheetPreference.Value, nextValue: () -> SheetPreference.Value) {
            assertUnimplemented()
        }
    }
}

fileprivate struct SheetContent<T : View> : View {
    private(set) var content: T
    
    var body: some View {
        // <+1256>
        self.content
            .styleContext(.sheet)
            .renderContainerBackgroundInHostingView(ContainerBackgroundKeys.PresentationKey.self)
            .environment(\.tintAdjustmentMode, nil)
            .resetScrollEnvironment()
            .resetListStackBehavior()
            .resetSearchEnvironment()
            .resetFormEnvironment()
            .resetTabViewEnvironment()
            .environment(\.menuIndicatorProminenceReduced, false)
            .clearNavigationContext()
            .clearSharingPickerHost()
    }
}

struct EntityPresentationContext {
    fileprivate private(set) var entityId: UInt64
    fileprivate private(set) var contentSize: Size3D
    fileprivate private(set) var transform: ViewTransform
}

extension EntityPresentationContext {
    struct Source {
        fileprivate private(set) var entityId: UInt64
        fileprivate private(set) var transform: Attribute<ViewTransform>
        fileprivate private(set) var position: Attribute<CGPoint>
        fileprivate private(set) var size: Attribute<ViewSize>
    }
    
    struct Input : ViewInput {
        static let defaultValue = OptionalAttribute<EntityPresentationContext.Source>()
    }
    
    struct InputWriter {
        // TODO
    }
    
    struct PreferenceTransformModifier<T : PreferenceKey> : PrimitiveViewModifier, MultiViewModifier where T.Value : EntityPresentationContextAware {
        nonisolated static func _makeView(
            modifier: _GraphValue<EntityPresentationContext.PreferenceTransformModifier<T>>,
            inputs: _ViewInputs,
            body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs
        ) -> _ViewOutputs {
            let contextSource = inputs[EntityPresentationContext.Input.self]
            var outputs = body(_Graph(), inputs)
            let transform = Attribute(
                EntityPresentationContext
                    .PreferenceTransformModifier<T>
                    .Transform(contextSource: contextSource)
                )
            
            outputs.preferences.makePreferenceTransformer(
                inputs: inputs.preferences,
                key: T.self,
                transform: transform
            )
            
            return outputs
        }
    }
}

extension EntityPresentationContext.InputWriter {
    struct Value {
        // TODO
    }
}

extension EntityPresentationContext.PreferenceTransformModifier {
    struct Transform : Rule, AsyncAttribute {
        @OptionalAttribute var contextSource: EntityPresentationContext.Source?
        
        fileprivate var context: EntityPresentationContext? {
            // <+160>
            guard let contextSource else {
                return nil
            }
            
            // <+256>
            let entityId = contextSource.entityId
            let transform_1 = contextSource.transform.value
            let position = contextSource.position.value
            let size = contextSource.size.value
            
            let contentSize = Size3D(size.value, depth: transform_1.depth.value)
            let transform_2 = transform_1.withPosition(position)
            
            return EntityPresentationContext(
                entityId: contextSource.entityId,
                contentSize: contentSize,
                transform: transform_2
            )
        }
        
        var value: (inout T.Value) -> Void {
            let context = self.context
            
            return { value in
                // $s7SwiftUI25EntityPresentationContextV27PreferenceTransformModifierV0G0V5valueyy5ValueQzzcvgyAJzcfU_TA
                value.setEntityContext(context)
            }
        }
    }
}

struct AllowPresentationPredicate : ViewInputPredicate {
    static func evaluate(inputs: _GraphInputs) -> Bool {
        if inputs[IsInImmersiveContext.self] {
            Log.externalWarning("Presentations are not currently supported in Immersive contexts.")
            return false
        } else {
            if inputs[IsInVolumetricContext.self] {
                if isLinkedOnOrAfter(.v7) {
                    return true
                } else {
                    Log.externalWarning("Presentations are not currently supported in Immersive contexts.")
                    return false
                }
            } else {
                return true
            }
        }
    }
}

protocol EntityPresentationContextAware {
    mutating func setEntityContext(_ context: EntityPresentationContext?)
}
