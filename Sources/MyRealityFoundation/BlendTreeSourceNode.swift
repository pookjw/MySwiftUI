@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public struct BlendTreeSourceNode : BlendTreeNode {
    public init(source: any AnimationDefinition, name: String = "", weight: BlendWeight = .value(1.0)) {
        assertUnimplemented()
    }
    
    public var source: (any AnimationDefinition)?
    
    public var name: String
    
    public var weight: BlendWeight
}
