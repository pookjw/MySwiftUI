// 236BA2660974ECECC5FBCA685B96F88F
public import CoreGraphics
internal import AttributeGraph
private import Spatial

@frozen public struct AnyLayout : Layout, Sendable {
    var storage: AnyLayoutBox
    
    public init<L>(_ layout: L) where L : Layout {
        self.storage = _AnyLayoutBox(layout)
    }
    
    public struct Cache : Sendable {
    }
    
    public typealias AnimatableData = _AnyAnimatableData
    
    public func makeCache(subviews: AnyLayout.Subviews) -> AnyLayout.Cache {
        assertUnimplemented()
    }
    
    public func updateCache(_ cache: inout AnyLayout.Cache, subviews: AnyLayout.Subviews) {
        assertUnimplemented()
    }
    
    public func spacing(subviews: AnyLayout.Subviews, cache: inout AnyLayout.Cache) -> ViewSpacing {
        assertUnimplemented()
    }
    
    public func sizeThatFits(proposal: ProposedViewSize, subviews: AnyLayout.Subviews, cache: inout AnyLayout.Cache) -> CGSize {
        assertUnimplemented()
    }
    
    public func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: AnyLayout.Subviews, cache: inout AnyLayout.Cache) {
        assertUnimplemented()
    }
    
    public func explicitAlignment(of guide: HorizontalAlignment, in bounds: CGRect, proposal: ProposedViewSize, subviews: AnyLayout.Subviews, cache: inout AnyLayout.Cache) -> CGFloat? {
        assertUnimplemented()
    }
    
    public func explicitAlignment(of guide: VerticalAlignment, in bounds: CGRect, proposal: ProposedViewSize, subviews: AnyLayout.Subviews, cache: inout AnyLayout.Cache) -> CGFloat? {
        assertUnimplemented()
    }
    
    public var animatableData: AnyLayout.AnimatableData {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
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
        // 단순 할당 아님
        assertUnimplemented()
    }
    
    fileprivate init(_ layout: L, layout3DBox: AnyLayout3DBox) {
        self.layout = layout
        super.init(layout3DBox: layout3DBox)
    }
    
    override var layoutProperties: LayoutProperties {
        assertUnimplemented()
    }
    
    override func makeCache(subviews: LayoutSubviews) -> AnyLayout.Cache {
        assertUnimplemented()
    }
    
    override func updateCache(_: inout AnyLayout.Cache, subviews: LayoutSubviews) {
        assertUnimplemented()
    }
    
    override func spacing(subviews: LayoutSubviews, cache: inout AnyLayout.Cache) -> ViewSpacing {
        assertUnimplemented()
    }
    
    override func sizeThatFits(proposal: ProposedViewSize, subviews: LayoutSubviews, cache: inout AnyLayout.Cache) -> CGSize {
        assertUnimplemented()
    }
    
    override func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: LayoutSubviews, cache: inout AnyLayout.Cache) {
        assertUnimplemented()
    }
    
    override func explicitAlignment(of alignment: HorizontalAlignment, in bounds: CGRect, proposal: ProposedViewSize, subviews: LayoutSubviews, cache: inout AnyLayout.Cache) -> CGFloat {
        assertUnimplemented()
    }
    
    override func explicitAlignment(of alignment: VerticalAlignment, in bounds: CGRect, proposal: ProposedViewSize, subviews: LayoutSubviews, cache: inout AnyLayout.Cache) -> CGFloat? {
        assertUnimplemented()
    }
    
    override var animatableData: _AnyAnimatableData {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
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
    
    override init() { // 없음
        assertUnimplemented()
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

struct AnyLayoutProperties : Rule, AsyncAttribute {
    @Attribute private var layout: AnyLayout
    
    init(layout: Attribute<AnyLayout>) {
        self._layout = layout
    }
    
    var value: Axis? {
        assertUnimplemented()
    }
}
