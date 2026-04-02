internal import MySwiftUICore
internal import AttributeGraph

struct ImmersiveSpaceSceneUpdateTransition : CustomStringConvertible {
    private let style: ImmersiveSpaceSceneUpdateTransition.Style
    private let seed: UInt
    
    var description: String {
        assertUnimplemented()
    }
}

extension ImmersiveSpaceSceneUpdateTransition {
    enum Style : CustomStringConvertible {
        case animated(Animation?)
        case notAnimated
        
        var description: String {
            assertUnimplemented()
        }
    }
}

struct SceneUpdateTransitionAnimationInput : SceneInput {
    static var defaultValue: OptionalAttribute<ImmersiveSpaceSceneUpdateTransition> {
        return OptionalAttribute()
    }
}
