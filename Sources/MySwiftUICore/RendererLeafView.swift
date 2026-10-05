// 65609C35608651F66D749EB1BD9D2226
internal import Spatial
package import CoreGraphics
private import AttributeGraph

protocol RendererLeafView : ContentResponder, PrimitiveView, UnaryView {
    nonisolated static var requiresMainThread: Bool {
        get
    }
    
    nonisolated func content() -> DisplayList.Content.Value
}

extension RendererLeafView {
    nonisolated static func makeLeafView(view: _GraphValue<Self>, inputs: _ViewInputs) -> _ViewOutputs {
        // x29 = sp + 0x1a0
        /*
         view = w27
         */
        // 0x30
        var outputs = _ViewOutputs()
        let copy_1 = inputs
        
        if unsafe copy_1.preferences.contains(DisplayList.Key.self, includeHostPreferences: false) {
            // <+284>
            let identity = _DisplayList_Identity()
            copy_1.pushIdentity(identity)
            
            let leaf = LeafDisplayList(
                identity: identity,
                view: view.value,
                position: copy_1.animatedPosition(),
                size: copy_1.animatedCGSize(),
                containerPosition: copy_1.containerPosition,
                options: copy_1[DisplayList.Options.self],
                contentSeed: DisplayList.Seed()
            )
            
            let attribute = Attribute(leaf)
            unsafe outputs[DisplayList.Key.self] = attribute
        }
        
        // <+860>
        if copy_1.preferences.contains(ViewRespondersKey.self) {
            let filter = LeafResponderFilter(
                data: view.value,
                size: copy_1.animatedSize(),
                position: copy_1.animatedPosition(),
                transform: copy_1.transform
            )
            
            let attribute = Attribute(filter)
            outputs[ViewRespondersKey.self] = attribute
        }
        
        // <+1496>
        outputs.makeContentPathPreferenceWriter(
            inputs: copy_1,
            contentResponder: view.value
        )
        
        return outputs
    }
    
    func contains(points: UnsafeBufferPointer<Point3D>, size: CGSize) -> BitVector64 {
        assertUnimplemented()
    }
    
    static var requiresMainThread: Bool {
        return false
    }
}

fileprivate struct LeafDisplayList<Content : RendererLeafView>: CustomStringConvertible, StatefulRule {
    let identity: _DisplayList_Identity
    @Attribute var view: Content
    @Attribute var position: CGPoint
    @Attribute var size: CGSize
    @Attribute var containerPosition: CGPoint
    let options: DisplayList.Options
    var contentSeed: DisplayList.Seed
    
    var description: String {
        assertUnimplemented()
    }

    static var flags: AnyAttribute.TypeFlags {
        return Content.requiresMainThread ? AnyAttribute.TypeFlags(rawValue: 0x8) : []
    }
    
    typealias Value = DisplayList
    
    mutating func updateValue() {
        /*
         self = x24
         */
        let (view, flags) = self.$view.valueAndFlags(options: [])
        // x23
        let content = view.content()
        // x28
        let version = DisplayList.Version(forUpdate: ())
        
        if flags == .changed {
            self.contentSeed = DisplayList.Seed(version)
        }
        
        // <+244>
        let position = position
        let containerPosition = containerPosition
        let origin = CGPoint(x: position.x - containerPosition.x, y: position.y - containerPosition.y)
        var item = DisplayList.Item(
            .content(DisplayList.Content(content, seed: contentSeed)),
            frame: CGRect(origin: origin, size: size),
            identity: identity,
            version: version
        )
        item.canonicalize(options: options)
        
        self.value = DisplayList(item)
    }
}

struct LeafResponderFilter<T : ContentResponder>: StatefulRule {
    @Attribute private var data: T
    @Attribute private var size: ViewSize
    @Attribute private var position: CGPoint
    @Attribute private var transform: ViewTransform
    private lazy var responder = LeafViewResponder<T>()
    
    fileprivate init(data: Attribute<T>, size: Attribute<ViewSize>, position: Attribute<CGPoint>, transform: Attribute<ViewTransform>) {
        self._data = data
        self._size = size
        self._position = position
        self._transform = transform
    }
    
