public func precondition(_ condition: @autoclosure () -> Bool, _ message: @autoclosure () -> String, file: StaticString = #file, line: UInt = #line) {
    guard !condition() else {
        return
    }
    
    assertionFailure(message(), file: file, line: line)
}
