public import SwiftSyntax
public import SwiftSyntaxMacros

public struct SwiftUIView : SwiftUIViewMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        return [] // TODO
    }
}
