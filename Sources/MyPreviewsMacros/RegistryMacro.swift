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
            throw UnreachableError(
                node: node._syntaxNode,
                problem: "Unable to determine macro source location"
            )
        }
        
        // 0x41d08
        // 0x41ffc
        // 0xf20
        // 0x114c
        var array: [Any] = []
        
        if let attributes = node.attributes {
            // 0x119c
            for attribute in attributes {
                // 0x136c
                // 0x14d8
                switch attribute {
                case .attribute(let syntax):
                    // 0x1660
                    if let availabilitySpec = syntax.availabilitySpec {
                        // 0x1888
                        switch availabilitySpec.parse() {
                        case .success(let availability):
                            // 0x1a30
                            assertUnimplemented()
                        case .failure(let error):
                            // 0x18c4
                            assertUnimplemented()
                        }
                    } else {
                        // 0x16b4
                        assertUnimplemented()
                    }
                case .ifConfigDecl(let syntax):
                    // 0x17b0
                    assertUnimplemented()
                @unknown default:
                    // 0x19b4
                    assertUnimplemented()
                }
                
                // 0x13d4
                assertUnimplemented()
            }
        } else {
            // 0x116c
            array = []
        }
        
        // 0x42038
        assertUnimplemented()
        // 0x41d3c
        assertUnimplemented()
    }
}
