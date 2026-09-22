struct PopoverEdgeAppearance : Hashable {
    private var kind: PopoverEdgeAppearance.Kind
    
    static var automatic: PopoverEdgeAppearance {
        return PopoverEdgeAppearance(kind: .automatic)
    }
    
    static var arrow: PopoverEdgeAppearance {
        return PopoverEdgeAppearance(kind: .arrow)
    }
}

extension PopoverEdgeAppearance {
    enum Kind : Hashable {
        case automatic
        case arrow
    }
}
