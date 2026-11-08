private import AttributeGraph

struct Tracing {
    @safe fileprivate nonisolated(unsafe) static let moduleLookupCache = ThreadSpecific<[UnsafeRawPointer : String]>([:])

    static func libraryName(defining type: Any.Type) -> String {
        assertUnimplemented()
    }
    
    static func nominalTypeName(_ type: Any.Type) -> String {
        assertUnimplemented()
    }
}

@inline(always)
func traceRuleBody<T>(_ type: Any.Type, body: () -> T) -> T {
    defer {
        // $s7SwiftUI13traceRuleBody_4bodyxypXp_xyXEtlF6$deferL_yylF
        let attribute = AnyAttribute.current!
        Signpost.bodyInvoke.traceEvent(type: .end, object: nil, "-> [%d] (%p)", args: [attribute.rawValue, 1, attribute.graph.counter(options: .unknown2)])
    }
    
    Signpost.bodyInvoke.traceEvent(type: .begin, object: nil, "%{public}@.body [in %{public}@]", args: [TypeID(type).description, Tracing.libraryName(defining: type)])
    
    return body()
}
