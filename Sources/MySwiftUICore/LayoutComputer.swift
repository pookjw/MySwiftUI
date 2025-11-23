#warning("TODO")
internal import AttributeGraph
internal import CoreGraphics

struct LayoutComputer {
    @inline(never)
    @safe static nonisolated(unsafe) let defaultValue = LayoutComputer(LayoutComputer.DefaultEngine())
    @inline(never)
    @safe static nonisolated(unsafe) let defaultValue3D = LayoutComputer(LayoutComputer.DefaultEngine3D())
    
    private var box: AnyLayoutEngineBox
    private var seed: Int
    
    init<T: LayoutEngine>(_ engine: T) {
        if unsafe LayoutTrace.recorder != nil {
            self.box = TracingLayoutEngineBox(engine: engine)
        } else {
            self.box = LayoutEngineBox(engine: engine)
        }
        
        self.seed = 0
    }
    
    func sizeThatFits(_ proposedSize: _ProposedSize) -> CGSize {
        Update.assertIsLocked()
        return box.sizeThatFits(proposedSize)
    }
    
    mutating func withMutableEngine<T: LayoutEngine, U>(type: T.Type, do block: (inout T) -> U) -> U {
        Update.assertIsLocked()
        return box.mutateEngine(type: type, do: block)
    }
}

protocol LayoutEngine {
    func layoutPriority() -> Double
    func ignoresAutomaticPadding() -> Bool
    func requiresSpacingProjection() -> Bool
    func spacing() -> Spacing
    func sizeThatFits(_ proposedSize: _ProposedSize) -> CGSize
    func lengthThatFits(_ proposedSize: _ProposedSize, in axis: Axis) -> CGFloat
    func childGeometries(at viewSize: ViewSize, origin: CGPoint) -> [ViewGeometry]
    func explicitAlignment(_ alignmentKey: AlignmentKey, at viewSize: ViewSize) -> CGFloat?
//    func childPlacement(at viewSize: ViewSize) -> _Placement
//    func childPlacement(at viewSize: ViewSize, placementContext: _PositionAwarePlacementContext) -> _Placement
    func depthThatFits(_ proposedSize: _ProposedSize3D) -> CGFloat
    func explicitDepthAlignment(_ alignmentKey: DepthAlignmentKey, at viewSize: ViewSize3D) -> CGFloat?
    func requiresTrueDepthLayout() -> Bool
    var debugContentDescription: String? { get }
}

extension LayoutEngine {
    func layoutPriority() -> Double {
        fatalError("TODO")
    }
    
    func ignoresAutomaticPadding() -> Bool {
        fatalError("TODO")
    }
    
    func requiresSpacingProjection() -> Bool {
        fatalError("TODO")
    }
    
    func spacing() -> Spacing {
        fatalError("TODO")
    }
    
    func lengthThatFits(_ proposedSize: _ProposedSize, in axis: Axis) -> CGFloat {
        fatalError("TODO")
    }
    
    func sizeThatFits(_ proposedSize: _ProposedSize) -> CGSize {
        fatalError("TODO")
    }
    
    func childGeometries(at viewSize: ViewSize, origin: CGPoint) -> [ViewGeometry] {
        fatalError("TODO")
    }
    
    func explicitAlignment(_ alignmentKey: AlignmentKey, at viewSize: ViewSize) -> CGFloat? {
        fatalError("TODO")
    }
    
//    func childPlacement(at viewSize: ViewSize) -> _Placement {
//        fatalError("TODO")
//    }
//    
//    func childPlacement(at viewSize: ViewSize, placementContext: _PositionAwarePlacementContext) -> _Placement {
//        fatalError("TODO")
//    }
    
    func depthThatFits(_ proposedSize: _ProposedSize3D) -> CGFloat {
        fatalError("TODO")
    }
    
    func explicitDepthAlignment(_ alignmentKey: DepthAlignmentKey, at viewSize: ViewSize3D) -> CGFloat? {
        fatalError("TODO")
    }
    
    func requiresTrueDepthLayout() -> Bool {
        fatalError("TODO")
    }
    
    var debugContentDescription: String? {
        fatalError("TODO")
    }
}

protocol DerivedLayoutEngine: LayoutEngine {
    var base: LayoutComputer { get }
}

extension DerivedLayoutEngine {
    func layoutPriority() -> Double {
        fatalError("TODO")
    }
    
    func ignoresAutomaticPadding() -> Bool {
        fatalError("TODO")
    }
    
    func requiresSpacingProjection() -> Bool {
        fatalError("TODO")
    }
    
    func spacing() -> Spacing {
        fatalError("TODO")
    }
    
    func lengthThatFits(_ proposedSize: _ProposedSize, in axis: Axis) -> CGFloat {
        fatalError("TODO")
    }
    
