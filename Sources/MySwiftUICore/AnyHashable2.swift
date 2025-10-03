struct AnyHashable2: Hashable, CustomStringConvertible, CustomDebugStringConvertible, _HasCustomAnyHashableRepresentation {
    private var box: AnyHashableBox
    
    init<T: Hashable>(_ value: T) {
        self.box = _AnyHashableBox(value)
    }
    
    static func == (lhs: AnyHashable2, rhs: AnyHashable2) -> Bool {
        return lhs.box.isEqual(to: rhs.box)
    }
    
    func `as`<T: Hashable>(type: T.Type) -> T?  {
        return box.as(type: type)
    }
    
    var anyValue: any Hashable {
        return box.anyValue
    }
    
    var anyHashable: AnyHashable {
        return AnyHashable2(box.anyValue)
    }
    
    func hash(into hasher: inout Hasher) {
        box.hash(into: &hasher)
    }
    
    var description: String {
        return box.description
    }
    
    var debugDescription: String {
        return box.debugDescription
    }
    
    func _toCustomAnyHashable() -> AnyHashable? {
        return anyHashable
    }
}

fileprivate class AnyHashableBox: CustomStringConvertible, CustomDebugStringConvertible {
    func `as`<T: Hashable>(type: T.Type) -> T?  {
        return nil
    }
    
    var description: String {
        return ""
    }
    
    var debugDescription: String {
        return ""
    }
    
    var anyValue: any Hashable {
        fatalError() // abstract
    }
    
    func isEqual(to other: AnyHashableBox) -> Bool {
        return false
    }
    
    func hash(into hasher: inout Hasher) {
        // nop
    }
}

fileprivate final class _AnyHashableBox<T: Hashable>: AnyHashableBox {
    let value: T
    
    init(_ value: T) {
        self.value = value
    }
    
    override func `as`<U: Hashable>(type: U.Type) -> U?  {
        return value as? U
    }
    
    override var description: String {
        fatalError("TODO")
    }
    
    override var debugDescription: String {
        return self.description
    }
    
    override func isEqual(to other: AnyHashableBox) -> Bool {
        guard let casted = other as? Self else {
            return false
        }
        
        return self.value == casted.value
    }
    
    override func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(T.self))
        hasher.combine(value)
    }
    
    override var anyValue: any Hashable {
        return value
    }
}
