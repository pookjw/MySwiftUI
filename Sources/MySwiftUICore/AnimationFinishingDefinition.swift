extension AnimationContext {
    var finishingDefinition: (any AnimationFinishingDefinition<Value>.Type)? {
        get {
            return self.state[AnimationFinishingDefinitionKey<Value>.self].definition
        }
        set {
            self.state[AnimationFinishingDefinitionKey<Value>.self] = AnimationFinishingDefinitionKey<Value>(definition: newValue.map { $0 })
        }
        _modify {
            var value = self.finishingDefinition
            yield &value
            self.finishingDefinition = value
        }
    }
}

protocol AnimationFinishingDefinition<Value> : VectorArithmetic {
    associatedtype Value : VectorArithmetic
    static func shouldFinishEarly(in context: AnimationSettlingContext<Value>) -> Bool
}

fileprivate struct AnimationFinishingDefinitionKey<Value: VectorArithmetic> : AnimationStateKey {
    let definition: (any AnimationFinishingDefinition<Value>.Type)?
    
    static var defaultValue: AnimationFinishingDefinitionKey<Value> {
        return AnimationFinishingDefinitionKey<Value>(definition: nil)
    }
}
