@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public enum BlendWeight : Equatable {
    case value(_: Float)
    case parameter(_: String, defaultWeight: Float = 1.0)
    case bindTarget(_: BindTarget, defaultWeight: Float = 1.0)
    
    public static func == (lhs: BlendWeight, rhs: BlendWeight) -> Bool {
        assertUnimplemented()
    }
}
