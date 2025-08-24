#warning("TODO")
internal import AttributeGraph

public struct _GraphInputs {
    var customInputs: PropertyList
    var time: Attribute<Time>
    var cachedEnvironment: MutableBox<CachedEnvironment>
    var phase: Attribute<_GraphInputs.Phase>
    var transaction: Attribute<Transaction>
    var changedDebugProperties: _ViewDebug.Properties
    var options: _GraphInputs.Options
    var mergedInputs: Set<AnyAttribute>
    
    init(time: Attribute<Time>, phase: Attribute<_GraphInputs.Phase>, environment: Attribute<EnvironmentValues>, transaction: Attribute<Transaction>) {
        fatalError("TODO")
    }
    
    subscript<T: GraphInput>(_ type: T.Type) -> T.Value {
        get {
            return customInputs[type]
        }
        set {
            fatalError("TODO")
        }
    }
    
    subscript<T: GraphInput>(_ type: T.Type) -> T.Value where T.Value : GraphReusable {
        get {
            return customInputs[type]
        }
        set {
            fatalError("TODO")
        }
    }
}

extension _GraphInputs {
    public struct Phase {
        
    }
}

extension _GraphInputs {
    public struct Options {
        let rawValue: UInt32
    }
}
