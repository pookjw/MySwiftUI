// 5E43AD689C2D2E8913F7FBE5AA57B2A1
public import CoreGraphics
public import AttributeGraph

@_spi(Internal) public protocol CoreViewRepresentable: View {
    associatedtype PlatformViewProvider
    associatedtype Host
    associatedtype Coordinator
    
    static var dynamicProperties: CoreViewRepresentableDynamicPropertyFields {
        get
    }
    
    static nonisolated func appendFeature(to proxy: inout CoreViewRepresentableFeatureBufferProxy)
    
    func makeViewProvider(context: PlatformViewRepresentableContext<Self>) -> Self.PlatformViewProvider
    func updateViewProvider(_ provider: Self.PlatformViewProvider, context: PlatformViewRepresentableContext<Self>)
    func resetViewProvider(_ provider: Self.PlatformViewProvider, coordinator: Self.Coordinator, destroy: () -> Void)
    static func dismantleViewProvider(_ provider: Self.PlatformViewProvider, coordinator: Self.Coordinator)
    static func platformView(for provider: Self.PlatformViewProvider) -> AnyObject
    func makeCoordinator() -> Self.Coordinator
    func sizeThatFits(_ proposedSize: ProposedViewSize, provider: Self.PlatformViewProvider, context: PlatformViewRepresentableContext<Self>) -> CGSize?
    func overrideSizeThatFits(_ size: inout CGSize, in: ProposedViewSize, platformView: Self.PlatformViewProvider)
    func depthThatFits(_ proposedSize: _ProposedSize3D, provider: Self.PlatformViewProvider) -> CGFloat
    static var isViewController: Bool { get }
    func shouldEagerlyUpdateSafeArea(_ provider: Self.PlatformViewProvider) -> Bool
    func layoutOptions(_ provider: Self.PlatformViewProvider) -> CoreViewRepresentableLayoutOptions
    func _identifiedViewTree(in provider: Self.PlatformViewProvider) -> Any
    func overrideLayoutTraits(_ traits: inout _LayoutTraits, for provider: Self.PlatformViewProvider)
}

extension CoreViewRepresentable {
    public static var dynamicProperties: CoreViewRepresentableDynamicPropertyFields {
        fatalError("TODO")
    }
    
    public func resetViewProvider(_ provider: Self.PlatformViewProvider, coordinator: Self.Coordinator, destroy: () -> Void) {
        fatalError("TODO")
    }
    
    public static func dismantleViewProvider(_ provider: Self.PlatformViewProvider, coordinator: Self.Coordinator) {
        fatalError("TODO")
    }
    
    public func sizeThatFits(_ proposedSize: ProposedViewSize, provider: Self.PlatformViewProvider, context: PlatformViewRepresentableContext<Self>) -> CGSize? {
        fatalError("TODO")
    }
    
    public func overrideSizeThatFits(_ size: inout CGSize, in: ProposedViewSize, platformView: Self.PlatformViewProvider) {
        fatalError("TODO")
    }
    
    public func depthThatFits(_ proposedSize: _ProposedSize3D, provider: Self.PlatformViewProvider) -> CGFloat {
        fatalError("TODO")
    }
    
    public static var isViewController: Bool {
        fatalError("TODO")
    }
    
    public func shouldEagerlyUpdateSafeArea(_ provider: Self.PlatformViewProvider) -> Bool {
        fatalError("TODO")
    }
    
    public func layoutOptions(_ provider: Self.PlatformViewProvider) -> CoreViewRepresentableLayoutOptions {
        fatalError("TODO")
    }
    
    public var body: Never {
        fatalError("TODO")
    }
    
