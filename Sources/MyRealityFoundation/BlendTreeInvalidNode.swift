@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public struct BlendTreeInvalidNode : BlendTreeNode {
    public var name: String
    
    public var weight: BlendWeight
}
