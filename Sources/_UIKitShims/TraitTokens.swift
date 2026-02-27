#if !SwiftUICompataibility
#error("TODO")
internal import MySwiftUICore
internal import _UIKitPrivate

enum TraitTokens {
    @safe private static nonisolated(unsafe) let tokens = AtomicBox<[ObjectIdentifier: (any _UITraitTokenProtocol)]>(wrappedValue: [:])
    
    static func tokens(traits: [UITrait]) -> [any _UITraitTokenProtocol] {
        var tokens: [any _UITraitTokenProtocol] = []
        
        for trait in traits {
            tokens.append(token(trait: trait))
        }
        
        return tokens
    }
    
    static func token(trait: UITrait) -> any _UITraitTokenProtocol {
        return tokens.access { tokens in
            if let existing = tokens[ObjectIdentifier(trait)] {
                if UITraitCollection._isPlaceholderTraitToken(existing) {
                    fatalError("TODO")
                } else {
                    return existing
                }
            } else {
                fatalError("TODO")
            }
        }
    }
}
#endif
