private import _QuartzCorePrivate

enum GraphicsBlendMode {
    case blendMode(GraphicsContext.BlendMode)
    case caFilter(AnyObject)
    
    static nonisolated(unsafe) let plusLIgnoreAlpha = GraphicsBlendMode.caFilter(CAFilter(type: kCAFilterPlusLIgnoreAlpha))
    static nonisolated(unsafe) let subtractSIgnoreAlpha = GraphicsBlendMode.caFilter(CAFilter(type: kCAFilterSubtractSIgnoreAlpha))
    static nonisolated(unsafe) let destOutPassthrough = GraphicsBlendMode.caFilter(CAFilter(type: kCAFilterDestOutPassthrough))
    static nonisolated(unsafe) let plusDIgnoreAlpha = GraphicsBlendMode.caFilter(CAFilter(type: kCAFilterPlusDIgnoreAlpha))
    
    static func plusLIgnoreAlphaSourceOver(_ amount: Double) -> GraphicsBlendMode {
        let filter = CAFilter(type: "plusLIgnoreAlphaSourceOverBlend")
        filter.setValue(amount, forKey: kCAFilterInputAmount)
        return .caFilter(filter)
    }
    
    static nonisolated(unsafe) let normal = GraphicsBlendMode.blendMode(.normal)
}
