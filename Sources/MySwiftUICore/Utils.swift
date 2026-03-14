@_transparent
public func assertUnimplemented(message: String? = nil) -> Never {
    if let message {
        fatalError("TODO - \(message)")
    } else {
        fatalError("TODO")
    }
}
