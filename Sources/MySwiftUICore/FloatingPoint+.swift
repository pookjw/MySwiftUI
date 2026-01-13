extension FloatingPoint {
    func mappingNaN(to other: Self) -> Self {
        return isNaN ? other : self
    }
}
