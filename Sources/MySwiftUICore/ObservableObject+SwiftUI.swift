public import Combine

extension Combine::ObservableObject {
    @usableFromInline
    package static var environmentStore: WritableKeyPath<EnvironmentValues, Self?> {
        let key = EnvironmentObjectKey<Self>()
        return \EnvironmentValues[key]
    }
    
    static var hasDefaultPublisher: Bool {
        return ObjectWillChangePublisher.self == Combine::ObservableObjectPublisher.self
    }
}
