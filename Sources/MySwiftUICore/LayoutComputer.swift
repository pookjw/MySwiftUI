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
}

protocol LayoutEngine {
    // TODO
    func sizeThatFits(_ proposedSize: _ProposedSize) -> CGSize
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
        fatalError("TODO")
    }
}

struct EnableLayoutDepthStashing: UserDefaultKeyedFeature, ViewInputBoolFlag, PropertyKey {
    static var key: String {
        return "com.apple.SwiftUI.EnableLayoutDepthStashing"
    }
    
    @safe static nonisolated(unsafe) var cachedValue: Bool? = nil
    
    @safe static nonisolated(unsafe) var defaultFeatureValue: Bool = true
}
