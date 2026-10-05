internal import CoreGraphics
internal import AttributeGraph
internal import Spatial

protocol ShapeStyledLeafView : ContentResponder {
    associatedtype ShapeUpdateData
    static var animatesSize: Bool { get }
    func mustUpdate(data: Self.ShapeUpdateData, position: Attribute<CGPoint>, environment: Attribute<EnvironmentValues>) -> Bool
    func shape(in size: CGSize) -> (shape: _ShapeStyle_RenderedShape.Shape, frame: CGRect)
    static var hasBackground: Bool { get }
    func backgroundShape(in size: CGSize) -> (shape: _ShapeStyle_RenderedShape.Shape, frame: CGRect)
    func isClear(styles: _ShapeStyle_Pack) -> Bool
    func finalPlacement(oldIndex: Int, oldPlacedSubviews: [_LazyLayout_PlacedSubview], newPlacedSubviews: [_LazyLayout_PlacedSubview], wasRemovedFromSubviews: Bool, context: AnyRuleContext) -> _Placement
}

extension ShapeStyledLeafView {
    static nonisolated func makeLeafView(
        view: _GraphValue<Self>,
        inputs: _ViewInputs,
        styles: Attribute<_ShapeStyle_Pack>,
        interpolatorGroup: _ShapeStyle_InterpolatorGroup?,
        data: Self.ShapeUpdateData
    ) -> _ViewOutputs {
        /*
         view -> x0 -> x19
         inputs -> x1 -> x20
         styles -> x2 -> x25
         interpolatorGroup -> x3 -> x26
         data -> x4 -> x29 - 0x190
         return pointer -> x8 -> x21 -> x29 - 0x150
         */
        // <+260>
        var outputs = _ViewOutputs()
        
        if inputs.preferences.contains(DisplayList.Key.self) {
            // <+484>
            let identity: _DisplayList_Identity
            if inputs.base.options.contains(.needsStableDisplayListIDs) {
                identity = inputs[_DisplayList_StableIdentityScope.self].attribute!.value.pushIdentity()
            } else {
                identity = _DisplayList_Identity()
            }
            
            let displayList = ShapeStyledDisplayList<Self>(
                group: interpolatorGroup,
                identity: identity,
                view: view.value,
                styles: styles,
                size: inputs.size[keyPath: \.value],
                animatedSize: inputs.animatedSize(),
                position: inputs.animatedPosition(),
                containerPosition: inputs.containerPosition,
                transform: inputs.transform,
                environment: inputs.environment,
                safeAreaInsets: inputs.safeAreaInsets,
                options: inputs[DisplayList.Options.self],
                data: data,
                contentSeed: DisplayList.Seed()
            )
            
            outputs.preferences[DisplayList.Key.self] = Attribute(displayList)
            // <+1356>
        } else {
            // <+896>
            // <+1356>
        }
        
        // <+1356>
        let filter = ShapeStyledResponderFilter<Self>(
            view: view.value,
            styles: styles,
            size: inputs.animatedSize(),
            position: inputs.animatedPosition(),
            transform: inputs.transform
        )
        
        if inputs.preferences.contains(ViewRespondersKey.self) {
            outputs.preferences[ViewRespondersKey.self] = Attribute(filter)
        }
        
        // <+2084>
        outputs.makeContentPathPreferenceWriter(
            inputs: inputs,
            contentResponder: view.value,
            kinds: OptionalAttribute()
        )
        
        return outputs
    }
    
    static var animatesSize: Bool {
        return true
    }
    
    func contains(points: UnsafeBufferPointer<Point3D>, size: CGSize) -> BitVector64 {
        assertUnimplemented()
    }
    
    func contentPath(size: CGSize) -> Path {
        assertUnimplemented()
    }
    
    static var hasBackground: Bool {
        return false
    }
    
    func backgroundShape(in size: CGSize) -> (shape: _ShapeStyle_RenderedShape.Shape, frame: CGRect) {
        assertUnimplemented()
    }
    
    func isClear(styles: _ShapeStyle_Pack) -> Bool {
        assertUnimplemented()
    }
}

extension ShapeStyledLeafView where ShapeUpdateData == Void {
    func mustUpdate(data: Void, position: Attribute<CGPoint>, environment: Attribute<EnvironmentValues>) -> Bool {
        assertUnimplemented()
    }
    
    static nonisolated func makeLeafView(view: _GraphValue<Self>, inputs: _ViewInputs, styles: Attribute<_ShapeStyle_Pack>, interpolatorGroup: _ShapeStyle_InterpolatorGroup?) -> _ViewOutputs {
        assertUnimplemented()
    }
}

fileprivate struct ShapeStyledDisplayList<T : ShapeStyledLeafView> : AsyncAttribute, StatefulRule {
    private let group: _ShapeStyle_InterpolatorGroup?
    private let identity: _DisplayList_Identity
    @Attribute private var view: Attribute<T>
    @Attribute private var styles: Attribute<_ShapeStyle_Pack>
    @Attribute private var size: Attribute<CGSize>
    @Attribute private var animatedSize: Attribute<ViewSize>
    @Attribute private var position: Attribute<CGPoint>
    @Attribute private var containerPosition: Attribute<CGPoint>
    @Attribute private var transform: Attribute<ViewTransform>
    @Attribute private var environment: Attribute<EnvironmentValues>
    @OptionalAttribute private var safeAreaInsets: SafeAreaInsets?
    private let options: DisplayList.Options
    private let data: T.ShapeUpdateData
    private var contentSeed: DisplayList.Seed
    
    init(
        group: _ShapeStyle_InterpolatorGroup?,
        identity: _DisplayList_Identity,
        view: Attribute<T>,
        styles: Attribute<_ShapeStyle_Pack>,
        size: Attribute<CGSize>,
        animatedSize: Attribute<ViewSize>,
        position: Attribute<CGPoint>,
        containerPosition: Attribute<CGPoint>,
        transform: Attribute<ViewTransform>,
        environment: Attribute<EnvironmentValues>,
        safeAreaInsets: OptionalAttribute<SafeAreaInsets>,
        options: DisplayList.Options,
        data: T.ShapeUpdateData,
        contentSeed: DisplayList.Seed
    ) {
        assertUnimplemented()
    }
    
    typealias Value = DisplayList
    
    func updateValue() {
        assertUnimplemented()
    }
}

fileprivate struct ShapeStyledResponderFilter<T : ShapeStyledLeafView> : StatefulRule {
     @Attribute var view: T
     @Attribute var styles: _ShapeStyle_Pack
     @Attribute var size: ViewSize
     @Attribute var position: CGPoint
     @Attribute var transform: ViewTransform
     let responder: LeafViewResponder<ShapeStyledResponderData<T>>
    
    init(
        view: Attribute<T>,
        styles: Attribute<_ShapeStyle_Pack>,
        size: Attribute<ViewSize>,
        position: Attribute<CGPoint>,
        transform: Attribute<ViewTransform>
    ) {
        assertUnimplemented()
    }
    
    typealias Value = [ViewResponder]
    
    func updateValue() {
        assertUnimplemented()
    }
 }

struct ShapeStyledResponderData<T : ShapeStyledLeafView> : ContentResponder {
    private var view: T
    private var styles: _ShapeStyle_Pack
    
    func contains(points: UnsafeBufferPointer<Point3D>, size: CGSize) -> BitVector64 {
        assertUnimplemented()
    }
    
    func contentPath(size: CGSize) -> Path {
        assertUnimplemented()
    }
    
    func contentPath(size: CGSize, kind: ContentShapeKinds) -> Path {
        assertUnimplemented()
    }
}
