internal import _QuartzCorePrivate

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
    
    @safe static nonisolated(unsafe) let normal = GraphicsBlendMode.blendMode(.normal)
}

extension GraphicsBlendMode : RendererEffect {
    nonisolated func effectValue(size: CGSize) -> DisplayList.Effect {
        assertUnimplemented()
    }
}

extension GraphicsBlendMode : Equatable {
    static func == (lhs: GraphicsBlendMode, rhs: GraphicsBlendMode) -> Bool {
        switch (lhs, rhs) {
        case (.blendMode(let lhs), .blendMode(let rhs)):
            return lhs == rhs
        case (.caFilter(let lhs), .caFilter(let rhs)):
            return lhs === rhs
        default:
            return false
        }
    }
}

extension GraphicsBlendMode : ProtobufEncodableMessage {
    // TODO
}

extension GraphicsBlendMode : ProtobufDecodableMessage {
    // TODO
}
