// perFrameCompletionClosures
internal import MyRealityFoundation

final class ImplicitAnimationSystem : System {
    // $s19_RealityKit_SwiftUI23ImplicitAnimationSystemC5query_WZ
    static let query = EntityQuery(where: .has(ImplicitAnimationComponent.self))
    
    init(scene: MyRealityFoundation::Scene) {
        // noop
    }
    
    func update(context: SceneUpdateContext) {
        /*
         self -> x20
         context -> x0 -> x22
         */
        // <+288>
        let entities = context.entities(
            matching: ImplicitAnimationSystem.query,
            updatingSystemWhen: .rendering
        )
        
        var iterator = entities.makeIterator()
        while let entity = iterator.next() {
            entity.components[ImplicitAnimationComponent.self]?.update(context: context)
        }
        
        // <+588>
        for closure in unsafe perFrameCompletionClosures {
            closure()
        }
        
        // <+728>
        unsafe perFrameCompletionClosures.removeAll(keepingCapacity: true)
    }
}

fileprivate nonisolated(unsafe) var perFrameCompletionClosures: [@MainActor () -> Void] = []
