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
    func applyEffect(_ effect: DisplayList.Effect) -> Bool {
        switch effect {
        case .opacity(let opacity):
            return self.updateLeafEffectState { values in
                assertUnimplemented()
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
    
    fileprivate func updateLeafEffectState(_ block: (inout HoverEffectLeafValues) -> Bool) -> Bool {
        assertUnimplemented()
    }
}

extension HoverEffectState {
    struct GroupEffect {
        // TODO
    }
    
    struct LeafEffect {
        // TODO
    }
}

struct HoverEffectLeafValues {
    var opacity: HoverEffectOpacityValue?
    var affineTransform: HoverEffectAffineTransformValue?
    var resize: HoverEffectResizeValue?
    var resizeBy: HoverEffectResizeByValue?
    var remoteLeafEffects: RemoteLeafEffectCollection?
}

struct HoverEffectOpacityValue {
    let identity: _DisplayList_Identity
    var inactiveValue: Float
    var activeValue: Float
}

struct HoverEffectAffineTransformValue {
    let identity: _DisplayList_Identity
    var inactiveValue: CGAffineTransform
    var activeValue: CGAffineTransform
}

struct HoverEffectResizeValue {
    let identity: _DisplayList_Identity
    var inactiveValue: FixedRoundedRect
    var activeValue: FixedRoundedRect
    var clipped: Bool
}

struct HoverEffectResizeByValue {
    let identity: _DisplayList_Identity
    var activeValue: EdgeInsets
    var isRecursive: Bool
}

package struct HoverLeafEffect {
    // TODO
    
    func canMergeWithPlatformState(state: DisplayList.ViewUpdater.Model.PlatformState) -> Bool {
        assertUnimplemented()
    }
}
