
public struct BackdropEffect {
    private var scale: Float
    private var color: Color.ResolvedHDR
    private var filters: [GraphicsFilter]
    private var captureOnly: Bool
}

enum BackdropGroupID {
    case index(DisplayList.Index.ID)
    case name(String)
}
