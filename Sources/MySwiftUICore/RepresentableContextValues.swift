internal import AttributeGraph

struct RepresentableContextValues {
    static nonisolated(unsafe) var current: RepresentableContextValues?
    
    var preferenceBridge: PreferenceBridge?
    var transaction: Transaction
    var environmentStorage: RepresentableContextValues.EnvironmentStorage
    
    init(preferenceBridge: PreferenceBridge?, transaction: Transaction, environmentStorage: RepresentableContextValues.EnvironmentStorage) {
        self.preferenceBridge = preferenceBridge
        self.transaction = transaction
        self.environmentStorage = environmentStorage
    }
    
    func asCurrent<T>(do block: () -> T) -> T {
        let oldCurrent = RepresentableContextValues.current
        RepresentableContextValues.current = self
        let result = block()
        RepresentableContextValues.current = oldCurrent
        return result
    }
}

extension RepresentableContextValues {
    enum EnvironmentStorage {
        case eager(EnvironmentValues)
        case lazy(Attribute<EnvironmentValues>, AnyRuleContext)
    }
}