    func sizeThatFits(_ proposedSize: _ProposedSize) -> CGSize {
        fatalError("TODO")
    }
    
    func childGeometries(at viewSize: ViewSize, origin: CGPoint) -> [ViewGeometry] {
        fatalError("TODO")
    }
    
    func explicitAlignment(_ alignmentKey: AlignmentKey, at viewSize: ViewSize) -> CGFloat? {
        fatalError("TODO")
    }
    
//    func childPlacement(at viewSize: ViewSize) -> _Placement {
//        fatalError("TODO")
//    }
//    
//    func childPlacement(at viewSize: ViewSize, placementContext: _PositionAwarePlacementContext) -> _Placement {
//        fatalError("TODO")
//    }
    
    func depthThatFits(_ proposedSize: _ProposedSize3D) -> CGFloat {
        fatalError("TODO")
    }
    
    func explicitDepthAlignment(_ alignmentKey: DepthAlignmentKey, at viewSize: ViewSize3D) -> CGFloat? {
        fatalError("TODO")
    }
    
    func requiresTrueDepthLayout() -> Bool {
        fatalError("TODO")
    }
}

extension LayoutComputer {
    struct DefaultEngine: LayoutEngine {
        func sizeThatFits(_ proposedSize: _ProposedSize) -> CGSize {
            return proposedSize.fixingUnspecifiedDimensions()
        }
    }
    
    struct DefaultEngine3D: LayoutEngine {
        func sizeThatFits(_ proposedSize: _ProposedSize) -> CGSize {
            fatalError("TODO")
        }
    }
}

fileprivate class AnyLayoutEngineBox {
    func sizeThatFits(_ proposedSize: _ProposedSize) -> CGSize {
        fatalError() // abstract
    }
    
    func mutateEngine<T: LayoutEngine, U>(type: T.Type, do block: (inout T) -> U) -> U {
        fatalError() // abstract
    }
}

fileprivate class LayoutEngineBox<T: LayoutEngine>: AnyLayoutEngineBox {
    var engine: T
    
    init(engine: T) {
        self.engine = engine
    }
    
    override func sizeThatFits(_ proposedSize: _ProposedSize) -> CGSize {
        return engine.sizeThatFits(proposedSize)
    }
}

fileprivate class TracingLayoutEngineBox<T: LayoutEngine>: LayoutEngineBox<T> {
    var attribute: AnyAttribute?
    
    override init(engine: T) {
        fatalError("TODO")
    }
}

struct DepthStashingLayoutComputer: StatefulRule, AsyncAttribute {
    typealias Value = LayoutComputer
    
    @Attribute private var layoutComputer: LayoutComputer
    @Attribute private var depth: ViewDepth
    
    init(layoutComputer: Attribute<LayoutComputer>, depth: Attribute<ViewDepth>) {
        self._layoutComputer = layoutComputer
        self._depth = depth
    }
    
    func updateValue() {
        let layoutComputer = self.layoutComputer
        let depth = self.depth
        let depthProposal = depth.propsal
        
        self.update(
            modify: { engine in
                // $s14AttributeGraph12StatefulRuleP7SwiftUIAD14LayoutComputerV5ValueRtzrlE6update2toyqd___tAD0G6EngineRd__lFyqd__zXEfU_AD013DepthStashinggH0V_AM0L0VTG5TA
                fatalError("TODO")
            },
            create: {
                // $s14AttributeGraph12StatefulRuleP7SwiftUIAD14LayoutComputerV5ValueRtzrlE6update2toyqd___tAD0G6EngineRd__lFqd__yXEfU0_AD013DepthStashinggH0V_AM0L0VTG5TA
                return DepthStashingLayoutComputer.Engine(base: layoutComputer, depthProposal: depthProposal)
            }
        )
    }
}

extension DepthStashingLayoutComputer {
    struct Engine: DerivedLayoutEngine {
        let base: LayoutComputer
        private let depthProposal: CGFloat?
        
        // 원래 없음
        @inline(__always)
        fileprivate init(base: LayoutComputer, depthProposal: CGFloat?) {
            self.base = base
            self.depthProposal = depthProposal
        }
    }
}

struct EnableLayoutDepthStashing: UserDefaultKeyedFeature, PropertyKey {
    static var key: String {
        return "com.apple.SwiftUI.EnableLayoutDepthStashing"
    }
    
    @safe static nonisolated(unsafe) var cachedValue: Bool? = nil
    
    @safe static nonisolated(unsafe) var defaultFeatureValue: Bool = true
}

extension StatefulRule where Value == LayoutComputer {
    func update<T: LayoutEngine>(modify: (inout T) -> Void, create: () -> T) {
        if hasValue {
            var value = self.value
            value.withMutableEngine(type: T.self, do: modify)
            self.value = value
        } else {
            self.value = LayoutComputer(create())
        }
    }
}
