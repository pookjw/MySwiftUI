// 91FCB5522C30220AE13689E45789FEF2

internal import AttributeGraph
internal import CoreGraphics
private import _MySwiftUIShims

// ViewDimensions3D이 그냥 Sendable인 것을 보아 LayoutComputer이 @unchecked Sendable
struct LayoutComputer: @unchecked Sendable {
    @safe static let defaultValue = LayoutComputer(LayoutComputer.DefaultEngine())
    @safe static let defaultValue3D = LayoutComputer(LayoutComputer.DefaultEngine3D())
    
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
    
    func explicitAlignment(_ alignmentKey: AlignmentKey, at viewSize: ViewSize) -> CGFloat? {
        Update.assertIsLocked()
        return box.explicitAlignment(alignmentKey, at: viewSize)
    }
    
    func depthThatFits(_ proposedSize: _ProposedSize3D) -> CGFloat {
        Update.assertIsLocked()
        
        if EnableLayoutDepthStashing.isEnabled {
            var proposedSize = proposedSize
            // x19
            let old = unsafe _threadLayoutDepthData()
            unsafe _setThreadLayoutDepthData(&proposedSize.depth)
            
            // proposedSize -> sp + 0x28
            
            let depth = box.depthThatFits(proposedSize)
            unsafe _setThreadLayoutDepthData(old)
            return depth
        } else {
            // <+232>
            // sp + 0x28
            _ = proposedSize
            return box.depthThatFits(proposedSize)
        }
    }
    
    func childGeometries(at viewSize: ViewSize, origin: CGPoint) -> [ViewGeometry] {
        return Update.ensure { 
            return box.childGeometries(at: viewSize, origin: origin)
        }
    }
    
    mutating func withMutableEngine<T: LayoutEngine, U>(type: T.Type, do block: (inout T) -> U) -> U {
        Update.assertIsLocked()
        return box.mutateEngine(as: type, do: block)
    }
    
    func requiresTrueDepthLayout() -> Bool {
        return box.requiresTrueDepthLayout()
    }
    
    var layoutPriority: Double {
        Update.assertIsLocked()
        return box.layoutPriority()
    }
    
    func lengthThatFits(_ size: _ProposedSize, in axis: Axis) -> CGFloat {
        Update.assertIsLocked()
        return box.lengthThatFits(size, in: axis)
    }
    
    func explicitDepthAlignment(_: DepthAlignmentKey, at: ViewSize3D) -> CGFloat? {
        fatalError("TODO")
    }
}

extension LayoutComputer: Equatable {
    static func == (lhs: LayoutComputer, rhs: LayoutComputer) -> Bool {
        return lhs.seed == rhs.seed && lhs.box === rhs.box
    }
}

struct _PositionAwarePlacementContext {
    private var context: AnyRuleContext
    private var owner: AnyAttribute
    @Attribute private var size: ViewSize
    @Attribute private var environment: EnvironmentValues
    @Attribute private var transform: ViewTransform
    @Attribute private var position: CGPoint
    @OptionalAttribute private var safeAreaInsets: SafeAreaInsets?
}

protocol LayoutEngine {
    func layoutPriority() -> Double
    func ignoresAutomaticPadding() -> Bool
    func requiresSpacingProjection() -> Bool
    func spacing() -> Spacing
    mutating func sizeThatFits(_ proposedSize: _ProposedSize) -> CGSize
    func lengthThatFits(_ proposedSize: _ProposedSize, in axis: Axis) -> CGFloat
    func childGeometries(at viewSize: ViewSize, origin: CGPoint) -> [ViewGeometry]
    func explicitAlignment(_ alignmentKey: AlignmentKey, at viewSize: ViewSize) -> CGFloat?
    func childPlacement(at viewSize: ViewSize) -> _Placement
    func childPlacement(at viewSize: ViewSize, placementContext: _PositionAwarePlacementContext) -> _Placement
    mutating func depthThatFits(_ proposedSize: _ProposedSize3D) -> CGFloat
    func explicitDepthAlignment(_ alignmentKey: DepthAlignmentKey, at viewSize: ViewSize3D) -> CGFloat?
    func requiresTrueDepthLayout() -> Bool
    var debugContentDescription: String? { get }
}

extension LayoutEngine {
    func layoutPriority() -> Double {
        return 0
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
        return nil
    }
    
    func childPlacement(at viewSize: ViewSize) -> _Placement {
        fatalError("TODO")
    }
    
    func childPlacement(at viewSize: ViewSize, placementContext: _PositionAwarePlacementContext) -> _Placement {
        fatalError("TODO")
    }
    
    func depthThatFits(_ proposedSize: _ProposedSize3D) -> CGFloat {
        return 0
    }
    
    func explicitDepthAlignment(_ alignmentKey: DepthAlignmentKey, at viewSize: ViewSize3D) -> CGFloat? {
        fatalError("TODO")
    }
    
