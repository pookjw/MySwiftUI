internal import _QuartzCorePrivate

package enum GraphicsBlendMode {
    case blendMode(GraphicsContext.BlendMode)
    case caFilter(AnyObject)
    
    @safe nonisolated(unsafe) static let plusLIgnoreAlpha = GraphicsBlendMode.caFilter(CAFilter(type: kCAFilterPlusLIgnoreAlpha))
    @safe nonisolated(unsafe) static let subtractSIgnoreAlpha = GraphicsBlendMode.caFilter(CAFilter(type: kCAFilterSubtractSIgnoreAlpha))
    @safe nonisolated(unsafe) static let destOutPassthrough = GraphicsBlendMode.caFilter(CAFilter(type: kCAFilterDestOutPassthrough))
    @safe nonisolated(unsafe) static let plusDIgnoreAlpha = GraphicsBlendMode.caFilter(CAFilter(type: kCAFilterPlusDIgnoreAlpha))
    
    static func plusLIgnoreAlphaSourceOver(_ amount: Double) -> GraphicsBlendMode {
        let filter = CAFilter(type: "plusLIgnoreAlphaSourceOverBlend")
        filter.setValue(amount as NSNumber, forKey: kCAFilterInputAmount)
        return .caFilter(filter)
    }
    
    @safe static nonisolated(unsafe) let normal = GraphicsBlendMode.blendMode(.normal)
}

extension GraphicsBlendMode : RendererEffect {
    var animatableData: UInt8 { // TODO
        assertUnimplemented()
    }
    
    nonisolated func effectValue(size: CGSize) -> DisplayList.Effect {
        assertUnimplemented()
    }
    
    nonisolated static var isolatesChildPosition: Bool {
        assertUnimplemented()
    }
    
    nonisolated static var disabledForFlattenedContent: Bool {
        assertUnimplemented()
    }
    
    nonisolated static var preservesEmptyContent: Bool {
        assertUnimplemented()
    }
    
    nonisolated static var isScrapeable: Bool {
        assertUnimplemented()
    }
}

extension GraphicsBlendMode : Equatable {
    package static func == (lhs: GraphicsBlendMode, rhs: GraphicsBlendMode) -> Bool {
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
