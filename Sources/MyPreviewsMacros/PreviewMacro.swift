internal import SwiftSyntax
internal import SwiftSyntaxMacros

protocol PreviewMacro : RegistryMacro {
}

extension PreviewMacro {
    static var unavailableError: ExprSyntax {
        assertUnimplemented()
    }

    static var registryAvailability: AvailabilitySet {
        assertUnimplemented()
    }

    static func registryDeclaration<T : FreestandingMacroExpansionSyntax, U : MacroExpansionContext>(
        for body: CodeBlockItemListSyntax,
        and node: T,
        at location: AbstractSourceLocation,
        in context: U,
        with availability: AvailabilitySet
    ) -> DeclSyntax {
        assertUnimplemented()
    }
}
