package protocol PropertyKey {
    associatedtype Value
    static var defaultValue: Value { get }
    static func valuesEqual(_ lhs: Value, _ rhs: Value) -> Bool
}
