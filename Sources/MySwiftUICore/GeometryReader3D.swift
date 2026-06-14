// 638EB2064D6D992C8A48A894A8F58A16
private import CoreGraphics
public import Spatial
private import AttributeGraph

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
    public var size: Size3D {
        assertUnimplemented()
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
        assertUnimplemented()
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        assertUnimplemented()
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
        @Attribute private(set) var view: GeometryReader3D<Content>
        @Attribute private(set) var size: ViewSize
        @Attribute private(set) var depth: ViewDepth
        @Attribute private(set) var position: CGPoint
        @Attribute private(set) var transform: ViewTransform
        @Attribute private(set) var environment: EnvironmentValues
        @OptionalAttribute var safeAreaInsets: SafeAreaInsets?
        private(set) var seed: UInt32
        
        typealias Value = _VariadicView.Tree<_LayoutRoot<GeometryReaderLayout3D>, Content>
        
        func updateValue() {
            assertUnimplemented()
        }
    }
}
