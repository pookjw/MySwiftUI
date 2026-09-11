internal import SwiftSyntax

struct UnreachableError : Error {
    let node: Syntax
    let problem: String
}