    func requiresTrueDepthLayout() -> Bool {
        fatalError("TODO")
        return false
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
    
    func childPlacement(at viewSize: ViewSize) -> _Placement {
        fatalError("TODO")
    }
    
    func childPlacement(at viewSize: ViewSize, placementContext: _PositionAwarePlacementContext) -> _Placement {
        fatalError("TODO")
    }
    
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
        
        func childGeometries(at viewSize: ViewSize, origin: CGPoint) -> [ViewGeometry] {
            fatalError("TODO")
        }
        
        func requiresTrueDepthLayout() -> Bool {
            return false
        }
    }
    
    struct DefaultEngine3D: LayoutEngine {
        func depthThatFits(_ proposedSize: _ProposedSize3D) -> CGFloat {
            fatalError("TODO")
        }
        
        func sizeThatFits(_ proposedSize: _ProposedSize) -> CGSize {
            fatalError("TODO")
        }
        
        func childGeometries(at viewSize: ViewSize, origin: CGPoint) -> [ViewGeometry] {
            fatalError("TODO")
        }
    }
}

fileprivate class AnyLayoutEngineBox {
    func mutateEngine<T: LayoutEngine, U>(as type: T.Type, do body: (inout T) -> U) -> U {
        fatalError() // abstract
    }
    
    func sizeThatFits(_ proposedSize: _ProposedSize) -> CGSize {
        fatalError() // abstract
    }
    
    func depthThatFits(_ proposedSize: _ProposedSize3D) -> CGFloat {
        fatalError() // abstract
    }
    
    func childGeometries(at viewSize: ViewSize, origin: CGPoint) -> [ViewGeometry] {
        fatalError() // abstract
    }
    
    func requiresTrueDepthLayout() -> Bool {
        fatalError() // abstract
    }
    
    func layoutPriority() -> Double {
        fatalError() // abstract
    }
    
    func lengthThatFits(_ size: _ProposedSize, in axis: Axis) -> CGFloat {
        fatalError() // abstract
    }
    
    func explicitAlignment(_ alignmentKey: AlignmentKey, at viewSize: ViewSize) -> CGFloat? {
        fatalError() // abstract
    }
}

fileprivate class LayoutEngineBox<Engine: LayoutEngine>: AnyLayoutEngineBox {
    var engine: Engine
    
    init(engine: Engine) {
        self.engine = engine
    }
    
    override func mutateEngine<T, U>(as type: T.Type, do body: (inout T) -> U) -> U where T : LayoutEngine {
        guard type == Engine.self else {
            fatalError("Mismatched engine type")
        }
        
        return unsafe withUnsafePointer(to: &engine) { pointer in
            let pointer = unsafe UnsafeMutableRawPointer(mutating: pointer)
                .assumingMemoryBound(to: T.self)
            return unsafe body(&pointer.pointee)
        }
    }
    
    override func sizeThatFits(_ proposedSize: _ProposedSize) -> CGSize {
        return engine.sizeThatFits(proposedSize)
    }
    
    override func depthThatFits(_ proposedSize: _ProposedSize3D) -> CGFloat {
        return engine.depthThatFits(proposedSize)
    }
    
    override func childGeometries(at viewSize: ViewSize, origin: CGPoint) -> [ViewGeometry] {
        return engine.childGeometries(at: viewSize, origin: origin)
    }
    
    override func requiresTrueDepthLayout() -> Bool {
        return engine.requiresTrueDepthLayout()
    }
    
    override func layoutPriority() -> Double {
        return engine.layoutPriority()
    }
    
    override func lengthThatFits(_ size: _ProposedSize, in axis: Axis) -> CGFloat {
        fatalError("TODO")
    }
    
    override func explicitAlignment(_ alignmentKey: AlignmentKey, at viewSize: ViewSize) -> CGFloat? {
        return engine.explicitAlignment(alignmentKey, at: viewSize)
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
        let depthProposal = depth.proposal
        
        self.update(
            modify: { engine in
                // $s14AttributeGraph12StatefulRuleP7SwiftUIAD14LayoutComputerV5ValueRtzrlE6update2toyqd___tAD0G6EngineRd__lFyqd__zXEfU_AD013DepthStashinggH0V_AM0L0VTG5TA
                engine = DepthStashingLayoutComputer.Engine(base: layoutComputer, depthProposal: depthProposal)
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
        
        func sizeThatFits(_ proposedSize: _ProposedSize) -> CGSize {
            var proposedSize = proposedSize
            
            if EnableLayoutDepthStashing.isEnabled {
                // <+80>
                let old = unsafe _threadLayoutDepthData()
                unsafe _setThreadLayoutDepthData(&proposedSize.height)
                Update.assertIsLocked()
                let size = base.sizeThatFits(proposedSize)
                unsafe _setThreadLayoutDepthData(old)
                return size
            } else {
                // <+240>
                Update.assertIsLocked()
                let size = base.sizeThatFits(proposedSize)
                return size
            }
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

func withStashedDepthProposal<T>(execute: (CGFloat?) -> T) -> T {
    fatalError("TODO")
}
