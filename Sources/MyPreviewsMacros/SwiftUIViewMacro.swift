internal import SwiftSyntax
internal import SwiftSyntaxMacros

protocol SwiftUIViewMacro : PreviewMacro {
    static var bodyClosureOffset: Int { get }

    static func bodyComplexity<T : FreestandingMacroExpansionSyntax>(
        for node: T,
        with body: ClosureExprSyntax
    ) -> SwiftUIBodyComplexity
}

extension SwiftUIViewMacro {
    static func initializerExpression<T : FreestandingMacroExpansionSyntax, U : MacroExpansionContext>(
        for node: T,
        in context: U
    ) -> ExpansionResult<FunctionCallExprSyntax> {
        assertUnimplemented()
    }
}

enum SwiftUIBodyComplexity {
    case hasKnownParameterTypeCompiler(TypeSyntax)
    case none
    case requiresViewBuilderRemoval
    case hasUnknownParameterType
}
