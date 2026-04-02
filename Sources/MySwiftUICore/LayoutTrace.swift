internal import AttributeGraph
internal import CoreGraphics

struct LayoutTrace {
    static func register(graph: Graph) {
        assertUnimplemented()
    }
    
    static var isEnabled: Bool {
        assertUnimplemented()
    }
    
    nonisolated(unsafe) static var recorder: LayoutTrace.Recorder? = nil
    
    static func traceSizeThatFits(_: AnyAttribute?, proposal: _ProposedSize, _: () -> CGSize) -> CGSize {
        assertUnimplemented()
    }
    
    static func traceLengthThatFits(_: AnyAttribute?, proposal: _ProposedSize, in: Axis, _: () -> CGFloat) -> CGFloat {
        assertUnimplemented()
    }
    
    static func traceCacheLookup(_: _ProposedSize, _: Bool) {
        assertUnimplemented()
    }
    
    static func traceCacheLookup(_: CGSize, _: Bool) {
        assertUnimplemented()
    }
    
    static func traceChildGeometries(_: AnyAttribute?, at: ViewSize, origin: CGPoint, _: () -> [ViewGeometry]) -> [ViewGeometry] {
        assertUnimplemented()
    }
    
    static func traceContentDescription(_: AnyAttribute?, _: String) {
        assertUnimplemented()
    }
    
    static func traceExplicitAlignment(_: AnyAttribute?, alignment: AlignmentKey, at: ViewSize, body: () -> CGFloat?) -> CGFloat? {
        assertUnimplemented()
    }
    
    // TODO
}

extension LayoutTrace {
    final class Recorder {
        var graph: Graph // 0x10
        var frameActive: Bool // 0x18
        var cacheLookup: (proposal: _ProposedSize, hit: Bool)? // 0x20
        private var alignmentTypes: [ObjectIdentifier: UInt32] // 0x40
        
        func alignmentTypeID(for: any AlignmentID.Type) -> UInt32 {
            assertUnimplemented()
        }
        
        func traceSizeThatFits(_: AnyAttribute?, proposal: _ProposedSize, _: () -> CGSize) -> CGSize {
            assertUnimplemented()
        }
        
        func traceLengthThatFits(_: AnyAttribute?, proposal: _ProposedSize, in: Axis, _: () -> CGFloat) -> CGFloat {
            assertUnimplemented()
        }
        
        func traceChildGeometries(_: AnyAttribute?, at: ViewSize, origin: CGPoint, body: () -> [ViewGeometry]) -> [ViewGeometry] {
            assertUnimplemented()
        }
        
        func traceExplicitAlignment(_: AnyAttribute?, alignment: AlignmentKey, at: ViewSize, body: () -> CGFloat?) -> CGFloat? {
            assertUnimplemented()
        }
        
        func activateFrameIfNeeded() {
            assertUnimplemented()
        }
        
        init() {
            assertUnimplemented()
        }
    }
}
