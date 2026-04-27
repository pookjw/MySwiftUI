extension VectorArithmetic {
    static var unitScale: Double {
        return 128
    }
    
    static var inverseUnitScale: Double {
        return 1.0 / .unitScale
    }
    
    mutating func applyUnitScale() {
        scale(by: Self.unitScale)
    }
    
    mutating func unapplyUnitScale() {
        scale(by: Self.inverseUnitScale)
    }
    
    func scaled(by scale: Double) -> Self {
        assertUnimplemented()
    }
}
