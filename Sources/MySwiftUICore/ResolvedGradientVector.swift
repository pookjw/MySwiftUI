// 3CA72A515D037D62EA3FD1FE1FD1F3CB

package struct ResolvedGradientVector : VectorArithmetic {
    package static func == (lhs: borrowing ResolvedGradientVector, rhs: borrowing ResolvedGradientVector) -> Bool {
        assertUnimplemented()
    }
    
    package static func + (lhs: ResolvedGradientVector, rhs: ResolvedGradientVector) -> ResolvedGradientVector {
        assertUnimplemented()
    }
    
    package static func - (lhs: ResolvedGradientVector, rhs: ResolvedGradientVector) -> ResolvedGradientVector {
        assertUnimplemented()
    }
    
    package static var zero: ResolvedGradientVector {
        assertUnimplemented()
    }
    
    private var stops: [ResolvedGradientVector.Stop]
    private var colorSpace: ResolvedGradient.ColorSpace
    private var headroom: Float?
    
    package var magnitudeSquared: Double {
        assertUnimplemented()
    }
    
    package mutating func scale(by rhs: Double) {
        assertUnimplemented()
    }
}

extension ResolvedGradientVector {
    fileprivate struct Stop {
        // TODO
    }
}
