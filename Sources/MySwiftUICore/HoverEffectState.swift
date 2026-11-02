// 24C77E5116B970B96B6F77EB8D0191B5
internal import CoreGraphics

struct HoverEffectState {
    private(set) var groups: [HoverEffectState.GroupEffect] = []
    private(set) var leafEffects: [HoverEffectState.LeafEffect] = []
    
    func applyPosition(_ origin: CGPoint) -> Bool {
        if !groups.isEmpty {
            assertUnimplemented()
        }
        
        if !leafEffects.isEmpty {
            assertUnimplemented()
        }
        
        return false
    }
    
    func anyLeafEffectsSatisfy(_ block: (HoverEffectLeafValues) -> Bool) -> Bool {
        if groups.isEmpty && leafEffects.isEmpty {
            return false
        }
        
        assertUnimplemented()
    }
    
    func allLeafEffectsSatisfy(_ block: (HoverEffectLeafValues) -> Bool) -> Bool {
        assertUnimplemented()
    }
    
    mutating func applyContent(_ content: DisplayList.Content) -> Bool {
        assertUnimplemented()
    }
    
    mutating func reset(hasRecursiveValues: inout Bool) {
        assertUnimplemented()
    }
    
    mutating func appendContext(_ context: HoverEffectContext.Properties, identity: _DisplayList_Identity) {
        assertUnimplemented()
    }
    
    mutating func appendOpacity(context: HoverEffectContext.Properties, identity: _DisplayList_Identity, inactive: Float, active: Float, local: Float) {
        assertUnimplemented()
    }
    
    mutating func appendTransform(context: HoverEffectContext.Properties, identity: _DisplayList_Identity, inactive: CGAffineTransform, active: CGAffineTransform, local: CGAffineTransform) {
        assertUnimplemented()
    }
    
    mutating func appendClipEffect(context: HoverEffectContext.Properties, identity: _DisplayList_Identity, inactive: Path, active: Path, local: FixedRoundedRect?) {
        assertUnimplemented()
    }
    
    mutating func appendResizeEffect(context: HoverEffectContext.Properties, identity: _DisplayList_Identity, inactive: Path, active: Path, local: FixedRoundedRect?) {
        assertUnimplemented()
    }
    
    mutating func appendResizeByEffect(context: HoverEffectContext.Properties, identity: _DisplayList_Identity, insets: EdgeInsets?, isRecursive: Bool) {
        assertUnimplemented()
    }
    
    mutating func appendRemoteEffect(context: HoverEffectContext.Properties, identity: _DisplayList_Identity, descriptor: RemoteLeafEffectDescriptor) {
        assertUnimplemented()
    }
    
    fileprivate mutating func appendGroupIfNeeded(for group: HoverEffectContext.Group, block: (inout HoverEffectState) -> ()) {
        assertUnimplemented()
    }
    
    fileprivate mutating func appendNestedGroupsIfNeeded<Groups: Collection>(for groups: Groups, block: (inout HoverEffectState) -> ()) where Groups.Element == HoverEffectContext.Group {
        assertUnimplemented()
    }
    
    fileprivate mutating func updateLeafEffects(in state: HoverEffectContext.State, block: (inout HoverEffectLeafValues) -> ()) {
        assertUnimplemented()
    }
    
    fileprivate mutating func updateLeafEffects(in properties: HoverEffectContext.Properties, block: (inout HoverEffectLeafValues) -> ()) {
        assertUnimplemented()
    }
    
    fileprivate var containsClipEffects: Bool {
        assertUnimplemented()
    }
    
    fileprivate var containsResizeOrClipEffects: Bool {
        assertUnimplemented()
    }
    
    // canMergeWithPlatformState에서 구현을 봐야함
    @inline(always) // 원래 없음
    func canMerge(with path: Path) -> Bool {
        let result = self.anyLeafEffectsSatisfy { _ in
            assertUnimplemented()
        }
        
        if result {
            // <+536>
            if let _ = self.contentPath(from: path) {
                let result = self.anyLeafEffectsSatisfy { _ in
                    assertUnimplemented()
                }
                
                return result
            } else {
                return false
            }
        } else {
            return true
        }
    }
    // finalizePlatformMerge에서 구현을 봐야함
    @inline(always) // 원래 없음
    mutating func applyPath(_ path: Path) -> Bool {
        guard let _ = self.contentPath(from: path) else {
            return false
        }
        
        return self.updateLeafEffectState { _ in
            assertUnimplemented()
        }
    }
    
