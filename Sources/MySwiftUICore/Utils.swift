@_transparent
package func assertUnimplemented(message: String? = nil, file: StaticString = #file, line: UInt = #line) -> Never {
    if let message {
        fatalError("TODO - \(message)", file: file, line: line)
    } else {
        fatalError("TODO ", file: file, line: line)
    }
}

public func _assertUnimplemented(message: String? = nil) -> Never {
    assertUnimplemented()
}
