#warning("TODO")
internal import AttributeGraph

public struct _GraphInputs {
    /*
     customInputs (0x0)
     time (0x8)
     cachedEnvironment (0x10)
     phase (0x18)
     transaction (0x1c)
     changedDebugProperties (0x20)
     options (0x24)
     mergedInputs (0x28)
     */
    var customInputs: PropertyList = PropertyList()
    var time: Attribute<Time>
    var cachedEnvironment: MutableBox<CachedEnvironment>
    var phase: Attribute<_GraphInputs.Phase>
    var transaction: Attribute<Transaction>
    var changedDebugProperties: _ViewDebug.Properties
    var options: _GraphInputs.Options
    var mergedInputs: Set<AnyAttribute>
    
    init(time: Attribute<Time>, phase: Attribute<_GraphInputs.Phase>, environment: Attribute<EnvironmentValues>, transaction: Attribute<Transaction>) {
        self.changedDebugProperties = _ViewDebug.Properties(rawValue: .max)
        self.options = _GraphInputs.Options(rawValue: 0)
        self.time = time
        self.phase = phase
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
