// BA60BF7120E939C5C25B2A488163D4AC
internal import AttributeGraph
package import Spatial

@dynamicMemberLookup
package struct SizeAndSpacingContext {
    var context: AnyRuleContext
    fileprivate private(set) var owner: AnyAttribute
    @Attribute fileprivate private(set) var environment: EnvironmentValues
    
    init(_ context: PlacementContext3D) {
        self.init(context.base)
    }
    
    init(context: AnyRuleContext, owner: AnyAttribute?, environment: Attribute<EnvironmentValues>) {
        self.context = context
        self.owner = owner ?? context.attribute
        self._environment = environment
    }
    
    init(_ context: PlacementContext) {
        self.context = context.context
        self.owner = context.owner
        self._environment = context.$environment
    }
    
    package subscript<Value>(dynamicMember dynamicMember: KeyPath<EnvironmentValues, Value>) -> Value {
        let fetch = EnvironmentFetch<Value>(environment: $environment, keyPath: dynamicMember)
        
        return withUnsafePointer(to: fetch) { pointer in
            return unsafe EnvironmentFetch<Value>._cachedValue(
                options: .unknown0,
                owner: owner,
                hashValue: fetch.hashValue,
                bodyPtr: UnsafeRawPointer(pointer),
                update: {
                    return { body, attribute in
                        let environment = unsafe body
                            .assumingMemoryBound(to: Attribute<EnvironmentValues>.self)
                            .pointee
                            .value
                        
                        var result = environment[keyPath: dynamicMember]
                        unsafe Graph.setOutputValue(&result)
                    }
                }
            ).pointee
        }
    }
    
    func update<T>(_ block: () -> T) -> T {
        assertUnimplemented()
    }
}

@dynamicMemberLookup
struct PlacementContext {
    fileprivate private(set) var context: AnyRuleContext
    fileprivate private(set) var owner: AnyAttribute
    @Attribute fileprivate private(set) var environment: EnvironmentValues
    private let parentSize: PlacementContext.ParentSize
    
    var proposedSize: _ProposedSize {
        if isLinkedOnOrAfter(.v3) {
            // <+212>
            var size: ViewSize
            switch parentSize {
            case .eager(let viewSize):
                size = viewSize
            case .lazy(let attribute):
                size = context[attribute]
            }
            
            // <+248>
            // inlined
            return size.proposal
        } else {
            // <+148>
            let size: ViewSize
            switch parentSize {
            case .eager(let viewSize):
                size = viewSize
            case .lazy(let attribute):
                size = context[attribute]
            }
            
            return _ProposedSize(width: size.width, height: size.height)
        }
    }
    
    var size: CGSize {
        switch parentSize {
        case .eager(let viewSize):
            return viewSize.value
        case .lazy(let attribute):
            return context[attribute].value
        }
    }
    
    init(base: SizeAndSpacingContext, parentSize: ViewSize) {
        self.context = base.context
        self.owner = base.owner
        self._environment = base.$environment
        self.parentSize = .eager(parentSize)
    }
    
    init(
        context: AnyRuleContext,
        owner: AnyAttribute?,
        size: Attribute<ViewSize>,
        environment: Attribute<EnvironmentValues>,
        transform: Attribute<ViewTransform>,
        position: Attribute<CGPoint>,
        safeAreaInsets: OptionalAttribute<SafeAreaInsets>
    ) {
        assertUnimplemented()
    }
    
    init(
        context: AnyRuleContext,
        size: Attribute<ViewSize>,
        environment: Attribute<EnvironmentValues>,
        transform: Attribute<ViewTransform>,
        position: Attribute<CGPoint>,
        safeAreaInsets: OptionalAttribute<SafeAreaInsets>
    ) {
        assertUnimplemented()
    }
    
    subscript<Value>(dynamicMember dynamicMember: KeyPath<EnvironmentValues, Value>) -> Value {
        get {
            assertUnimplemented()
        }
    }
}

extension PlacementContext {
    fileprivate enum ParentSize {
        case eager(ViewSize)
        case lazy(Attribute<ViewSize>)
    }
}

@dynamicMemberLookup
package struct PlacementContext3D {
    var base: PlacementContext
    private(set) var _depth: ViewDepth
    
    package var proposedSize: _ProposedSize3D {
        return _ProposedSize3D(
            self.base.proposedSize,
            depth: self._depth.proposal
        )
    }
    
    var depth: CGFloat {
        return self._depth.value
    }
    
    var proposedDepth: CGFloat? {
        assertUnimplemented()
    }
    
    package var size: Size3D {
        return Size3D(self.base.size, depth: self.depth)
    }
    
    package subscript<Value>(dynamicMember dynamicMember: KeyPath<EnvironmentValues, Value>) -> Value {
        get {
            assertUnimplemented()
        }
    }
}

