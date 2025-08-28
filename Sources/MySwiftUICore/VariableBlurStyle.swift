#warning("TODO")
private import CoreGraphics

struct VariableBlurStyle {
    private var radius: CGFloat
    private var isOpaque: Bool
    private var dither: Bool
    private var mask: VariableBlurStyle.Mask
}

extension VariableBlurStyle {
    enum Mask {
        case image(GraphicsImage)
        case layerIndex(UInt)
        case none
    }
}
