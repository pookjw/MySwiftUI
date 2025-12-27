// 9FF97745734808976F608CE0DC13C39C
internal import AttributeGraph

public struct _GraphInputs {
    package internal(set) var customInputs = PropertyList()
    var time: Attribute<Time>
    package var cachedEnvironment: MutableBox<CachedEnvironment>
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
    
    var environment: Attribute<EnvironmentValues> {
        get {
            return cachedEnvironment.value.environment
        }
        set {
            cachedEnvironment.value.environment = newValue
        }
        _modify {
            yield &cachedEnvironment.value.environment
        }
    }
    
    var animationsDisabled: Bool {
        get {
            return options.contains(.animationsDisabled)
        }
        set {
            if newValue {
                options.formUnion(.animationsDisabled)
            } else {
                options.remove(.animationsDisabled)
            }
        }
        _modify {
            fatalError("TODO")
        }
    }
    
    package subscript<T: GraphInput>(_ type: T.Type) -> T.Value {
        get {
            return customInputs[type]
        }
        set {
            customInputs[type] = newValue
        }
        _modify {
            yield &customInputs[type]
        }
    }
    
    subscript<T: GraphInput>(_ type: T.Type) -> T.Value where T.Value : GraphReusable {
        get {
            return customInputs[type]
        }
        set {
            recordReusableInput(T.self)
            customInputs[type] = newValue
        }
        _modify {
            fatalError("TODO")
        }
    }
    
    @inline(__always)
    mutating func copyCaches() {
        cachedEnvironment = MutableBox(cachedEnvironment.value)
    }
    
    mutating func append<Input: GraphInput, Value>(_ value: Value, to input: Input.Type) where Input.Value == Stack<Value> {
        customInputs[Input.self].push(value)
    }
    
    mutating func append<Input: GraphInput, Reusable: GraphReusable>(_ reusable: Reusable, to input: Input.Type) where Input.Value == Stack<Reusable> {
        recordReusableInput(input)
        customInputs[Input.self].push(reusable)
    }
    
    fileprivate mutating func recordReusableInput<Input: GraphInput>(_ input: Input.Type) where Input.Value: GraphReusable {
        guard GraphReuseOptions.current.contains(.expandedReuse) else {
            return
        }
        
        var inputs = customInputs[ReusableInputs.self]
        guard inputs.stack.top != Input.self else {
            return
        }
        
        customInputs[ReusableInputs.self] = ReusableInputStorage(
            filter: BloomFilter(type: input),
            stack: .node(value: input, next: inputs.stack)
        )
    }
}

extension _GraphInputs {
    package struct Phase: Equatable {
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
    struct Options: OptionSet {
        static var viewRequestsLayoutComputer: _GraphInputs.Options {
            return _GraphInputs.Options(rawValue: (1 << 1))
        }
        
        static var viewNeedsGeometry: _GraphInputs.Options {
            return _GraphInputs.Options(rawValue: (1 << 5))
        }
        
        static var viewDisplayListAccessibility: _GraphInputs.Options {
            return _GraphInputs.Options(rawValue: (1 << 4))
        }
        
        static var viewNeedsGeometryAccessibility: _GraphInputs.Options {
            return _GraphInputs.Options(rawValue: (1 << 6))
        }
        
        static var viewStackOrientationIsDefined: _GraphInputs.Options {
            return _GraphInputs.Options(rawValue: (1 << 2))
        }
        
        static var viewStackOrientationIsHorizontal: _GraphInputs.Options {
            return _GraphInputs.Options(rawValue: (1 << 3))
        }
        
        static var viewStackOrientationIsDepth: _GraphInputs.Options {
            return _GraphInputs.Options(rawValue: (1 << 9))
        }
        
        static var supportsVariableFrameDuration: _GraphInputs.Options {
            return _GraphInputs.Options(rawValue: (1 << 10))
        }
        
        static var needsStableDisplayListIDs: _GraphInputs.Options {
            return _GraphInputs.Options(rawValue: (1 << 8))
        }
        
        static var needsDynamicLayout: _GraphInputs.Options {
            return _GraphInputs.Options(rawValue: (1 << 11))
        }
        
        static var animationsDisabled: _GraphInputs.Options {
            return _GraphInputs.Options(rawValue: (1 << 0))
        }
        
        static var needsAccessibility: _GraphInputs.Options {
            return _GraphInputs.Options(rawValue: (1 << 12))
        }
        
        static var doNotScrape: _GraphInputs.Options {
            return _GraphInputs.Options(rawValue: (1 << 13))
        }
        
        let rawValue: UInt32
    }
}

extension _GraphInputs {
    var needsStableDisplayListIDs: Bool {
        return options.contains(.needsStableDisplayListIDs)
    }
}

extension _GraphInputs {
    func intern<T>(_ value: T, id: GraphHost.ConstantID) -> Attribute<T> {
        return GraphHost.currentHost.intern(value, id: id)
    }
}

@available(*, unavailable)
extension _GraphInputs: Sendable {}