    public static nonisolated func _makeView(view: _GraphValue<Self>, inputs: _ViewInputs) -> _ViewOutputs {
        /*
         view -> x0 -> x27
         inputs -> x1 -> x26
         return pointer -> x8 -> x28
         */
        // <+228>
        // w24
        let attribute = view.value
        // x23 + 0x2c0 (sp + 0x440) (x27, x25, w21)
        let copy_1 = inputs
        if !copy_1[ArchivedViewInput.self].flags.contains(.isArchived) {
            // <+324>
            // x23 + 0x260 (sp + 0x3e0)
            var copy_2 = inputs
            // x26
            let bridge = PreferenceBridge()
            // x19 + 0x300 (sp + 0x380)
            let _ = copy_1
            // bridge -> x26 -> x20
            // x19 + 0x300 (sp + 0x380)
            let dynamicProperties = Self.dynamicProperties
            // x19 + 0x280 (sp + 0x360)
            let buffer = _DynamicPropertyBuffer(fields: dynamicProperties.base, container: _GraphValue(attribute), inputs: &copy_2.base)
            
            // <+520>
            // x19 + 0x2f0 (sp + 0x370)
            var proxy = CoreViewRepresentableFeatureBufferProxy()
            Self.appendFeature(to: &proxy)
            
            // attribute -> w28
            // x19 + 0x70 (sp + 0xf0)
            let child = PlatformViewChild<Self>(
                view: attribute,
                environment: copy_2.environment,
                transaction: copy_2.base.transaction,
                phase: copy_2.base.phase,
                position: copy_2.animatedPosition(),
                size: copy_2.animatedSize(),
                transform: copy_2.transform,
                parentID: copy_2.scrapeableParentID,
                bridge: bridge,
                links: buffer,
                features: proxy,
                coordinator: nil,
                platformView: nil,
                resetSeed: 0
            )
            
            // x19 + 0x300 (sp + 0x380) -> w25
            let childAttribute = Attribute(child)
            // attribute -> w28 -> x19 + 0x220 (sp + 0x2a0)
            buffer.traceMountedProperties(to: view, fields: dynamicProperties.base)
            
            // x19 + 0x300 / x19 + 0x80
            let featureProxy = CoreViewRepresentableFeatureProxy(base: childAttribute)
            
            // <+1636>
            let flags: AnyAttribute.Flags
            if copy_2.base.options.contains(.viewNeedsGeometry) {
                // <+1656>
                if copy_2.preferences.contains(DisplayList.Key.self) {
                    if copy_2.base.options.contains(.doNotScrape) {
                        flags = [.unknown0, .unknown1, .unknown2]
                    } else {
                        flags = [.unknown0, .unknown1, .unknown2, .unknown3]
                    }
                } else {
                    flags = [.unknown0, .unknown1, .unknown2]
                }
            } else {
                // <+1644>
                flags = [.unknown0, .unknown1, .unknown2]
            }
            
            childAttribute.flags = flags
            
            // <+1700>
            // x24 + 0x200 (sp + 0x380)
            let copy_3 = copy_2
            // x24 + 0x180 (sp + 0x300)
            var copy_4 = copy_2
            // x19 + 0x220 (sp + 0x2a0)
            let copy_5 = copy_3
            
            // <+1760>
            for feature in proxy.reversed() {
                feature.modifyViewInputs(inputs: &copy_4, proxy: featureProxy)
            }
            
            // <+1856>
            copy_4.preferences.remove(ViewRespondersKey.self)
            
            // <+1932>
            // x24 + 0x120 (sp + 0x2a0)
            let copy_6 = copy_4
            // x24 + 0x60 (sp + 0x1e0)
            let copy_7 = copy_4
            // x19 + 0x100 (sp + 0x180)
            let copy_8 = copy_7
            // x19 + 0xa8 (sp + 0x128)
            let copy_9 = copy_5
            
            // x23
            var outptus = ViewLeafView<Self>.makeDebuggableView(view: _GraphValue(childAttribute), inputs: copy_7)
            
            // <+2176>
            for feature in proxy.reversed() {
                feature.modifyViewOutputs(outputs: &outptus, proxy: featureProxy)
                feature.modifyBridgedInputs(inputs: &copy_2, proxy: featureProxy)
            }
            
            // <+2424>
            bridge.wrapInputs(&copy_2)
            return outptus
        } else {
            // <+684>
            fatalError("TODO")
        }
        
        fatalError("TODO")
    }
    
