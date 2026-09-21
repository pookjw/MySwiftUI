// E16FB36220E60E9D0940B6710E02DAD2
internal import AttributeGraph
private import CoreGraphics

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
extension View {
    @inlinable nonisolated public func overlayPreferenceValue<K, V>(_ key: K.Type, alignment: Alignment = .center, @ViewBuilder _ transform: @escaping (K.Value) -> V) -> some View where K : PreferenceKey, V : View {
        return modifier(_OverlayPreferenceModifier<K, V>(
            alignment: alignment, transform: transform))
    }
    
    @inlinable nonisolated public func backgroundPreferenceValue<K, V>(_ key: K.Type, alignment: Alignment = .center, @ViewBuilder _ transform: @escaping (K.Value) -> V) -> some View where K : PreferenceKey, V : View {
        return modifier(_BackgroundPreferenceModifier<K, V>(
            alignment: alignment, transform: transform))
    }
}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
@frozen public struct _OverlayPreferenceModifier<Key, Overlay> where Key : PreferenceKey, Overlay : View {
    public var transform: (Key.Value) -> Overlay
    public var alignment: Alignment
    
    @inlinable public init(alignment: Alignment, @ViewBuilder transform: @escaping (Key.Value) -> Overlay) {
        self.transform = transform
        self.alignment = alignment
    }
    
    nonisolated public static func _makeView(
        modifier: _GraphValue<_OverlayPreferenceModifier<Key, Overlay>>,
        inputs: _ViewInputs,
        body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs
    ) -> _ViewOutputs {
        return makeSecondaryPreferenceView(
            modifier: modifier.value,
            inputs: inputs,
            body: body,
            flipOrder: false
        )
    }
    
    @available(iOS 16.0, tvOS 16.0, watchOS 9.0, macOS 13.0, *)
    public typealias Body = Never
}

@available(*, unavailable)
extension _OverlayPreferenceModifier : Sendable {
}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
extension _OverlayPreferenceModifier : ViewModifier {}
extension _OverlayPreferenceModifier : MultiViewModifier {}
extension _OverlayPreferenceModifier : PrimitiveViewModifier {}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
@frozen public struct _BackgroundPreferenceModifier<Key, Overlay> where Key : PreferenceKey, Overlay : View {
    public var transform: (Key.Value) -> Overlay
    public var alignment: Alignment
    
    @inlinable public init(alignment: Alignment, @ViewBuilder transform: @escaping (Key.Value) -> Overlay) {
        self.transform = transform
        self.alignment = alignment
    }
    
    nonisolated public static func _makeView(
        modifier: _GraphValue<_BackgroundPreferenceModifier<Key, Overlay>>,
        inputs: _ViewInputs,
        body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs
    ) -> _ViewOutputs {
        /*
         modifier -> x0 -> w26
         inputs -> x1
         body -> x2/x3 -> x23/x22
         */
        // sp + 0x10
        let copy_1 = inputs
        let casted = modifier.unsafeBitCast(to: _OverlayPreferenceModifier<Key, Overlay>.self)
        
        return makeSecondaryPreferenceView(
            modifier: casted.value,
            inputs: copy_1,
            body: body,
            flipOrder: true
        )
    }
    
    @available(iOS 16.0, tvOS 16.0, watchOS 9.0, macOS 13.0, *)
    public typealias Body = Never
}

@available(*, unavailable)
extension _BackgroundPreferenceModifier : Sendable {
}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
extension _BackgroundPreferenceModifier : ViewModifier {}
extension _BackgroundPreferenceModifier : MultiViewModifier {}
extension _BackgroundPreferenceModifier : PrimitiveViewModifier {}

