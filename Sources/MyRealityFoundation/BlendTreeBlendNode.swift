@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public struct BlendTreeBlendNode : BlendTreeNode {
    public init(sources: [any BlendTreeNode], name: String = "", weight: BlendWeight = .value(1.0), isAdditive: Bool = false) {
        assertUnimplemented()
    }
    
    public var sources: [any BlendTreeNode]
    
    public var isAdditive: Bool
    
    public var name: String
    
    public var weight: BlendWeight
}
