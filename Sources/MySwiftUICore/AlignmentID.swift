#warning("TODO")
public import CoreGraphics

public protocol AlignmentID {
    static func defaultValue(in context: ViewDimensions) -> CGFloat
    static func _combineExplicit(childValue: CGFloat, _ n: Int, into parentValue: inout CGFloat?)
}

extension AlignmentID {
    public static func _combineExplicit(childValue: CGFloat, _ n: Int, into parentValue: inout CGFloat?) {
        fatalError("TODO")
    }
}