    typealias Value = [ViewResponder]
    
    mutating func updateValue() {
        // self = x19
        responder.helper.update(
            data: $data.changedValue(options: []),
            size: $size.changedValue(options: []),
            position: $position.changedValue(options: []),
            transform: $transform.changedValue(options: []),
            parent: responder
        )
        
        if !hasValue {
            value = [responder]
        }
    }
}

final class LeafViewResponder<T : ContentResponder>: ViewResponder {
    fileprivate var helper = ContentResponderHelper<T>()
    
    override func hitTestPolicy(options: ViewResponder.ContainsPointsOptions) -> ViewResponder.HitTestPolicy {
        assertUnimplemented()
    }
    
    override func containsGlobalPoints(_ points: [Point3D], cacheKey: UInt32?, options: ViewResponder.ContainsPointsOptions) -> ViewResponder.ContainsPointsResult {
        assertUnimplemented()
    }
}

package protocol LeafViewLayout {
    func spacing() -> Spacing
    func sizeThatFits(in proposedSize: _ProposedSize) -> CGSize
}

extension LeafViewLayout {
    package static func makeLeafLayout(_ outputs: inout _ViewOutputs, view: _GraphValue<Self>, inputs: _ViewInputs) {
        guard inputs.base.options.contains(.viewRequestsLayoutComputer) else {
            return
        }
        
        outputs.layoutComputer = Attribute(LeafLayoutComputer(view: view.value))
    }
    
    package func spacing() -> Spacing {
        assertUnimplemented()
    }
}

fileprivate struct LeafLayoutComputer<T : LeafViewLayout> : CustomStringConvertible, AsyncAttribute, StatefulRule {
    @Attribute private(set) var view: T
    
    typealias Value = LayoutComputer
    
    func updateValue() {
        let engine = LeafLayoutEngine(self.view)
        self.update(to: engine)
    }
    
    var description: String {
        assertUnimplemented()
    }
}

struct LeafLayoutEngine<T : LeafViewLayout> : LayoutEngine {
    private let view: T
    private var cache = ViewSizeCache(cache: Cache3<_ProposedSize3D, CGSize>())
    
    init(_ view: T) {
        self.view = view
    }
    
    func layoutPriority() -> Double {
        return 0
    }
    
    func ignoresAutomaticPadding() -> Bool {
        return false
    }
    
    func requiresSpacingProjection() -> Bool {
        return false
    }
    
    mutating func spacing() -> Spacing {
        assertUnimplemented()
    }
    
    mutating func sizeThatFits(_ proposedSize: _ProposedSize) -> CGSize {
        var cache = self.cache
        
        let result = cache.get(proposedSize) { 
            return self.view.sizeThatFits(in: proposedSize)
        }
        
        self.cache = cache
        return result
    }
    
    mutating func lengthThatFits(_ proposedSize: _ProposedSize, in axis: Axis) -> CGFloat {
        assertUnimplemented()
    }
    
    mutating func childGeometries(at viewSize: ViewSize, origin: CGPoint) -> [ViewGeometry] {
        assertUnimplemented()
    }
    
    mutating func explicitAlignment(_ alignmentKey: AlignmentKey, at viewSize: ViewSize) -> CGFloat? {
        assertUnimplemented()
    }
    
    mutating func childPlacement(at viewSize: ViewSize) -> _Placement {
        assertUnimplemented()
    }
    
    func childPlacement(at viewSize: ViewSize, placementContext: _PositionAwarePlacementContext) -> _Placement {
        assertUnimplemented()
    }
    
    mutating func depthThatFits(_ proposedSize: _ProposedSize3D) -> CGFloat {
        return 0
    }
    
    func explicitDepthAlignment(_ alignmentKey: DepthAlignmentKey, at viewSize: ViewSize3D) -> CGFloat? {
        return nil
    }
    
    func requiresTrueDepthLayout() -> Bool {
        return false
    }
    
    var debugContentDescription: String? {
        return nil
    }
}
