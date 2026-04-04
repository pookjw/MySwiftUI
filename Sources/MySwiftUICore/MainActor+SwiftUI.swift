extension MainActor {
    package static func assumeIsolatedIfLinkedOnOrAfter<Result: Sendable>(_: Semantics, context: String?, _: @MainActor () throws -> Result, file: StaticString = #file, line: UInt = #line) rethrows -> Result {
        assertUnimplemented()
    }
}
