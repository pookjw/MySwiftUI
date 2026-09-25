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
        @safe static nonisolated(unsafe) let defaultValue: ScrollEnvironmentStorage = {
            assertUnimplemented()
        }()
    }
}

@Observable
final class ScrollEnvironmentStorage {
    var baseProperties: ScrollEnvironmentProperties
    var transform: ScrollEnvironmentTransform?
    
    var properties: ScrollEnvironmentProperties {
        assertUnimplemented()
    }
    
    init(_ baseProperties: ScrollEnvironmentProperties, transform: ScrollEnvironmentTransform?) {
        assertUnimplemented()
    }
}