    public func _unaryViewList<T: View>(view: _GraphValue<T>, inputs: _ViewListInputs) -> _ViewListOutputs {
        fatalError("TODO")
    }
    
    public static nonisolated func _viewListCount(inputs: _ViewListCountInputs) -> Int? {
        fatalError("TODO")
    }
}

extension CoreViewRepresentable where Coordinator == Void {
    package func makeCoordinator() -> Void {
        fatalError("TODO")
    }
}

@_spi(Internal) public struct CoreViewRepresentableDynamicPropertyFields {
    private(set) var base: DynamicPropertyCache.Fields
    
    init(base: DynamicPropertyCache.Fields) {
        self.base = base
    }
    
    public init(for type: Any.Type) {
        self.base = DynamicPropertyCache.fields(of: type)
    }
}

@_spi(Internal) public struct CoreViewRepresentableFeatureBufferProxy: Collection {
    var base: CoreViewRepresentableFeatureBuffer
    
    init() {
        base = CoreViewRepresentableFeatureBuffer()
    }
    
    public mutating func append<Feature: CoreViewRepresentableFeature>(_ feature: Feature) {
        base.append(feature)
    }
    
    func destroy() {
        fatalError("TODO")
    }
    
    public var isEmpty: Bool {
        return base.isEmpty
    }
    
    public var startIndex: UnsafeHeterogeneousBuffer.Index {
        return base.startIndex
    }
    
    public var endIndex: UnsafeHeterogeneousBuffer.Index {
        return base.endIndex
    }
    
    public func index(after i: UnsafeHeterogeneousBuffer.Index) -> UnsafeHeterogeneousBuffer.Index {
        return base.index(after: i)
    }
    
    public func formIndex(after i: inout UnsafeHeterogeneousBuffer.Index) {
        base.formIndex(after: &i)
    }
    
    public subscript(position: UnsafeHeterogeneousBuffer.Index) -> CoreViewRepresentableFeatureBuffer.Element {
        return base[position]
    }
}

@_spi(Internal) public struct PlatformViewRepresentableContext<T: CoreViewRepresentable> {
    private var values: RepresentableContextValues
    private let coordinator: T.Coordinator
}

@_spi(Internal) public struct CoreViewRepresentableLayoutOptions: OptionSet {
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}

@_spi(Internal) public struct CoreViewRepresentableFeatureBuffer: Collection {
    var contents: UnsafeHeterogeneousBuffer
    
    init() {
        contents = UnsafeHeterogeneousBuffer()
    }
    
    @discardableResult
    mutating func append<Feature: CoreViewRepresentableFeature>(_ feature: Feature) -> UnsafeHeterogeneousBuffer.Index {
        return contents.append(feature, vtable: _VTable<Feature>.self)
    }
    
    public var startIndex: UnsafeHeterogeneousBuffer.Index {
        return contents.startIndex
    }
    
    public var endIndex: UnsafeHeterogeneousBuffer.Index {
        return contents.endIndex
    }
    
    public subscript(position: UnsafeHeterogeneousBuffer.Index) -> CoreViewRepresentableFeatureBuffer.Element {
        return CoreViewRepresentableFeatureBuffer.Element(base: contents[position])
    }
    
    public var count: Int {
        return contents.count
    }
    
    public func index(after i: UnsafeHeterogeneousBuffer.Index) -> UnsafeHeterogeneousBuffer.Index {
        return contents.index(after: i)
    }
}

extension CoreViewRepresentableFeatureBuffer {
    @_spi(Internal) public struct Element {
        private(set) var base: _UnsafeHeterogeneousBuffer_Element
        