    // finalizePlatformMerge에서 구현을 봐야함
    @inline(always) // 원래 없음
    mutating func applyEffect(_ effect: DisplayList.Effect) -> Bool {
        switch effect {
        case .opacity(let opacity):
            return self.updateLeafEffectState { values in
                guard
                    var _opacity = values.opacity,
                    opacity != 1
                else {
                    return false
                }
                
                _opacity.inactiveValue *= opacity
                _opacity.activeValue *= opacity
                values.opacity = _opacity
                return true
            }
        case .clip:
            assertUnimplemented()
        case .transform(let transform):
            switch transform {
            case .affine(_):
                assertUnimplemented()
            case .projection(_):
                assertUnimplemented()
            case .affine3D(_):
                return false
            }
        default:
            return false
        }
    }
    
    fileprivate func contentPath(from path: Path) -> Path? {
        /*
         path -> x0 -> x20
         groups -> x1 -> x25
         leafEffects -> x2 -> x21
         */
        let shapeType = ShapeType(path)
        
        switch shapeType {
        case .rect(let rect, let radius, let style):
            // <+132>
            let roundedRect = FixedRoundedRect(
                rect,
                cornerRadius: radius,
                style: style
            )
            
            return Path(storage: .roundedRect(roundedRect))
        case .rectBorder(let rect, let radius, let style, _):
            // <+132>
            let roundedRect = FixedRoundedRect(
                rect,
                cornerRadius: radius,
                style: style
            )
            
            return Path(storage: .roundedRect(roundedRect))
        case .strokedPath(let path, _):
            // <+212>
            return self.contentPath(from: path)
        case .empty:
            // <+300>
            return nil
        case .other:
            // <+300>
            return nil
        }
    }
    
    fileprivate mutating func updateLeafEffectState(_ block: (inout HoverEffectLeafValues) -> Bool) -> Bool {
        var result = false
        
        for index in self.leafEffects.indices {
            result = block(&self.leafEffects[index].values) || result
        }
        
        for index in self.groups.indices {
            result = self.groups[index].effects.updateLeafEffectState(block) || result
        }
        
        return result
    }
}

extension HoverEffectState {
    struct GroupEffect {
        private var context: HoverEffectContext.Group
        fileprivate var effects: HoverEffectState
    }
    
    struct LeafEffect {
        fileprivate private(set) var context: HoverEffectContext.Properties
        fileprivate var values: HoverEffectLeafValues
    }
}

struct HoverEffectLeafValues {
    fileprivate var opacity: HoverEffectOpacityValue?
    private var affineTransform: HoverEffectAffineTransformValue?
    private var resize: HoverEffectResizeValue?
    private var resizeBy: HoverEffectResizeByValue?
    private var remoteLeafEffects: RemoteLeafEffectCollection?
}

struct HoverEffectOpacityValue {
    private let identity: _DisplayList_Identity
    fileprivate var inactiveValue: Float
    fileprivate var activeValue: Float
}

struct HoverEffectAffineTransformValue {
    private let identity: _DisplayList_Identity
    private var inactiveValue: CGAffineTransform
    private var activeValue: CGAffineTransform
}

struct HoverEffectResizeValue {
    private let identity: _DisplayList_Identity
    private var inactiveValue: FixedRoundedRect
    private var activeValue: FixedRoundedRect
    private var clipped: Bool
}

struct HoverEffectResizeByValue {
    private let identity: _DisplayList_Identity
    private var activeValue: EdgeInsets
    private var isRecursive: Bool
}

package struct HoverLeafEffect {
    // TODO
    
    func canMergeWithPlatformState(state: DisplayList.ViewUpdater.Model.PlatformState) -> Bool {
        assertUnimplemented()
    }
}
