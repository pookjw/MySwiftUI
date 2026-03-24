package struct HashableWeakBox<T: AnyObject>: Hashable {
    package weak var base: T?
    private let basePointer: UnsafeMutableRawPointer
    
    package init(_ base: T) {
        self.base = base
        unsafe self.basePointer = unsafe Unmanaged.passUnretained(base).toOpaque()
    }
    
    package func hash(into hasher: inout Hasher) {
        unsafe hasher.combine(basePointer)
    }
    
    package static func == (lhs: Self, rhs: Self) -> Bool {
        return unsafe lhs.basePointer == rhs.basePointer
    }
}
