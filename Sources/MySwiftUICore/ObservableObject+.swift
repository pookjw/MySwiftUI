package import Combine

extension ObservableObject {
    package static var environmentStore: WritableKeyPath<EnvironmentValues, Self?> {
        let key = EnvironmentObjectKey<Self>()
        return \EnvironmentValues[key]
    }
}
