struct Indirect<T> {
    private var box: MutableBox<T>
    
    init(_ value: T) {
        self.box = MutableBox(value)
    }
    
    init(wrappedValue: T) {
        self.box = MutableBox(wrappedValue)
    }
    
    var value: T {
        get {
            return self.box.value
        }
        set {
            if !isKnownUniquelyReferenced(&self.box) {
                self.box = MutableBox(self.box.value)
            }
            
            self.box.value = newValue
        }
    }
    
    var wrappedValue: T {
        get {
            return self.value
        }
        set {
            self.value = newValue
        }
    }
}

extension Indirect: Equatable where T: Equatable {
    static func == (lhs: Indirect, rhs: Indirect) -> Bool {
        return lhs.value == rhs.value
    }
}
