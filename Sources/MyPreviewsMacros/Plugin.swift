public import SwiftCompilerPlugin
public import SwiftSyntaxMacros

@main
struct MyPreviewsPlugin : CompilerPlugin {
    let providingMacros: [any Macro.Type] = [
        SwiftUIView.self
    ]
}
