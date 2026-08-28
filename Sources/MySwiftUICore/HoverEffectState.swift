// 24C77E5116B970B96B6F77EB8D0191B5
internal import CoreGraphics

struct HoverEffectState {
    private var groups: [HoverEffectState.GroupEffect] = []
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
    
    // finalizePlatformMerge에서 구현을 봐야함
    mutating func applyEffect(_ effect: DisplayList.Effect) -> Bool {
        switch effect {
        case .opacity(let opacity):
            return self.updateLeafEffectState { values in
                guard
                    var _opacity = values.opacity,
                    opacity != 1
                else {
                    return true
                }
                
                _opacity.inactiveValue *= opacity
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
    
    fileprivate mutating func updateLeafEffectState(_ block: (inout HoverEffectLeafValues) -> Bool) -> Bool {
        var result = false
        
        for index in self.leafEffects.indices {
            result = result || block(&self.leafEffects[index].values)
        }
        
        for index in self.groups.indices {
            result = result || self.groups[index].effects.updateLeafEffectState(block)
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
    private var activeValue: Float
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
