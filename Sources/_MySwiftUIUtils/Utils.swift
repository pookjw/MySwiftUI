@_transparent
@usableFromInline
package func assertUnimplemented(message: String? = nil, file: StaticString = #file, line: UInt = #line) -> Never {
    if let message {
        fatalError("TODO - \(message)", file: file, line: line)
    } else {
        fatalError("TODO ", file: file, line: line)
    }
}

@_transparent
package func _v_assertUnimplemented(message: String? = nil, file: StaticString = #file, line: UInt = #line) {
    assertUnimplemented(message: message, file: file, line: line)
}

@inlinable
package func _assertUnimplemented(message: String? = nil) -> Never {
    assertUnimplemented()
}
