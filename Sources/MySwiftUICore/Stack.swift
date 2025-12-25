enum Stack<Value> {
    case empty
    indirect case node(value: Value, next: Stack<Value>)
}
