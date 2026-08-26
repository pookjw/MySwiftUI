@_spi(Internal) internal import MyRealityFoundation

struct ImplicitAnimationComponent : MyRealityFoundation::Component {
    private var animations: [ImplicitAnimationComponent.Key : [_MyRealityKit_MySwiftUI::AnimationState]]
    mutating func update(context: SceneUpdateContext) {
        assertUnimplemented()
    }
}

extension ImplicitAnimationComponent {
    struct Key : Hashable {
        private let entity: MyRealityFoundation::Entity
        private let componentType: any _ImplicitlyAnimatableBuiltinComponent.Type
        
        static func == (lhs: ImplicitAnimationComponent.Key, rhs: ImplicitAnimationComponent.Key) -> Bool {
            assertUnimplemented()
        }
        
        func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
    }
}
