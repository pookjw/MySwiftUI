// 4C0F72CE0B727EF0689711B50A7E973F

public func withAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
    let transaction = Transaction(animation: animation)
    return try withTransaction(transaction, body)
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
public func withAnimation<Result>(_ animation: Animation? = .default, completionCriteria: AnimationCompletionCriteria = .logicallyComplete, _ body: () throws -> Result, completion: @escaping () -> Void) rethrows -> Result {
    var transaction = Transaction(animation: animation)
    transaction.addAnimationCompletion(criteria: completionCriteria, completion)
    return try withTransaction(transaction, body)
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
public struct AnimationCompletionCriteria : Hashable, Sendable {
    private var storage: AnimationCompletionCriteria.Storage
    
    public static let logicallyComplete = AnimationCompletionCriteria(storage: .logicallyComplete)
    public static let removed = AnimationCompletionCriteria(storage: .removed)
}

extension AnimationCompletionCriteria {
    fileprivate enum Storage {
        case logicallyComplete
        case removed
    }
}
