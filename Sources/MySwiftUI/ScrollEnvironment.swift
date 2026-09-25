// 574BFBFAD68871B7FB9A4D49488469C1
internal import MySwiftUICore
internal import Observation

extension EnvironmentValues {
    var scrollStorage: ScrollEnvironmentStorage {
        get {
            return self[EnvironmentValues.ScrollEnvironmentKey.self]
        }
        set {
            self[EnvironmentValues.ScrollEnvironmentKey.self] = newValue
        }
    }
    
    fileprivate struct ScrollEnvironmentKey : EnvironmentKey {
        @safe static nonisolated(unsafe) let defaultValue = ScrollEnvironmentStorage(
            ScrollEnvironmentProperties(),
            transform: nil
        )
    }
}

@Observable
final class ScrollEnvironmentStorage {
    var baseProperties: ScrollEnvironmentProperties
    var transform: (any ScrollEnvironmentTransform)?
    
    var properties: ScrollEnvironmentProperties {
        var result = self.baseProperties
        
        if let transform {
            transform.update(properties: &result)
        }
        
        return result
    }
    
    init(_ baseProperties: ScrollEnvironmentProperties, transform: ScrollEnvironmentTransform?) {
        self.baseProperties = baseProperties
        self.transform = transform
    }
}
