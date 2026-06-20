// 638EB2064D6D992C8A48A894A8F58A16
internal import CoreGraphics
public import Spatial
internal import AttributeGraph

@available(visionOS 1.0, *)
@_originallyDefinedIn(module: "SwiftUI", visionOS 26.0)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
@frozen public struct GeometryReader3D<Content> : View where Content : View {
    public var content: (GeometryProxy3D) -> Content
    
    @inlinable public init(@ViewBuilder content: @escaping (GeometryProxy3D) -> Content) {
        self.content = content
    }
    
    nonisolated public static func _makeView(view: _GraphValue<GeometryReader3D<Content>>, inputs: _ViewInputs) -> _ViewOutputs {
        /*
         view -> x0 -> w28
         inputs -> x1 -> x20
         */
        // x27 + 0x130
        let copy_1 = inputs
        // x19 + 0x34
        let options = copy_1.base.options
        
        // x19 + 0x180
        let child = GeometryReader3D<Content>.Child(
            view: view.value,
            size: copy_1.size,
            depth: copy_1.transform[keyPath: \.depth],
            position: copy_1.position,
            transform: copy_1.transform,
            environment: copy_1.environment,
            safeAreaInsets: copy_1.safeAreaInsets,
            seed: 0
        )
        
        // x19 + 0x14
        let childAttribute = Attribute(child)
        
        // x27 + 0xc0
        var copy_2 = inputs
        // x19 + 0x120
        let copy_3: _ViewInputs
        // x19 + 0x8
        let geometryAttribute: Attribute<ViewGeometry>
        
        // <+408>
        if options.contains(.viewNeedsGeometry) {
            // <+460>
            copy_2.base.options = options.union(.viewRequestsLayoutComputer)
            copy_3 = copy_1
            
            // x19 + 0x120
            let geometryRule = RootGeometry(
                layoutDirection: OptionalAttribute(copy_1.layoutDirection),
                proposedSize: copy_1.size,
                safeAreaInsets: OptionalAttribute(),
                childLayoutComputer: OptionalAttribute()
            )
            geometryAttribute = Attribute(geometryRule)
            
            // <+652>
            // x19 + 0x120
            let queryRule = LayoutPositionQuery(
                parentPosition: copy_1.position,
                localPosition: geometryAttribute[keyPath: \.origin]
            )
            
            copy_2.position = Attribute(queryRule)
            
            // <+752>
            copy_2.size = geometryAttribute[keyPath: \.dimensions.size]
            // <+784>
        } else {
            // <+428>
            copy_3 = copy_1
            geometryAttribute = Attribute(identifier: AnyAttribute(0))
            // <+784>
        }
        
        // <+784>
        // inlined
        var outputs = _ViewOutputs.makePlatformRootGeometryTransform(inputs: copy_2) { inputs in
            // $s7SwiftUI16GeometryReader3DV9_makeView4view6inputsAA01_F7OutputsVAA11_GraphValueVyACyxGG_AA01_F6InputsVtFZAhNXEfU_
            /*
             inputs -> x0 -> x26
             childAttribute -> w1 -> w23
             Content -> x2/x3 -> x21/x20
             */
            return _VariadicView.Tree<_LayoutRoot<GeometryReaderLayout3D>, Content>
                .makeDebuggableView(
                    view: _GraphValue(childAttribute),
                    inputs: inputs
                )
        }
        
        // <+1176>
        if options.contains(.viewNeedsGeometry) {
            // <+1192>
            geometryAttribute.mutateBody(as: RootGeometry.self, invalidating: true) { geometry in
                geometry.$childLayoutComputer = outputs.layoutComputer
            }
        }
        
        // <+1300>
        if options.contains(.viewRequestsLayoutComputer) {
            let attribute = ViewGraph.current.intern(
                LayoutComputer.defaultValue3D,
                for: LayoutComputer.self,
                id: .defaultValue3D
            )
            
            outputs.layoutComputer = attribute
        } else {
            outputs.layoutComputer = nil
        }
        
        // <+1404>
        return outputs
    }
}

@available(*, unavailable)
extension GeometryReader3D : Sendable {
}

@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension GeometryReader3D : UnaryView, PrimitiveView where Content : View {
}

@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
public struct GeometryProxy3D {
    private var owner: AnyWeakAttribute // 0x0
    private var _size: WeakAttribute<ViewSize> // 0x8
    @WeakAttribute private var depth: ViewDepth? // 0x10
    private var _environment: WeakAttribute<EnvironmentValues> // 0x18
    @WeakAttribute private var transform: ViewTransform? // 0x20
    @WeakAttribute private var position: CGPoint? // 0x28
    private var _safeAreaInsets: WeakAttribute<SafeAreaInsets> // 0x30
    private var unit: LengthUnit? = nil // 0x38
    private var seed: UInt32 // 0x40
    
