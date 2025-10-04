#warning("TODO")
internal import AttributeGraph

public struct _GraphInputs {
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
        self.mergedInputs = []
        self.time = time
        self.phase = phase
        self.cachedEnvironment = MutableBox(CachedEnvironment(environment: environment))
        self.transaction = transaction
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
    struct Phase: Equatable {
        private var value: UInt32
        
        init(value: UInt32) {
            self.value = value
        }
        
        init() {
            self.value = 0
        }
        
        var resetSeed: UInt32 {
            get {
                return value &>> 1
            }
            set {
                value = (value & 1) | ((newValue & 0x7FFFFFFF) << 1)
            }
        }
        
        var isInserted: Bool {
            return (value & 1) == 0
        }
        
        var isBeingRemoved: Bool {
            get {
                return (value & 1) != 0
            }
            set {
                if newValue {
                    value |= 1
                } else {
                    value &= ~1
                }
            }
        }
        
        mutating func merge(_ other: _GraphInputs.Phase) {
            value = ((value & ~1) &+ other.value) | (value & 1)
        }
        
        static var invalid: _GraphInputs.Phase {
            return _GraphInputs.Phase(value: 0xFFFFFFF0)
        }
    }
}

extension _GraphInputs {
    public struct Options {
        let rawValue: UInt32
    }
}
