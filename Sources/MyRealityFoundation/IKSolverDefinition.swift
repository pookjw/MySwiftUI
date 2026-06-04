@available(visionOS 2.0, iOS 18.0, macCatalyst 18.0, macOS 15.0, tvOS 26.0, *)
public struct IKSolverDefinition : Identifiable {
    public typealias ID = Int
    
    public let id: IKSolverDefinition.ID
    
    public var rigDefinition: IKRig
    
    public init(id: IKSolverDefinition.ID, rig: IKRig) {
        assertUnimplemented()
    }
}
