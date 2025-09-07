package import AttributeGraph

package struct RepresentableContextValues {
    package static nonisolated(unsafe) var current: RepresentableContextValues?
    
    package var preferenceBridge: PreferenceBridge?
    package var transaction: Transaction
    package var environmentStorage: RepresentableContextValues.EnvironmentStorage
    
    package init(preferenceBridge: PreferenceBridge?, transaction: Transaction, environmentStorage: RepresentableContextValues.EnvironmentStorage) {
        self.preferenceBridge = preferenceBridge
        self.transaction = transaction
        self.environmentStorage = environmentStorage
    }
    
    package func asCurrent<T>(do block: () -> T) -> T {
        let oldCurrent = RepresentableContextValues.current
        RepresentableContextValues.current = self
        let result = block()
        RepresentableContextValues.current = oldCurrent
        return result
    }
    
    package var environment: EnvironmentValues {
        switch environmentStorage {
        case .eager(let environmentValues):
            return environmentValues
        case .lazy(let attribute, let context):
            Update.begin()
            let environmentValues = context.valueAndFlags(of: attribute, options: []).value
            Update.end()
            return environmentValues
        }
    }
}

extension RepresentableContextValues {
    package enum EnvironmentStorage {
        case eager(EnvironmentValues)
        case lazy(Attribute<EnvironmentValues>, AnyRuleContext)
    }
}
