protocol RealityKitAdditiveArithmetic {
    func rekitMinus(_ other: Self) -> Self
    func rekitPlus(_ other: Self) -> Self
}

protocol RealityKitVectorArithmetic {
    mutating func scale(by scale: Double)
    var magnitudeSquared: Double { get }
}
