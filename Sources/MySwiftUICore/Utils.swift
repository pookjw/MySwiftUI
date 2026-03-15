@_transparent
package func assertUnimplemented(message: String? = nil) -> Never {
    if let message {
        fatalError("TODO - \(message)")
    } else {
        fatalError("TODO")
    }
}

public func _assertUnimplemented(message: String? = nil) -> Never {
    assertUnimplemented()
}
