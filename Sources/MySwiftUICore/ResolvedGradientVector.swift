// 3CA72A515D037D62EA3FD1FE1FD1F3CB

struct ResolvedGradientVector : VectorArithmetic {
    static func == (lhs: borrowing ResolvedGradientVector, rhs: borrowing ResolvedGradientVector) -> Bool {
        assertUnimplemented()
    }
    
    static func + (lhs: ResolvedGradientVector, rhs: ResolvedGradientVector) -> ResolvedGradientVector {
        assertUnimplemented()
    }
    
    static func - (lhs: ResolvedGradientVector, rhs: ResolvedGradientVector) -> ResolvedGradientVector {
        assertUnimplemented()
    }
    
    static var zero: ResolvedGradientVector {
        assertUnimplemented()
    }
    
    private var stops: [ResolvedGradientVector.Stop]
    private var colorSpace: ResolvedGradient.ColorSpace
    private var headroom: Float?
    
    var magnitudeSquared: Double {
        assertUnimplemented()
    }
    
    mutating func scale(by rhs: Double) {
        assertUnimplemented()
    }
}

extension ResolvedGradientVector {
    fileprivate struct Stop {
        // TODO
    }
}
