internal import SwiftSyntax

package struct SwiftUIView : SwiftUIViewMacro {
    static var bodyClosureOffset: Int {
        assertUnimplemented()
    }
    
    static func bodyComplexity<T>(for node: T, with body: SwiftSyntax.ClosureExprSyntax) -> SwiftUIBodyComplexity where T : SwiftSyntax.FreestandingMacroExpansionSyntax {
        assertUnimplemented()
    }
    
    static var numberOfGenericParameters: Int {
        assertUnimplemented()
    }
}
