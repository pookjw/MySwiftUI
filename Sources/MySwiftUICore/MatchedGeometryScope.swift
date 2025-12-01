// A807106ED9CAA3A498EAF9830EEF9240
private import AttributeGraph

extension _ViewInputs {
    mutating func makeRootMatchedGeometryScope() {
        guard self[MatchedGeometryScope.self] == nil else {
            return
        }
        
        let scope = MatchedGeometryScope(subgraph: .current!, inputs: self)
        self[MatchedGeometryScope.self] = scope
    }
}

fileprivate final class MatchedGeometryScope: ViewInput {
    static var defaultValue: MatchedGeometryScope? {
        return nil
    }
    
    private let subgraph: Subgraph
    private let inputs: _ViewInputs
    private var frames: [MatchedGeometryScope.Frame]
    private var keyedFrames: [AnyHashable: Int]
    
    init(subgraph: Subgraph, inputs: _ViewInputs) {
        self.subgraph = subgraph
        self.inputs = inputs
        self.frames = []
        self.keyedFrames = [:]
    }
}

extension MatchedGeometryScope {
    fileprivate struct Frame {
        @Attribute private var frame: (SharedFrame.Geometry?, AnyOptionalAttribute)
        private var key: AnyHashable
        private var views: [MatchedGeometryScope.Frame.View]
        private var viewsSeed: UInt32
        private var logged: Bool
    }
}

extension MatchedGeometryScope.Frame {
    fileprivate struct View {
        private var attribute: AnyAttribute
        @Attribute private var args: (properties: MatchedGeometryProperties, anchor: UnitPoint, isSource: Bool)
        @Attribute private var transaction: Transaction
        @Attribute private var phase: _GraphInputs.Phase
        @Attribute private var size: ViewSize
        @Attribute private var position: CGPoint
        @Attribute private var transform: ViewTransform
    }
}

extension MatchedGeometryScope {
    fileprivate struct EmptyKey: Hashable {
    }
}

fileprivate struct SharedFrame {
    @Attribute private var time: Time
    private let scope: MatchedGeometryScope
    private let frameIndex: Int
//    private var listeners: [AnimationListener]
//    private var animatorState: 7SwiftUI13AnimatorStateCy7SwiftUI14AnimatablePairVyAByABy12CoreGraphics7CGFloatVACGADGADGGSg
    private var resetSeed: UInt32
    private var lastSourceAttribute: AnyWeakAttribute
}

extension SharedFrame {
    fileprivate struct Geometry {
        private var frame: ViewFrame
        private var depth: ViewDepthGeometry
    }
}

@frozen public struct MatchedGeometryProperties: OptionSet {
    public let rawValue: UInt32
    
    @inlinable public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }
    
    public static var position: MatchedGeometryProperties {
        return MatchedGeometryProperties(rawValue: 1 << 0)
    }
    
    public static var size: MatchedGeometryProperties {
        return MatchedGeometryProperties(rawValue: 1 << 1)
    }
    
    public static var frame: MatchedGeometryProperties {
        return [.position, .size]
    }
    
    static var clipRect: MatchedGeometryProperties {
        return MatchedGeometryProperties(rawValue: 1 << 2)
    }
}