    init(
        owner: AnyAttribute,
        size: Attribute<ViewSize>,
        depth: Attribute<ViewDepth>,
        environment: Attribute<EnvironmentValues>,
        transform: Attribute<ViewTransform>,
        position: Attribute<CGPoint>,
        safeAreaInsets: Attribute<SafeAreaInsets>?,
        seed: UInt32
    ) {
        self.owner = AnyWeakAttribute(owner)
        self._size = WeakAttribute(size)
        self._depth = WeakAttribute(depth)
        self._environment = WeakAttribute(environment)
        self._transform = WeakAttribute(transform)
        self._position = WeakAttribute(position)
        self._safeAreaInsets = WeakAttribute(safeAreaInsets ?? Attribute(identifier: .empty))
        self.seed = seed
    }
    
    public var size: Size3D {
        // self -> x20 -> x19
        // sp + 0xc0
        let copy_1 = self
        // sp + 0x70
        let copy_2 = self
        
        var d0: CGFloat
        var d1: CGFloat
        var d2: CGFloat
        do {
            let sizeInPoints = copy_2.sizeInPoints
            d0 = sizeInPoints.width
            d1 = sizeInPoints.height
            d2 = sizeInPoints.depth
        }
        
        let d8 = d0
        let d9 = d1
        let d10 = d2
        
        // x22
        let unitLength: UnitLength?
        switch self.unit {
        case .length(let length):
            unitLength = length
        default:
            unitLength = nil
        }
        
        // sp + 0x10
        let _ = copy_1
        // sp + 0x60
        let environment = self.environment
        // sp + 0x8
        let pointScale = environment[PointScaleKey.self]
        var d11: CGFloat
        
        if let unitLength {
            // <+192>
            let d12 = pointScale.pointsPerMeter
            
            if unitLength == UnitLength.meters {
                // <+276>
                d0 = 1
                d11 = d0 / d12
                // <+352>
            } else {
                // <+300>
                let d13: CGFloat = 1
                d0 = 1
                d0 = unitLength.converter.baseUnitValue(fromValue: d0)
                d11 = d0
                d0 = d12 * d11
                d11 = d13 / d0
                // <+352>
            }
        } else {
            // <+292>
            d11 = 1
            // <+352>
        }
        
        var result = Size3D(width: d8, height: d9, depth: d10)
        d0 = d11
        result.scale(by: d0)
        return result
    }
    
    public subscript<T>(anchor: Anchor<T>) -> T {
        assertUnimplemented()
    }
    
    public func frame(in coordinateSpace: some CoordinateSpaceProtocol) -> Rect3D {
        assertUnimplemented()
    }
    
    public func transform(in coordinateSpace: some CoordinateSpaceProtocol) -> AffineTransform3D? {
        assertUnimplemented()
    }
    
    public var safeAreaInsets: EdgeInsets3D {
        assertUnimplemented()
    }
    
    var environment: EnvironmentValues {
        if let attribute = self._environment.attribute {
            // <+120>
            return AnyRuleContext(attribute: self.owner._attribute)[attribute]
        } else {
            // <+52>
            var result = EnvironmentValues()
            
            if ViewGraphHost.isDefaultEnvironmentConfigured {
                // <+96>
                result.plist = unsafe ViewGraphHost.defaultEnvironment.plist
            } else {
                // <+188>
                CoreGlue2.shared.configureEmptyEnvironment(&result)
            }
            
            return result
        }
    }
    
    fileprivate var sizeInPoints: Size3D {
        var d8: CGFloat = 0
        var d1: CGFloat
        var d2: CGFloat
        let d0: CGFloat
        
        // w21
        guard let sizeAttribute = self._size.attribute else {
            return .zero
        }
        
        // <+68>
        // x20
        let size = AnyRuleContext(attribute: self.owner._attribute)[sizeAttribute]
        
        d1 = 0
        d2 = 0
        
        // w21
        guard let depthAttribute = self._depth.attribute else {
            d0 = d8
            return .zero
        }
        
        // <+136>
        let ownerAttribute = AnyRuleContext(attribute: self.owner._attribute)
        let d9 = size.width
        d8 = size.height
        
        let depth = ownerAttribute[depthAttribute]
        d2 = depth.value
        d0 = d9
        d1 = d8
        
        return Size3D(width: d0, height: d1, depth: d2)
    }
}

@available(*, unavailable)
extension GeometryProxy3D : Sendable {
}