        func modifyViewInputs<Representable: CoreViewRepresentable>(
            inputs: inout _ViewInputs,
            proxy: CoreViewRepresentableFeatureProxy<Representable>
        ) {
            base
                .vtable(as: CoreViewRepresentableFeatureBuffer.VTable.self)
                .modifyViewInputs(elt: base, inputs: &inputs, proxy: proxy)
        }
        
        func modifyViewOutputs<Representable: CoreViewRepresentable>(
            outputs: inout _ViewOutputs,
            proxy: CoreViewRepresentableFeatureProxy<Representable>
        ) {
            base
                .vtable(as: CoreViewRepresentableFeatureBuffer.VTable.self)
                .modifyViewOutputs(elt: base, outputs: &outputs, proxy: proxy)
        }
        
        func modifyBridgedInputs<Representable: CoreViewRepresentable>(
            inputs: inout _ViewInputs,
            proxy: CoreViewRepresentableFeatureProxy<Representable>
        ) {
            fatalError("TODO")
        }
        
        func modifyWrappedOutputs<Representable: CoreViewRepresentable>(
            outputs: inout _ViewOutputs,
            proxy: CoreViewRepresentableFeatureProxy<Representable>
        ) {
            fatalError("TODO")
        }
        
        func update<Host: CoreViewRepresentableHost>(
            forHost host: Host,
            environment: inout EnvironmentValues,
            isInitialUpdate: Bool
        ) {
            fatalError("TODO")
        }
    }
    
    fileprivate class VTable: _UnsafeHeterogeneousBuffer_VTable {
        class func modifyViewInputs<Representable: CoreViewRepresentable>(
            elt: _UnsafeHeterogeneousBuffer_Element,
            inputs: inout _ViewInputs,
            proxy: CoreViewRepresentableFeatureProxy<Representable>
        ) {
            fatalError() // abstract
        }
        
        class func modifyBridgedInputs<Representable: CoreViewRepresentable>(
            elt: _UnsafeHeterogeneousBuffer_Element,
            inputs: inout _ViewInputs,
            proxy: CoreViewRepresentableFeatureProxy<Representable>
        ) {
            fatalError() // abstract
        }
        
        class func modifyViewOutputs<Representable: CoreViewRepresentable>(
            elt: _UnsafeHeterogeneousBuffer_Element,
            outputs: inout _ViewOutputs,
            proxy: CoreViewRepresentableFeatureProxy<Representable>
        ) {
            fatalError() // abstract
        }
        
        class func modifyWrappedOutputs<Representable: CoreViewRepresentable>(
            elt: _UnsafeHeterogeneousBuffer_Element,
            outputs: inout _ViewOutputs,
            proxy: CoreViewRepresentableFeatureProxy<Representable>
        ) {
            fatalError() // abstract
        }
        
        class func update<Host: CoreViewRepresentableHost>(
            elt: _UnsafeHeterogeneousBuffer_Element,
            forHost host: Host,
            environment: inout EnvironmentValues,
            isInitialUpdate: Bool
        ) {
            fatalError() // abstract
        }
    }
    
