enum ContentStyle {}

extension ContentStyle {
    enum ID {
        case primary
        case secondary
        case tertiary
        case quaternary
        case quinary
    }
    
    enum Primitive {
        case fill
        case stroke
        case separator
        case overlay
        case destructive
    }
    
    struct Style {
        private var id: ContentStyle.ID
        private var primitive: ContentStyle.Primitive
    }
    
    struct MaterialStyle {
        private var material: Material.ResolvedMaterial
        private var base: ContentStyle.Style
    }
    
    // nominal type descriptor가 없음
    struct MaterialResolved {
        // TODO
    }
}
