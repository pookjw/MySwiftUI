internal import MySwiftUICore
internal import AttributeGraph

struct ImmersiveSpaceSceneUpdateTransition : CustomStringConvertible {
    let style: ImmersiveSpaceSceneUpdateTransition.Style
    let seed: UInt
    
    var description: String {
        return "style: \(self.style.description) seed: \(self.seed.description)"
    }
}

extension ImmersiveSpaceSceneUpdateTransition {
    enum Style : CustomStringConvertible {
        case animated(Animation?)
        case notAnimated
        
        var description: String {
            switch self {
            case .animated(let animation):
                if let animation {
                    return ".animated(\(animation.description))"
                } else {
                    return ".animated(nil)"
                }
            case .notAnimated:
                return ".notAnimated"
            }
        }
    }
}

struct SceneUpdateTransitionAnimationInput : SceneInput {
    static var defaultValue: OptionalAttribute<ImmersiveSpaceSceneUpdateTransition> {
        return OptionalAttribute()
    }
}
