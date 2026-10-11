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
    private let group: _ShapeStyle_InterpolatorGroup? // 0x0
    private let identity: _DisplayList_Identity // 0x8
    @Attribute private var view: T // 0xc
    @Attribute private var styles: _ShapeStyle_Pack // 0x10
    @Attribute private var size: CGSize // 0x14
    @Attribute private var animatedSize: ViewSize // 0x18
    @Attribute private var position: CGPoint // 0x1c
    @Attribute private var containerPosition: CGPoint // 0x20
    @Attribute private var transform: ViewTransform // 0x24
    @Attribute private var environment: EnvironmentValues // 0x28
    @OptionalAttribute private var safeAreaInsets: SafeAreaInsets? // 0x2c
    private let options: DisplayList.Options // 0x30
    private let data: T.ShapeUpdateData // 0x50 (offset field)
    private var contentSeed: DisplayList.Seed // 0x54 (offset field)
    
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
        self.group = group
        self.identity = identity
        self._view = view
        self._styles = styles
        self._size = size
        self._animatedSize = animatedSize
        self._position = position
        self._containerPosition = containerPosition
        self._transform = transform
        self._environment = environment
        self._safeAreaInsets = safeAreaInsets
        self.options = options
        self.data = data
        self.contentSeed = contentSeed
    }
    
    typealias Value = DisplayList
    
    mutating func updateValue() {
        // <+152>
        // x27
        var (view, viewChanged) = self.$view.changedValue(options: [])
        
        let mustUpdate = view.mustUpdate(
            data: self.data,
            position: self.$position,
            environment: self.$environment
        )
        
        let version: DisplayList.Version
        
        if mustUpdate || viewChanged || (self.contentSeed.value == 0) {
            if mustUpdate {
                viewChanged = true
            }
            
            // <+536>
            version = DisplayList.Version(forUpdate: ())
            self.contentSeed = DisplayList.Seed(version)
            // <+604>
        } else {
            // <+296>
            var result = false
            let value = (self.$position.identifier, self.$containerPosition.identifier, self.$view.identifier)
            
            withUnsafePointer(to: value) { pointer in
                // $s7SwiftUI22ShapeStyledDisplayList33_E1641985C375D8826E6966D4F238A1B8LLV11updateValueyyFySPy14AttributeGraph0Q0VySo7CGPointVG_AkHyxGtGXEfU_TA
                result = unsafe AGGraphAnyInputsChanged(
                    UnsafeRawPointer(pointer).assumingMemoryBound(to: AnyAttribute.self),
                    3
                )
            }
            
            version = DisplayList.Version(forUpdate: ())
            
            if result {
                // <+560>
                self.contentSeed = DisplayList.Seed(version)
                // <+604>
            } else {
                // <+604>
            }
        }
        
        // <+604>
        var proxy = GeometryProxy(
            owner: .current!,
            size: self.$animatedSize,
            environment: self.$environment,
            transform: self.$transform,
            position: self.$position,
            safeAreaInsets: self.$safeAreaInsets,
            seed: UInt32(truncatingIfNeeded: version.value)
        )
        
        // d8, d9
        let position = self.position
        // d12, d13
        let containerPosition = self.containerPosition
        // d11, d10
        let size: CGSize
        if T.animatesSize {
            size = self.animatedSize.value
        } else {
            size = self.size
        }
        
        // <+880>
        // x19 + 0x438
        let shape: (shape: _ShapeStyle_RenderedShape.Shape, frame: CGRect) = proxy.asCurrent { 
            // $s7SwiftUI22ShapeStyledDisplayList33_E1641985C375D8826E6966D4F238A1B8LLV11updateValueyyFAA01_c14Style_RenderedC0V0C0O5shape_So6CGRectV5frametyXEfU0_
            return view.shape(in: size)
        }
        
        let offset: (CGFloat, CGFloat) = (position.x - containerPosition.x, position.y - containerPosition.y)
        var layers = _ShapeStyle_RenderedLayers(group: self.group)
        
        if T.hasBackground {
            // <+1148>
            // x19 + 0x1a0
            let backgroundShape: (shape: _ShapeStyle_RenderedShape.Shape, frame: CGRect) = proxy.asCurrent { 
                // $s7SwiftUI22ShapeStyledDisplayList33_E1641985C375D8826E6966D4F238A1B8LLV11updateValueyyFAA01_c14Style_RenderedC0V0C0O5shape_So6CGRectV5frametyXEfU1_
                return view.backgroundShape(in: size)
            }
            
            if case .empty = backgroundShape.shape {
                // <+1732>
            } else {
                let renderedShape = _ShapeStyle_RenderedShape(
                    backgroundShape.shape,
                    frame: backgroundShape.frame.offsetBy(dx: offset.0, dy: offset.1),
                    identity: self.identity,
                    version: version,
                    contentSeed: self.contentSeed,
                    options: self.options,
                    environment: self.$environment
                )
                
                renderedShape.renderItem(
                    name: .background,
                    styles: self.styles, // $s7SwiftUI22ShapeStyledDisplayList33_E1641985C375D8826E6966D4F238A1B8LLV11updateValueyyFAA01_C10Style_PackVyXEfu0_TA
                    layers: &layers
                )
            }
        }
        
        // <+1732>
        var renderedShape = _ShapeStyle_RenderedShape(
            shape.shape,
            frame: shape.frame.offsetBy(dx: offset.0, dy: offset.1),
            identity: self.identity,
            version: version,
            contentSeed: self.contentSeed,
            options: self.options,
            environment: self.$environment
        )
        
        renderedShape.renderItem(
            name: .foreground,
            styles: self.styles, // $s7SwiftUI22ShapeStyledDisplayList33_E1641985C375D8826E6966D4F238A1B8LLV11updateValueyyFAA01_C10Style_PackVyXEfu1_TA
            layers: &layers
        )
        
        self.value = layers.commit(shape: &renderedShape, options: self.options)
    }
}

fileprivate struct ShapeStyledResponderFilter<T : ShapeStyledLeafView> : StatefulRule {
     @Attribute var view: T
     @Attribute var styles: _ShapeStyle_Pack
     @Attribute var size: ViewSize
     @Attribute var position: CGPoint
     @Attribute var transform: ViewTransform
     let responder = LeafViewResponder<ShapeStyledResponderData<T>>()
    
    init(
        view: Attribute<T>,
        styles: Attribute<_ShapeStyle_Pack>,
        size: Attribute<ViewSize>,
        position: Attribute<CGPoint>,
        transform: Attribute<ViewTransform>
    ) {
        self._view = view
        self._styles = styles
        self._size = size
        self._position = position
        self._transform = transform
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
