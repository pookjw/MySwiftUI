internal import AttributeGraph
internal import CoreGraphics

struct LayoutTrace {
    static func register(graph: Graph) {
        fatalError("TODO")
    }
    
    static var isEnabled: Bool {
        fatalError("TODO")
    }
    
    static nonisolated(unsafe) var recorder: LayoutTrace.Recorder? = nil
    
    static func traceSizeThatFits(_: AnyAttribute?, proposal: _ProposedSize, _: () -> CGSize) -> CGSize {
        fatalError("TODO")
    }
    
    static func traceLengthThatFits(_: AnyAttribute?, proposal: _ProposedSize, in: Axis, _: () -> CGFloat) -> CGFloat {
        fatalError("TODO")
    }
    
    static func traceCacheLookup(_: _ProposedSize, _: Bool) {
        fatalError("TODO")
    }
    
    static func traceCacheLookup(_: CGSize, _: Bool) {
        fatalError("TODO")
    }
    
    static func traceChildGeometries(_: AnyAttribute?, at: ViewSize, origin: CGPoint, _: () -> [ViewGeometry]) -> [ViewGeometry] {
        fatalError("TODO")
    }
    
    static func traceContentDescription(_: AnyAttribute?, _: String) {
        fatalError("TODO")
    }
    
    static func traceExplicitAlignment(_: AnyAttribute?, alignment: AlignmentKey, at: ViewSize, body: () -> CGFloat?) -> CGFloat? {
        fatalError("TODO")
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
            fatalError("TODO")
        }
        
        func traceSizeThatFits(_: AnyAttribute?, proposal: _ProposedSize, _: () -> CGSize) -> CGSize {
            fatalError("TODO")
        }
        
        func traceLengthThatFits(_: AnyAttribute?, proposal: _ProposedSize, in: Axis, _: () -> CGFloat) -> CGFloat {
            fatalError("TODO")
        }
        
        func traceChildGeometries(_: AnyAttribute?, at: ViewSize, origin: CGPoint, body: () -> [ViewGeometry]) -> [ViewGeometry] {
            fatalError("TODO")
        }
        
        func traceExplicitAlignment(_: AnyAttribute?, alignment: AlignmentKey, at: ViewSize, body: () -> CGFloat?) -> CGFloat? {
            fatalError("TODO")
        }
        
        func activateFrameIfNeeded() {
            fatalError("TODO")
        }
        
        init() {
            fatalError("TODO")
        }
    }
}
