// 236BA2660974ECECC5FBCA685B96F88F
public import CoreGraphics
internal import AttributeGraph
private import Spatial

@frozen public struct AnyLayout : Layout, Sendable {
    var storage: AnyLayoutBox
    
    public init<L>(_ layout: L) where L : Layout {
        self.storage = _AnyLayoutBox(layout)
    }
    
    public struct Cache : @unchecked Sendable {
        fileprivate private(set) var type: Any.Type
        fileprivate var value: Any
    }
    
    public typealias AnimatableData = _AnyAnimatableData
    
    public func makeCache(subviews: AnyLayout.Subviews) -> AnyLayout.Cache {
        return self.storage.makeCache(subviews: subviews)
    }
    
    public func updateCache(_ cache: inout AnyLayout.Cache, subviews: AnyLayout.Subviews) {
        return self.storage.updateCache(&cache, subviews: subviews)
    }
    
    public func spacing(subviews: AnyLayout.Subviews, cache: inout AnyLayout.Cache) -> ViewSpacing {
        return self.storage.spacing(subviews: subviews, cache: &cache)
    }
    
    public func sizeThatFits(proposal: ProposedViewSize, subviews: AnyLayout.Subviews, cache: inout AnyLayout.Cache) -> CGSize {
        return self.storage.sizeThatFits(proposal: proposal, subviews: subviews, cache: &cache)
    }
    
    public func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: AnyLayout.Subviews, cache: inout AnyLayout.Cache) {
        return self.storage.placeSubviews(in: bounds, proposal: proposal, subviews: subviews, cache: &cache)
    }
    
    public func explicitAlignment(of guide: HorizontalAlignment, in bounds: CGRect, proposal: ProposedViewSize, subviews: AnyLayout.Subviews, cache: inout AnyLayout.Cache) -> CGFloat? {
        return self.storage.explicitAlignment(of: guide, in: bounds, proposal: proposal, subviews: subviews, cache: &cache)
    }
    
    public func explicitAlignment(of guide: VerticalAlignment, in bounds: CGRect, proposal: ProposedViewSize, subviews: AnyLayout.Subviews, cache: inout AnyLayout.Cache) -> CGFloat? {
        return self.storage.explicitAlignment(of: guide, in: bounds, proposal: proposal, subviews: subviews, cache: &cache)
    }
    
    public var animatableData: _AnyAnimatableData {
        get {
            return self.storage.animatableData
        }
        set {
            self.storage.animatableData = newValue
        }
        _modify {
            yield &self.storage.animatableData
        }
    }
}

@usableFromInline class AnyLayoutBox : @unchecked Sendable {
    fileprivate var layout3DBox: AnyLayout3DBox
    
    init() {
        preconditionFailure()
    }
    
    // 원래 없음
    @inline(__always)
    fileprivate init(layout3DBox: AnyLayout3DBox) {
        self.layout3DBox = layout3DBox
    }
    
    @usableFromInline deinit {}
    
    var layoutProperties: LayoutProperties {
        preconditionFailure() // abstract
    }
    
    func makeCache(subviews: LayoutSubviews) -> AnyLayout.Cache {
        preconditionFailure() // abstract
    }
    
    func updateCache(_: inout AnyLayout.Cache, subviews: LayoutSubviews) {
        preconditionFailure() // abstract
    }
    
    func spacing(subviews: LayoutSubviews, cache: inout AnyLayout.Cache) -> ViewSpacing {
        preconditionFailure() // abstract
    }
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: LayoutSubviews, cache: inout AnyLayout.Cache) -> CGSize {
        preconditionFailure() // abstract
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: LayoutSubviews, cache: inout AnyLayout.Cache) {
        preconditionFailure() // abstract
    }
    
    func explicitAlignment(of alignment: HorizontalAlignment, in bounds: CGRect, proposal: ProposedViewSize, subviews: LayoutSubviews, cache: inout AnyLayout.Cache) -> CGFloat {
        preconditionFailure() // abstract
    }
    
    func explicitAlignment(of alignment: VerticalAlignment, in bounds: CGRect, proposal: ProposedViewSize, subviews: LayoutSubviews, cache: inout AnyLayout.Cache) -> CGFloat? {
        preconditionFailure() // abstract
    }
    
    var animatableData: _AnyAnimatableData {
        get {
            preconditionFailure() // abstract
        }
        set {
            preconditionFailure() // abstract
        }
    }
    
    func withAnimatableData(_ animatableData: _AnyAnimatableData) -> AnyLayoutBox {
        preconditionFailure() // abstract
    }
}

final class _AnyLayoutBox<L : Layout> : AnyLayoutBox, @unchecked Sendable {
    private var layout: L
    
    init(_ layout: L) {
        self.layout = layout
        super.init(layout3DBox: DefaultLayoutBox3D())
        
        if let layout3D = layout as? (any Layout3D) {
            func project<T : Layout3D>(_ layout3D: T) {
                self.layout3DBox = _AnyLayout3DBox(layout3D)
            }
            
            _openExistential(layout3D, do: project)
        }
    }
    
