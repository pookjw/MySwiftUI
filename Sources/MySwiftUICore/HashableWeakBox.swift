package struct HashableWeakBox<T: AnyObject>: Hashable {
    weak var base: T?
    private let basePointer: UnsafeMutableRawPointer
    
    package init(_ base: T) {
        self.base = base
        self.basePointer = Unmanaged.passUnretained(base).toOpaque()
    }
    
    package func hash(into hasher: inout Hasher) {
        hasher.combine(basePointer)
    }
    
    package static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.basePointer == rhs.basePointer
    }
}
