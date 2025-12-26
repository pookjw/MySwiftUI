enum Stack<Element>: Sequence, IteratorProtocol {
    case empty
    indirect case node(value: Element, next: Stack<Element>)
    
    init() {
        self = .empty
    }
    
    var isEmpty: Bool {
        switch self {
        case .empty:
            return true
        case .node(_, _):
            return false
        }
    }
    
    var top: Element? {
        switch self {
        case .empty:
            return nil
        case .node(let value, _):
            return value
        }
    }
    
    var count: Int {
        var copy = self
        var result = 0
        while let _ = copy.pop() {
            result &+= 1
        }
        return result
    }
    
    mutating func next() -> Element? {
        return pop()
    }
    
    mutating func push(_ element: Element) {
        self = .node(value: element, next: self)
    }
    
    @discardableResult mutating func pop() -> Element? {
        switch self {
        case .empty:
            return nil
        case .node(let value, let next):
            self = next
            return value
        }
    }
    
    mutating func popAll() {
        self = .empty
    }
    
    func map<T>(_ transform: (Element) -> T) -> Stack<T> {
        let count = count
        
        return unsafe withUnsafeTemporaryAllocation(of: T.self, capacity: count) { pointer in
            var iterator = makeIterator()
            
            var index = 1
            while let element = iterator.next() {
                unsafe pointer.initializeElement(at: count - index, to: transform(element))
                index &+= 1
            }
            
            var result = Stack<T>()
            for i in pointer.indices {
                unsafe result.push(pointer[i])
            }
            
            return result
        }
    }
}

extension Stack: Sendable where Element: Sendable {}
