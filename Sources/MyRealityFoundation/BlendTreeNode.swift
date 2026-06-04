@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public protocol BlendTreeNode {
    var name: String { get set }
    var weight: BlendWeight { get set }
}
