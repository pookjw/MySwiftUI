@_spi(Internal) internal import MyRealityFoundation

struct ImplicitAnimationComponent : MyRealityFoundation::Component {
    private var animations: [ImplicitAnimationComponent.Key : [_MyRealityKit_MySwiftUI::AnimationState]]
    
    static var __typeName: String {
        assertUnimplemented()
    }
    
    static var componentName: String {
        assertUnimplemented()
    }
    
    static var __size: Int {
        assertUnimplemented()
    }
    
    static func __load(from ref: UnsafeRawPointer) {
        assertUnimplemented()
    }
    
    static func __store(attribute: any MyRealityFoundation::Component, to ref: UnsafeMutableRawPointer, offset: Int, deinitialize: Bool) {
        assertUnimplemented()
    }
    
    static func __store(attribute: any MyRealityFoundation::Component, to ref: UnsafeMutableRawPointer, offset: Int) {
        assertUnimplemented()
    }
    
    static func __free(to buffer: UnsafeMutableRawPointer, offset: Int) {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor static func __fromCore(_ coreComponent: __ComponentRef) -> Self {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor func __toCore(_ coreComponent: __ComponentRef) {
        assertUnimplemented()
    }
    
    static var __coreComponentType: __ComponentTypeRef {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor static func __addIntrospectionData(_ builder: OpaquePointer?) {
        assertUnimplemented()
    }
    
    static func __load(from ref: UnsafeRawPointer, offset: Int) -> any MyRealityFoundation::Component {
        assertUnimplemented()
    }
    
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
