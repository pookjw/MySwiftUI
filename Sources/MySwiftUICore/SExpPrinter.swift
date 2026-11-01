struct SExpPrinter {
    private var output: String
    private var depth: Int
    private var indent: String
    
    init(tag: String, singleLine: Bool = false) {
        assertUnimplemented()
    }
    
    mutating func end() -> String {
        assertUnimplemented()
    }
    
    mutating func push(_ tag: String) {
        assertUnimplemented()
    }
    
    mutating func print(_ string: String, newline: Bool = true) {
        assertUnimplemented()
    }
    
    mutating func pop() {
        assertUnimplemented()
    }
    
    mutating func newline() {
        assertUnimplemented()
    }
}