fileprivate func makeSecondaryPreferenceView<T : PreferenceKey, U : View>(
    modifier: Attribute<_OverlayPreferenceModifier<T, U>>,
    inputs: _ViewInputs,
    body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs,
    flipOrder: Bool
) -> _ViewOutputs {
    /*
     modifier -> w0 -> w27
     inputs -> x1
     body -> x2/x3 -> x19 + 0x58 / x19 + 0x60
     flipOrder -> w4 -> x19 + 0x4c
     */
    // x19 + 0x220 (sp + 0x320)
    let copy_1 = inputs
    // x19 + 0x160 (sp + 0x260)
    var copy_2 = inputs
    // x19 + 0x1c0 (sp + 0x1c0)
    let copy_3 = copy_1
    // x28 + 0x60 (sp + 0x160)
    let copy_4 = inputs.base
    
    // <+188>
    copy_2.preferences.add(T.self)
    // inlined
    copy_2.base.pushStableIndex(0)
    
    // <+216>
    // x19 + 0x24 (sp + 0x24)
    let size = copy_1.size
    // x19 + 0xc (sp + 0xc)
    let position = copy_1.position
    // x19 + 0x1c0 (sp + 0x1c0)
    let outputs_1 = body(_Graph(), copy_2)
    // x19 + 0x58 (sp + 0x58)
    let copy_5 = outputs_1
    
    let query = Attribute(
        SecondaryLayerGeometryQuery(
            alignment: OptionalAttribute(modifier.alignment),
            layoutDirection: copy_1.layoutDirection,
            primaryPosition: position,
            primarySize: size,
            primaryLayoutComputer: OptionalAttribute(copy_5.layoutComputer),
            secondaryLayoutComputer: OptionalAttribute()
        )
    )
    
    // <+516>
    // x28 (sp + 0x100)
    var copy_6 = copy_1
    // x19 + 0x1c0 (sp + 0x1c0)
    let copy_7 = copy_1
    
    // <+564>
    copy_6.position = query.origin
    copy_6.size = query.dimensions.size
    
    // <+632>
    copy_6.implicitRootType = _ZStackLayout.self
    copy_6.base.pushStableIndex(1)
    
    // <+692>
    // x19 + 0x78 (sp + 0x78)
    let copy_8 = outputs_1
    let value = copy_8[T.self]
    
    let newBody: (_Graph, _ViewInputs) -> _ViewOutputs = { _, incoming in
        // $s7SwiftUI27makeSecondaryPreferenceView33_E16FB36220E60E9D0940B6710E02DAD2LL8modifier6inputs4body9flipOrderAA01_F7OutputsV14AttributeGraph0U0VyAA08_OverlayE8ModifierVyxq_GG_AA01_F6InputsVAiA01_V0V_ARtcSbtAA0E3KeyRzAA0F0R_r0_lFAiT_ARtcfU0_
        assertUnimplemented()
    }
    
    // x19 + 0xa0 (sp + 0xa0)
    let copy_9 = copy_4
    // x19 + 0x1c0 (sp + 0x1c0)
    let copy_10 = copy_4
    
    // x19 + 0x68 (sp + 0xc8)
    let outputs_2: _ViewOutputs
    
    if IsVisionEnabledPredicate.evaluate(inputs: copy_9) {
        // <+880>
        var x190x9c: Attribute<ViewTransform>? = nil
        
        // x19 + 0xa0 (sp + 0xa0)
        let copy_11 = copy_6
        
        outputs_2 = _ViewOutputs.makeDepthTransform(
            inputs: copy_11,
            geometry: {
                // $s7SwiftUI25makePlatformSecondaryView13primaryInputs0G7Outputs09secondaryH09flipOrder4bodyAA01_fI0VAA01_fH0V_AiKSbAiA6_GraphV_AKtctF09AttributeN00O0VyAA0F13DepthGeometryVGyXEfU_TA.19
                assertUnimplemented()
            },
            body: { inputs in
                // $s7SwiftUI27ViewModifierContentProvider33_2BA0A33A15B7F322F46AFB9D0D1A262DLLPAAE012providerMakeC4List4view6inputsAA01_cS7OutputsVAA11_GraphValueVyxG_AA01_cS6InputsVtFZAA01_cV0VAA01_cY0VcfU_TA.110
                return newBody(_Graph(), inputs)
            }
        )
        
        if let x190x9c {
            // <+1196>
            x190x9c.mutateBody(as: RootDepthTransform.self, invalidating: true) { transform in
                transform.$childLayoutComputer = outputs_2.layoutComputer
            }
            
            // <+1316>
        } else {
            // <+1316>
        }
    } else {
        // <+1100>
        // x19 + 0xa0 (sp + 0xa0)
        let copy_11 = copy_6
        outputs_2 = newBody(_Graph(), copy_11)
        // <+1316>
    }
    
    // <+1320>
    assertUnimplemented()
}

struct SecondaryLayerGeometryQuery : Rule, AsyncAttribute {
    @OptionalAttribute var alignment: Alignment?
    @Attribute var layoutDirection: LayoutDirection
    @Attribute var primaryPosition: CGPoint
    @Attribute var primarySize: ViewSize
    @OptionalAttribute var primaryLayoutComputer: LayoutComputer?
    @OptionalAttribute var secondaryLayoutComputer: LayoutComputer?
    
    init(
        alignment: OptionalAttribute<Alignment>,
        layoutDirection: Attribute<LayoutDirection>,
        primaryPosition: Attribute<CGPoint>,
        primarySize: Attribute<ViewSize>,
        primaryLayoutComputer: OptionalAttribute<LayoutComputer> = OptionalAttribute(),
        secondaryLayoutComputer: OptionalAttribute<LayoutComputer> = OptionalAttribute()
    ) {
        self._alignment = alignment
        self._layoutDirection = layoutDirection
        self._primaryPosition = primaryPosition
        self._primarySize = primarySize
        self._primaryLayoutComputer = primaryLayoutComputer
        self._secondaryLayoutComputer = secondaryLayoutComputer
    }
    
    var value: ViewGeometry {
        assertUnimplemented()
    }
}
