private import _QuartzCorePrivate

enum GraphicsBlendMode {
    case blendMode(GraphicsContext.BlendMode)
    case caFilter(AnyObject)
    
    nonisolated(unsafe) static let plusLIgnoreAlpha = GraphicsBlendMode.caFilter(CAFilter(type: kCAFilterPlusLIgnoreAlpha))
    nonisolated(unsafe) static let subtractSIgnoreAlpha = GraphicsBlendMode.caFilter(CAFilter(type: kCAFilterSubtractSIgnoreAlpha))
    nonisolated(unsafe) static let destOutPassthrough = GraphicsBlendMode.caFilter(CAFilter(type: kCAFilterDestOutPassthrough))
    nonisolated(unsafe) static let plusDIgnoreAlpha = GraphicsBlendMode.caFilter(CAFilter(type: kCAFilterPlusDIgnoreAlpha))
    
    static func plusLIgnoreAlphaSourceOver(_ amount: Double) -> GraphicsBlendMode {
        let filter = CAFilter(type: "plusLIgnoreAlphaSourceOverBlend")
        filter.setValue(amount, forKey: kCAFilterInputAmount)
        return .caFilter(filter)
    }
    
    nonisolated(unsafe) static let normal = GraphicsBlendMode.blendMode(.normal)
}
