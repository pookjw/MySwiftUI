#warning("TODO")
package import Foundation

package protocol UserDefaultKeyedFeature: Feature {
    static var key: String { get }
    static var defaultFeatureValue: Bool { get }
    static var defaults: UserDefaults { get }
    static var cachedValue: Bool? { get set }
}

extension UserDefaultKeyedFeature {
    package static var isEnabled: Bool {
        if let cachedValue {
            return cachedValue
        }
        
        if defaults.object(forKey: key) != nil {
            return defaults.bool(forKey: key)
        } else {
            return defaultFeatureValue
        }
    }
    
    package static var defaults: UserDefaults {
        return UserDefaults.standard
    }
    
    package static var defaultFeatureValue: Bool {
        return false
    }
    
    static func test<T>(enabled: Bool, _ body: () throws -> T) rethrows -> T {
        fatalError("TODO")
    }
}
