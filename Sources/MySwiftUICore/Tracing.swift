#warning("TODO")
private import AttributeGraph

struct Tracing {
    static func libraryName(defining type: Any.Type) -> String {
        fatalError("TODO")
    }
    
    static func nominalTypeName(_ type: Any.Type) -> String {
        fatalError("TODO")
    }
}

func traceRuleBody<T>(_ type: Any.Type, body: () -> T) -> T {
    defer {
        // $s7SwiftUI13traceRuleBody_4bodyxypXp_xyXEtlF6$deferL_yylF
        let attribute = AnyAttribute.current!
        Signpost.bodyInvoke.traceEvent(type: .end, object: nil, "-> [%d] (%p)", args: [attribute.rawValue, attribute.graph.counter(options: .unknown2)])
    }
    
    Signpost.bodyInvoke.traceEvent(type: .begin, object: nil, "%{public}@.body [in %{public}@]", args: [TypeID(type).description, Tracing.libraryName(defining: type)])
    
    return Graph.withoutUpdate {
        return body()
    }
}
