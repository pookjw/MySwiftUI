#warning("TOCO")

package protocol Location {
    associatedtype Value
}

@_documentation(visibility: private)
open class AnyLocationBase: @unchecked Sendable {}

@_documentation(visibility: private)
open class AnyLocation<Value>: AnyLocationBase, @unchecked Sendable {
    
}

extension AnyLocation: Equatable {
    public static func == (lhs: AnyLocation<Value>, rhs: AnyLocation<Value>) -> Bool {
        fatalError("TODO")
    }
}
