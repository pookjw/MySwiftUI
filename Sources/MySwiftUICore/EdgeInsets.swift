#warning("TODO")
private import CoreGraphics

public struct EdgeInsets {
    private var top: CGFloat
    private var leading: CGFloat
    private var bottom: CGFloat
    private var trailing: CGFloat
    
    public static var zero: EdgeInsets {
        return EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
    }
}