@dynamicMemberLookup
package struct _PositionAwarePlacementContext {
    private var context: AnyRuleContext // 0x0
    private var owner: AnyAttribute // 0x4
    private var _size: Attribute<ViewSize> // 0x8
    private var _environment: Attribute<EnvironmentValues> // 0xc
    private var _transform: Attribute<ViewTransform> // 0x10
    private var _position: Attribute<CGPoint> // 0x14
    private var _safeAreaInsets: OptionalAttribute<SafeAreaInsets> // 0x18
    
    init(
        context: AnyRuleContext,
        size: Attribute<ViewSize>,
        environment: Attribute<EnvironmentValues>,
        transform: Attribute<ViewTransform>,
        position: Attribute<CGPoint>,
        safeAreaInsets: OptionalAttribute<SafeAreaInsets>
    ) {
        self.context = context
        self.owner = context.attribute
        self._size = size
        self._environment = environment
        self._transform = transform
        self._position = position
        self._safeAreaInsets = safeAreaInsets
    }
    
    init(
        context: AnyRuleContext,
        owner: AnyAttribute?,
        size: Attribute<ViewSize>,
        environment: Attribute<EnvironmentValues>,
        transform: Attribute<ViewTransform>,
        position: Attribute<CGPoint>,
        safeAreaInsets: OptionalAttribute<SafeAreaInsets>
    ) {
        self.context = context
        self.owner = owner ?? context.attribute
        self._size = size
        self._environment = environment
        self._transform = transform
        self._position = position
        self._safeAreaInsets = safeAreaInsets
    }
    
    var transform: ViewTransform {
        var result = self.context[self._transform]
        let d8 = result.pendingTranslation.width
        let d9 = result.pendingTranslation.height
        let d10 = result.positionAdjustment.width
        let d11 = result.positionAdjustment.height
        let position = self.context[self._position]
        let d0 = position.x
        let d1 = position.y
        var d2 = d0 - d10
        var d3 = d1 - d11
        d2 = d8 - d2
        d3 = d9 - d3
        result.pendingTranslation = CGSize(width: d2, height: d3)
        result.positionAdjustment = CGSize(width: d0, height: d1)
        
        return result
    }
    
    var size: CGSize {
        return self.context[self._size].value
    }
    
    var proposedSize: _ProposedSize {
        if isLinkedOnOrAfter(.v3) {
            // <+188>
            return self.context[self._size].proposal
        } else {
            // <+132>
            return _ProposedSize(self.context[self._size].value)
        }
    }
    
    var unadjustedSafeAreaInsets: SafeAreaInsets? {
        guard let attribute = self._safeAreaInsets.attribute else {
            return nil
        }
        
        return self.context[attribute]
    }
    
    package subscript<Value>(dynamicMember dynamicMember: KeyPath<EnvironmentValues, Value>) -> Value {
        let fetch = EnvironmentFetch<Value>(environment: self._environment, keyPath: dynamicMember)
        
        return withUnsafePointer(to: fetch) { pointer in
            return unsafe EnvironmentFetch<Value>._cachedValue(
                options: .unknown0,
                owner: self.owner,
                hashValue: fetch.hashValue,
                bodyPtr: UnsafeRawPointer(pointer),
                update: {
                    return { body, attribute in
                        let environment = unsafe body
                            .assumingMemoryBound(to: Attribute<EnvironmentValues>.self)
                            .pointee
                            .value
                        
                        var result = environment[keyPath: dynamicMember]
                        unsafe Graph.setOutputValue(&result)
                    }
                }
            ).pointee
        }
    }
    
    func safeAreaInsets(matching regions: SafeAreaRegions, cornerAdaptation: Edge.Set) -> EdgeInsets {
        guard let attribute = self._safeAreaInsets.attribute else {
            return .zero
        }
        
        return self.context[attribute]
            .resolve(regions: regions, cornerAdaptation: cornerAdaptation, in: self)
    }
}

fileprivate struct EnvironmentFetch<T> : Rule, AsyncAttribute, Hashable {
    @Attribute var environment: EnvironmentValues
    var keyPath: KeyPath<EnvironmentValues, T>
    
    var value: T {
        return environment[keyPath: keyPath]
    }
}
