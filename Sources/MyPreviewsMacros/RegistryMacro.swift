internal import SwiftSyntax
internal import SwiftSyntaxMacros

protocol RegistryMacro : DeclarationMacro {
    static func initializerExpression<T : FreestandingMacroExpansionSyntax, U : MacroExpansionContext>(
        for node: T,
        in context: U
    ) -> ExpansionResult<FunctionCallExprSyntax>

    static var registryAvailability: AvailabilitySet { get }
    static var unavailableError: ExprSyntax { get }

    static func registryDeclaration<T : FreestandingMacroExpansionSyntax, U : MacroExpansionContext>(
        for body: CodeBlockItemListSyntax,
        and node: T,
        at location: AbstractSourceLocation,
        in context: U,
        with availability: AvailabilitySet
    ) -> DeclSyntax

    static var numberOfGenericParameters: Int { get }
}

extension RegistryMacro {
    public static var propagateFreestandingMacroAttributes: Bool {
        assertUnimplemented()
    }

    public static var propagateFreestandingMacroModifiers: Bool {
        assertUnimplemented()
    }

    public static func expansion<T : FreestandingMacroExpansionSyntax, U : MacroExpansionContext>(
        of node: T,
        in context: U
    ) throws -> [DeclSyntax] {
        guard let location = context.location(
            of: node.pound,
            at: .afterLeadingTrivia,
            filePathMode: .fileID
        ) else {
            assertUnimplemented()
        }
        
        assertUnimplemented()
    }
}
