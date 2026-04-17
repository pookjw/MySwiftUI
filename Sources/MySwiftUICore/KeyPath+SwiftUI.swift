extension KeyPath {
    func makeGetFunction() -> (UnsafePointer<Root>) -> Value {
        if let offset = MemoryLayout<Root>.offset(of: self) {
            return { pointer in
                return UnsafeRawPointer(pointer)
                    .advanced(by: offset)
                    .assumingMemoryBound(to: Value.self)
                    .pointee
            }
        } else {
            return { pointer in
                return pointer.pointee[keyPath: self]
            }
        }
    }
}
