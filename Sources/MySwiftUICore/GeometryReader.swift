// 7D6D22DF7076CCC1FC5284D8E2D1B049
internal import AttributeGraph
internal import CoreGraphics

@frozen public struct GeometryReader<Content> : View where Content : View {
    public var content: (GeometryProxy) -> Content
    
    @inlinable public init(@ViewBuilder content: @escaping (GeometryProxy) -> Content) {
        self.content = content
    }
    
    nonisolated public static func _makeView(view: _GraphValue<GeometryReader<Content>>, inputs: _ViewInputs) -> _ViewOutputs {
        /*
         view -> x0 -> w21
         inputs -> x1 -> x20
         */
        // x28 + 0x130
        let copy_1 = inputs
        // x19 + 0x180
        let child = Self.Child(
            view: view.value,
            size: copy_1.size,
            position: copy_1.position,
            transform: copy_1.transform,
            environment: copy_1.environment,
            safeAreaInsets: copy_1.safeAreaInsets,
            seed: 0
        )
        // x19 + 0x14
        let childAttribute = Attribute(child)
        // x28 + 0xc0
        var copy_2 = inputs
        // x19 + 0x120
        let copy_3: _ViewInputs
        // x19 + 0xc
        let geometryAttribute: Attribute<ViewGeometry>
        
        if copy_1.base.options.contains(.viewNeedsGeometry) {
            // <+440>
            copy_2.base.options.formUnion(.viewRequestsLayoutComputer)
            copy_3 = copy_1
            
            // x19 + 0x120
            let geometry = RootGeometry(
                layoutDirection: OptionalAttribute(copy_1.layoutDirection),
                proposedSize: copy_1.size,
                safeAreaInsets: OptionalAttribute(),
                childLayoutComputer: OptionalAttribute()
            )
            // w22
            geometryAttribute = Attribute(geometry)
            // x19 + 0x120
            let query = LayoutPositionQuery(
                parentPosition: copy_1.position,
                localPosition: geometryAttribute[keyPath: \.origin]
            )
            // x19 + 0x1c0
            let queryAttribute = Attribute(query)
            copy_2.position = queryAttribute
            let sizeAttribute = geometryAttribute[keyPath: \.dimensions.size]
            copy_2.size = sizeAttribute
            // <+764>
        } else {
            // <+412>
            copy_3 = copy_1
            geometryAttribute = Attribute(identifier: AnyAttribute(rawValue: 0))
            // <+764>
        }
        
        // <+764>
        // inlined
        var outputs = _ViewOutputs.makePlatformRootGeometryTransform(inputs: copy_2) { inputs in
            // $s7SwiftUI14GeometryReaderV9_makeView4view6inputsAA01_F7OutputsVAA11_GraphValueVyACyxGG_AA01_F6InputsVtFZAhNXEfU_
            let view = _GraphValue(childAttribute)
            return _VariadicView.Tree<_LayoutRoot<GeometryReaderLayout>, Content>.makeDebuggableView(view: view, inputs: inputs)
        }
        
        // <+1156>
        if copy_1.base.options.contains(.viewNeedsGeometry) {
            geometryAttribute.mutateBody(as: RootGeometry.self, invalidating: true) { geometry in
                geometry.$childLayoutComputer = outputs.layoutComputer
            }
        }
        
        // <+1284>
        outputs.layoutComputer = nil
        return outputs
    }
}

@available(*, unavailable)
extension GeometryReader : Sendable {
}

extension GeometryReader : UnaryView, PrimitiveView where Content : View {}

extension GeometryReader {
    fileprivate struct Child : StatefulRule, AsyncAttribute {
        @Attribute private(set) var view: GeometryReader<Content> // 0x0
        @Attribute private(set) var size: ViewSize // 0x4
        @Attribute private(set) var position: CGPoint // 0x8
        @Attribute private(set) var transform: ViewTransform // 0xc
        @Attribute private(set) var environment: EnvironmentValues // 0x10
        @OptionalAttribute var safeAreaInsets: SafeAreaInsets? // 0x14
        private(set) var seed: UInt32 // 0x18
        
        typealias Value = _VariadicView.Tree<_LayoutRoot<GeometryReaderLayout>, Content>
        
        mutating func updateValue() {
            // self -> x20 -> x26
            // <+768>
            // w22
            let newSeed = self.seed &+ 1
            self.seed = newSeed
            
            let proxy = GeometryProxy(
                owner: .current!,
                size: self.$size,
                environment: self.$environment,
                transform: self.$transform,
                position: self.$position,
                safeAreaInsets: self.$safeAreaInsets,
                seed: newSeed
            )
            
            // inlined
            let content = ObservationCenter.current._withObservation(attribute: Attribute<Self.Value>(identifier: .current!)) { 
                // $s7SwiftUI14GeometryReaderV5Child33_7D6D22DF7076CCC1FC5284D8E2D1B049LLV11updateValueyyFxyXEfU_TA
                return self.$view.syncMainIfReferences { reader in
                    // $s7SwiftUI14GeometryReaderV5Child33_7D6D22DF7076CCC1FC5284D8E2D1B049LLV11updateValueyyFxyXEfU_xACyxGXEfU_TA
                    return reader.content(proxy)
                }
            }
            
            let value = _VariadicView.Tree<_LayoutRoot<GeometryReaderLayout>, Content>(
                root: _LayoutRoot<GeometryReaderLayout>(GeometryReaderLayout()),
                content: content
            )
            
            self.value = value
        }
    }
}

fileprivate struct GeometryReaderLayout : Layout, Animatable {
    static var layoutProperties: LayoutProperties {
        var properties = LayoutProperties()
        
        if isLinkedOnOrAfter(.v2) {
            properties.stackOrientation = nil
            properties.isDefaultEmptyLayout = false
            properties.isIdentityUnaryLayout = false
        } else {
            properties.stackOrientation = nil
            properties.isDefaultEmptyLayout = true
            properties.isIdentityUnaryLayout = true
        }
        
        return properties
    }
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        return proposal.replacingUnspecifiedDimensions(by: .zero)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        /*
         subviews -> x0/x1
         */
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
    
    func spacing(subviews: Subviews, cache: inout ()) -> ViewSpacing {
        assertUnimplemented()
    }
    
    static func _makeLayoutView(root: _GraphValue<GeometryReaderLayout>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewListOutputs) -> _ViewOutputs {
        return Self.makeLayoutView(root: root, inputs: inputs, body: body)
    }
}
