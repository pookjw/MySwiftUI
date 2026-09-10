internal import SwiftDiagnostics
internal import SwiftSyntax

enum ExpansionResult<T> {
    case succeeded(T, warnings: [any PreviewWarning])
    case failed(error: any PreviewError, additional: [PreviewDiagnostic])
}

protocol DiagnosticCreating : DiagnosticMessage {
    var identifier: String { get }
    var node: Syntax { get }

    func buildFixIts(with builder: inout FixItBuilder)
}

extension DiagnosticCreating {
    var diagnostic: Diagnostic {
        assertUnimplemented()
    }

    var diagnosticID: MessageID {
        assertUnimplemented()
    }

    func buildFixIts(with builder: inout FixItBuilder) {
        assertUnimplemented()
    }
}

protocol PreviewWarning : DiagnosticCreating {
}

extension PreviewWarning {
    var severity: DiagnosticSeverity {
        assertUnimplemented()
    }
}

protocol PreviewError : DiagnosticCreating, Error {
}

extension PreviewError {
    var severity: DiagnosticSeverity {
        assertUnimplemented()
    }
}

enum PreviewDiagnostic {
    case warning(any PreviewWarning)
    case error(any PreviewError)
}

struct FixItBuilder {
    private let messageIdentifier: String
    private var fixIts: [FixIt]
}
