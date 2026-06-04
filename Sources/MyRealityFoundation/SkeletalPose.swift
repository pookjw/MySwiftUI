@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
public struct SkeletalPose : Identifiable {
    public typealias ID = String
    
    public var id: SkeletalPose.ID
    
    public var jointNames: [String] {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var jointTransforms: JointTransforms
    
    public subscript(joint: String) -> Transform? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public init(id: SkeletalPose.ID, from skeleton: MeshResource.Skeleton) {
        assertUnimplemented()
    }
    
    public init(id: SkeletalPose.ID, joints: [(String, JointTransforms.Element)]) {
        assertUnimplemented()
    }
}
