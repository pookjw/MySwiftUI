private import os.log
private import _DarwinFoundation3.pthread

extension MainActor {
    package static func assumeIsolatedIfLinkedOnOrAfter<T: Sendable>(
        _ semantics: Semantics,
        context: String?,
        _ operation: @MainActor () throws -> T,
        file: StaticString = #file,
        line: UInt = #line
    ) rethrows -> T {
        if isLinkedOnOrAfter(semantics) {
            return try MainActor.assumeIsolated(operation, file: file, line: line)
        } else {
            if pthread_main_np() == 0 {
                unsafe os_log(.fault, log: .runtimeIssuesLog, "\(context ?? "") This warning will become a runtime crash in a future version of SwiftUI.")
            }
            
            typealias YesActor = @MainActor () throws -> T
            typealias NoActor = () throws -> T
            
            return try withoutActuallyEscaping(operation) { (_ fn: @escaping YesActor) throws -> T in
                let rawFn = unsafe unsafeBitCast(fn, to: NoActor.self)
                return try rawFn()
            }
        }
    }
}
