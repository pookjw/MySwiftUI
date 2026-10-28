package enum RenderingTechnique : UInt8, Hashable, Codable {
    case texture
    case perspectiveCorrect
}

extension RenderingTechnique {
    static var defaultImageValue: RenderingTechnique {
        assertUnimplemented()
    }
    
    static var defaultTextValue: RenderingTechnique {
        assertUnimplemented()
    }
}