    fileprivate final class _VTable<Feature: CoreViewRepresentableFeature>: VTable {
        override class var type: any Any.Type {
            fatalError("TODO")
        }
        
        override class func moveInitialize(elt: _UnsafeHeterogeneousBuffer_Element, from: _UnsafeHeterogeneousBuffer_Element) {
            fatalError("TODO")
        }
        
        override class func deinitialize(elt: _UnsafeHeterogeneousBuffer_Element) {
            fatalError("TODO")
        }
        
        override class func modifyViewInputs<Representable: CoreViewRepresentable>(
            elt: _UnsafeHeterogeneousBuffer_Element,
            inputs: inout _ViewInputs,
            proxy: CoreViewRepresentableFeatureProxy<Representable>
        ) {
            elt.body(as: Feature.self).pointee.modifyViewInputs(inputs: &inputs, proxy: proxy)
        }
        
        override class func modifyBridgedInputs<Representable: CoreViewRepresentable>(
            elt: _UnsafeHeterogeneousBuffer_Element,
            inputs: inout _ViewInputs,
            proxy: CoreViewRepresentableFeatureProxy<Representable>
        ) {
            fatalError("TODO")
        }
        
        override class func modifyViewOutputs<Representable: CoreViewRepresentable>(
            elt: _UnsafeHeterogeneousBuffer_Element,
            outputs: inout _ViewOutputs,
            proxy: CoreViewRepresentableFeatureProxy<Representable>
        ) {
            elt.body(as: Feature.self).pointee.modifyViewOutputs(outputs: &outputs, proxy: proxy)
        }
        
        override class func modifyWrappedOutputs<Representable: CoreViewRepresentable>(
            elt: _UnsafeHeterogeneousBuffer_Element,
            outputs: inout _ViewOutputs,
            proxy: CoreViewRepresentableFeatureProxy<Representable>
        ) {
            fatalError("TODO")
        }
        
        override class func update<Host: CoreViewRepresentableHost>(
            elt: _UnsafeHeterogeneousBuffer_Element,
            forHost host: Host,
            environment: inout EnvironmentValues,
            isInitialUpdate: Bool
        ) {
            fatalError("TODO")
        }
    }
}

@_spi(Internal) public protocol CoreViewRepresentableHost {}

@_spi(Internal) public struct CoreViewRepresentableFeatureProxy<Representable: CoreViewRepresentable> {
    public var base: Attribute<ViewLeafView<Representable>>
    
    init(base: Attribute<ViewLeafView<Representable>>) {
        self.base = base
    }
}

@_spi(Internal) public protocol CoreViewRepresentableFeature {
    mutating func modifyViewInputs<Representable: CoreViewRepresentable>(
        inputs: inout _ViewInputs,
        proxy: CoreViewRepresentableFeatureProxy<Representable>
    )
    
    func modifyBridgedInputs<Representable: CoreViewRepresentable>(
        inputs: inout _ViewInputs,
        proxy: CoreViewRepresentableFeatureProxy<Representable>
    )
    
    func modifyViewOutputs<Representable: CoreViewRepresentable>(
        outputs: inout _ViewOutputs,
        proxy: CoreViewRepresentableFeatureProxy<Representable>
    )
    
    func modifyWrappedOutputs<Representable: CoreViewRepresentable>(
        outputs: inout _ViewOutputs,
        proxy: CoreViewRepresentableFeatureProxy<Representable>
    )
    
    func update<Host: CoreViewRepresentableHost>(
        forHost host: Host,
        environment: inout EnvironmentValues,
        isInitialUpdate: Bool
    )
}

extension CoreViewRepresentableFeature {
    func modifyViewOutputs<Representable: CoreViewRepresentable>(
        outputs: inout _ViewOutputs,
        proxy: CoreViewRepresentableFeatureProxy<Representable>
    ) {
        fatalError("TODO")
    }
    
    func modifyWrappedOutputs<Representable: CoreViewRepresentable>(
        outputs: inout _ViewOutputs,
        proxy: CoreViewRepresentableFeatureProxy<Representable>
    ) {
        fatalError("TODO")
    }
    
    func update<Host: CoreViewRepresentableHost>(
        forHost host: Host,
        environment: inout EnvironmentValues,
        isInitialUpdate: Bool
    ) {
        fatalError("TODO")
    }
    
    func modifyViewInputs<Representable: CoreViewRepresentable>(
        inputs: inout _ViewInputs,
        proxy: CoreViewRepresentableFeatureProxy<Representable>
    ) {
        fatalError("TODO")
    }
    
    func modifyBridgedInputs<Representable: CoreViewRepresentable>(
        inputs: inout _ViewInputs,
        proxy: CoreViewRepresentableFeatureProxy<Representable>
    ) {
        fatalError("TODO")
    }
}