    fileprivate init(_ layout: L, layout3DBox: AnyLayout3DBox) {
        self.layout = layout
        super.init(layout3DBox: layout3DBox)
    }
    
    override var layoutProperties: LayoutProperties {
        assertUnimplemented()
    }
    
    override func makeCache(subviews: LayoutSubviews) -> AnyLayout.Cache {
        let cache = self.layout.makeCache(subviews: subviews)
        return AnyLayout.Cache(type: L.self, value: cache)
    }
    
    override func updateCache(_: inout AnyLayout.Cache, subviews: LayoutSubviews) {
        assertUnimplemented()
    }
    
    override func spacing(subviews: LayoutSubviews, cache: inout AnyLayout.Cache) -> ViewSpacing {
        assertUnimplemented()
    }
    
    override func sizeThatFits(proposal: ProposedViewSize, subviews: LayoutSubviews, cache: inout AnyLayout.Cache) -> CGSize {
        var layoutCache = cache.value as! L.Cache
        defer {
            cache.value = layoutCache
        }
        
        return self.layout.sizeThatFits(proposal: proposal, subviews: subviews, cache: &layoutCache)
    }
    
    override func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: LayoutSubviews, cache: inout AnyLayout.Cache) {
        var layoutCache = cache.value as! L.Cache
        defer {
            cache.value = layoutCache
        }
        
        self.layout.placeSubviews(in: bounds, proposal: proposal, subviews: subviews, cache: &layoutCache)
    }
    
    override func explicitAlignment(of alignment: HorizontalAlignment, in bounds: CGRect, proposal: ProposedViewSize, subviews: LayoutSubviews, cache: inout AnyLayout.Cache) -> CGFloat {
        assertUnimplemented()
    }
    
    override func explicitAlignment(of alignment: VerticalAlignment, in bounds: CGRect, proposal: ProposedViewSize, subviews: LayoutSubviews, cache: inout AnyLayout.Cache) -> CGFloat? {
        assertUnimplemented()
    }
    
    override var animatableData: _AnyAnimatableData {
        get {
            return _AnyAnimatableData(self.layout)
        }
        set {
            newValue.update(&self.layout)
        }
    }
    
    override func withAnimatableData(_ animatableData: _AnyAnimatableData) -> AnyLayoutBox {
        assertUnimplemented()
    }
}

fileprivate class AnyLayout3DBox {
    var depthProperties: LayoutDepthProperties {
        preconditionFailure() // abstract
    }
    
    func depthThatFits(proposal: _ProposedSize3D, subviews: LayoutSubviews3D, cache: inout AnyLayout.Cache) -> CGFloat {
        preconditionFailure() // abstract
    }
    
    func placeSubviewDepths(in bounds: Rect3D, proposal: _ProposedSize3D, subviews: LayoutSubviews3D, cache: inout AnyLayout.Cache) {
        preconditionFailure() // abstract
    }
    
    func explicitAlignment(of alignment: DepthAlignment, in bounds: Rect3D, proposal: _ProposedSize3D, subviews: LayoutSubviews3D, cache: inout AnyLayout.Cache) -> CGFloat? {
        preconditionFailure() // abstract
    }
    
    func withAnimatableData(_ animatableData: _AnyAnimatableData) -> AnyLayout3DBox {
        preconditionFailure() // abstract
    }
}

fileprivate final class _AnyLayout3DBox<L : Layout3D> : AnyLayout3DBox {
    private let layout3D: L
    
    @inline(__always) // 원래 없음
    init(_ layout3D: L) {
        self.layout3D = layout3D
        super.init()
    }
    
    override var depthProperties: LayoutDepthProperties {
        assertUnimplemented()
    }
    
    override func depthThatFits(proposal: _ProposedSize3D, subviews: LayoutSubviews3D, cache: inout AnyLayout.Cache) -> CGFloat {
        assertUnimplemented()
    }
    
    override func placeSubviewDepths(in bounds: Rect3D, proposal: _ProposedSize3D, subviews: LayoutSubviews3D, cache: inout AnyLayout.Cache) {
        assertUnimplemented()
    }
    
    override func explicitAlignment(of alignment: DepthAlignment, in bounds: Rect3D, proposal: _ProposedSize3D, subviews: LayoutSubviews3D, cache: inout AnyLayout.Cache) -> CGFloat? {
        assertUnimplemented()
    }
    
    override func withAnimatableData(_ animatableData: _AnyAnimatableData) -> AnyLayout3DBox {
        assertUnimplemented()
    }
}

fileprivate final class DefaultLayoutBox3D : AnyLayout3DBox {
    override func depthThatFits(proposal: _ProposedSize3D, subviews: LayoutSubviews3D, cache: inout AnyLayout.Cache) -> CGFloat {
        assertUnimplemented()
    }
}

struct AnyLayoutProperties : Rule, AsyncAttribute {
    @Attribute private var layout: AnyLayout
    
    init(layout: Attribute<AnyLayout>) {
        self._layout = layout
    }
    
    var value: Axis? {
        assertUnimplemented()
    }
}
