// 6DB75E0CE0288E045EA78648825F4153
public import MySwiftUICore
internal import AttributeGraph
private import os.log

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

fileprivate struct SheetPresentationModifier<T, U : SheetAnchorProvider> : ViewModifier {
    @Binding private var isPresented: Bool
    @safe private nonisolated(unsafe) var onDismiss: (() -> Void)?
    @safe private nonisolated(unsafe) var sheetContent: () -> T
    private var placement: SheetPreference.Placement
    private var drawsBackground: Bool
    private var anchorProvider: U
    private var activeInspector: Bool?
    
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
    @Namespace var namespace: Namespace.ID // 0x0
    var content: AnyView? // 0x8
    var onDismiss: ((Bool) -> Void)? // 0x10
    var placement: SheetPreference.Placement // 0x20
    var drawsBackground: Bool // 0x21
    var itemID: AnyHashable? // 0x28
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
        self.anchorProvider.preferenceTransformModifier { _, _ in
            // $s7SwiftUI29CoreSheetPresentationModifier33_6DB75E0CE0288E045EA78648825F4153LLV7resolve2inQrAA17EnvironmentValuesV_tFyAA0D10PreferenceV5ValueOz_AA11TransactionVtcfU_TA
            assertUnimplemented()
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
    // TODO
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
        static let defaultValue: SheetPreference.Value = {
            assertUnimplemented()
        }()
        
        static func reduce(value: inout SheetPreference.Value, nextValue: () -> SheetPreference.Value) {
            assertUnimplemented()
        }
    }
    
    enum Value {
        case notPresented(views: [Namespace.ID: Transaction])
        case sheet(SheetPreference)
        case unspecified
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

fileprivate struct SheetContent<T> : View {
    private(set) var content: T
    
    var body: some View {
        assertUnimplemented()
    }
}

struct EntityPresentationContext {
    // TODO
}

extension EntityPresentationContext {
    struct Source {
        // TODO
    }
    
    struct Input : ViewInput {
        static let defaultValue = OptionalAttribute<EntityPresentationContext.Source>()
    }
    
    struct InputWriter {
        // TODO
    }
    
    struct PreferenceTransformModifier<T : PreferenceKey> : PrimitiveViewModifier, MultiViewModifier {
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
        
        var value: (inout T.Value) -> Void {
            assertUnimplemented()
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
