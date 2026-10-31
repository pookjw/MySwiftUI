extension AnimationContext {
    var finishingDefinition: (any AnimationFinishingDefinition<Value>.Type)? {
        get {
            if let key = self.state[AnimationFinishingDefinitionKey<Value>.self] {
                return key.definition
            } else {
                return nil
            }
        }
        set {
            if let newValue {
                self.state[AnimationFinishingDefinitionKey<Value>.self] = AnimationFinishingDefinitionKey<Value>(definition: newValue)
            } else {
                self.state[AnimationFinishingDefinitionKey<Value>.self] = nil
            }
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
    let definition: any AnimationFinishingDefinition<Value>.Type
    
    static var defaultValue: AnimationFinishingDefinitionKey<Value>? {
        return nil
    }
}