fileprivate struct GeometryReaderLayout3D : Layout3D {
    func depthThatFits(proposal: _ProposedSize3D, subviews: LayoutSubviews3D, cache: inout ()) -> CGFloat {
        assertUnimplemented()
    }
    
    func explicitAlignment(of alignment: DepthAlignment, in: Rect3D, proposal: _ProposedSize3D, subviews: LayoutSubviews3D, cache: inout ()) -> CGFloat? {
        assertUnimplemented()
    }
    
    func placeSubviewDepths(in rect: Rect3D, proposal: _ProposedSize3D, subviews: LayoutSubviews3D, cache: inout ()) {
        assertUnimplemented()
    }
    
    static var layoutProperties: LayoutProperties {
        var properties = LayoutProperties()
        
        if !isLinkedOnOrAfter(.v2) {
            properties.isDefaultEmptyLayout = true
            properties.isIdentityUnaryLayout = true
        }
        
        return properties
    }
    
    func spacing(subviews: Subviews, cache: inout ()) -> ViewSpacing {
        assertUnimplemented()
    }
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        return proposal.replacingUnspecifiedDimensions(by: .zero)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        for subview in subviews {
            let guideComputer = LayoutComputer.defaultValue
            let size = guideComputer.sizeThatFits(
                _ProposedSize(
                    width: bounds.size.width,
                    height: bounds.size.height
                )
            )
            
            subview.place(
                at: bounds.origin,
                anchor: .topLeading,
                dimensions: ViewDimensions(
                    guideComputer: .defaultValue,
                    size: size,
                    proposal: _ProposedSize(
                        width: bounds.size.width,
                        height: bounds.size.height
                    )
                )
            )
        }
    }
    
    func explicitAlignment(of guide: HorizontalAlignment, in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGFloat? {
        assertUnimplemented()
    }
    
    func explicitAlignment(of guide: VerticalAlignment, in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGFloat? {
        assertUnimplemented()
    }
    
    static func _makeLayoutView(root: _GraphValue<Self>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewListOutputs) -> _ViewOutputs {
        return Self.makeLayoutView3D(root: root, inputs: inputs, body: body)
    }
}

extension _ViewOutputs {
    static func makePlatformRootGeometryTransform(inputs: _ViewInputs, body: (_ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        var copy = inputs
        
        let transform = RootDepthTransform(
            transform: copy.transform,
            layoutDirection: OptionalAttribute(copy.layoutDirection),
            proposedSize: copy.size,
            safeAreaInsets: OptionalAttribute(),
            childLayoutComputer: OptionalAttribute()
        )
        
        let transformAttribute = Attribute(transform)
        copy.transform = transformAttribute
        
        let outputs = body(copy)
        transformAttribute.mutateBody(as: RootDepthTransform.self, invalidating: true) { transform in
            transform.$childLayoutComputer = outputs.layoutComputer
        }
        
        return outputs
    }
}

extension GeometryReader3D {
    fileprivate struct Child : StatefulRule {
        @Attribute private(set) var view: GeometryReader3D<Content> // 0x0
        @Attribute private(set) var size: ViewSize // 0x4
        @Attribute private(set) var depth: ViewDepth // 0x8
        @Attribute private(set) var position: CGPoint // 0xc
        @Attribute private(set) var transform: ViewTransform // 0x10
        @Attribute private(set) var environment: EnvironmentValues // 0x14
        @OptionalAttribute var safeAreaInsets: SafeAreaInsets? // 0x18
        private(set) var seed: UInt32 // 0x1c
        
        typealias Value = _VariadicView.Tree<_LayoutRoot<GeometryReaderLayout3D>, Content>
        
        mutating func updateValue() {
            /*
             self -> x20 -> x26
             Self -> x0 -> x25
             */
            // <+768>
            let newSeed = self.seed &+ 1
            self.seed = newSeed
            
            // inlined
            let proxy = GeometryProxy3D(
                owner: .current!,
                size: self._size,
                depth: self._depth,
                environment: self._environment,
                transform: self._transform,
                position: self._position,
                safeAreaInsets: self.$safeAreaInsets,
                seed: newSeed
            )
            
            // inlined
            // x24 -> x29 - 0x1f0 (x19)
            let content = ObservationCenter.current._withObservation(attribute: Attribute<Self.Value>(identifier: .current!)) { 
                // $s7SwiftUI16GeometryReader3DV5Child33_638EB2064D6D992C8A48A894A8F58A16LLV11updateValueyyFxyXEfU_TA
                return self.view.content(proxy)
            }
            
            // <+2360>
            // x29 - 0x1e0 (x22)
            let value = _VariadicView.Tree(root: _LayoutRoot(GeometryReaderLayout3D()), content: content)
            self.value = value
        }
    }
}
