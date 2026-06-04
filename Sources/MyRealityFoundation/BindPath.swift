@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public struct BindPath {
    public enum Part : Equatable {
        case scene(_: String)
        case anchorEntity(_: String)
        case entity(_: String)
        case parameter(_: String)
        case transform
        case jointTransforms
        @available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
        case opacity
        @available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, *)
        case blendShapeWeights
        @available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, *)
        case blendShapeWeightsAtIndex(_: Int = 0)
        @available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, *)
        case blendShapeWeightsWithID(_: BlendShapeWeightsData.ID)
        @available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, *)
        case billboardBlendFactor
        @available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
        case ikSolver(_: IKComponent.Solver.ID?)
        @available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
        case ikConstraintTarget(_: IKComponent.Constraint.ID)
        @available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
        case ikConstraintLookAtTarget(_: IKComponent.Constraint.ID)
        @available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
        case material(_: Int)
        @available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
        case materialParameter(_: String)
        @available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, *)
        case skeletalPose(_: SkeletalPose.ID)
        
        public static func == (lhs: BindPath.Part, rhs: BindPath.Part) -> Bool {
            assertUnimplemented()
        }
    }
    
    public var parts: [BindPath.Part] {
        get {
            assertUnimplemented()
        }
    }
}
