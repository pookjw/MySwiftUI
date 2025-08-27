#warning("TODO")

public struct Material: Sendable {
    private var id: Material.ID
    private var flags: Material.ResolvedMaterial.Flags
}

extension Material {
    public static let regular: Material
    public static let thick: Material
    public static let thin: Material
    public static let ultraThin: Material
    public static let ultraThick: Material
    public static let bar: Material
}

extension Material: ShapeStyle {
    public typealias Resolved = Never
}

extension Material {
//    public func materialActiveAppearance(_ appearance: MaterialActiveAppearance) -> Material
}

extension ShapeStyle where Self == Material {
    @_alwaysEmitIntoClient public static var regularMaterial: Material {
        return .regular
    }
    
    @_alwaysEmitIntoClient public static var thickMaterial: Material {
        return .thick
    }
    
    @_alwaysEmitIntoClient public static var thinMaterial: Material {
        return .thin
    }
    
    @_alwaysEmitIntoClient public static var ultraThinMaterial: Material {
        return .ultraThin
    }
    
    @_alwaysEmitIntoClient public static var ultraThickMaterial: Material {
        return .ultraThick
    }
    
    @_alwaysEmitIntoClient public static var bar: Material {
        return .bar
    }
}
