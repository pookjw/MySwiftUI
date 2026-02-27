private import Foundation

// invalidateDefault를 빼고 다 존재하지 않고 inline임
enum UICoreUnifiedLayout {
    static var isEnabled: Bool {
        if let cachedValue {
            return cachedValue
        }
        
        let key = "com.apple.SwiftUI.EnableUnifiedLayout"
        let defaults = UserDefaults.standard
        
        guard defaults.object(forKey: key) != nil else {
            cachedValue = false
            return false
        }
        
        let value = defaults.bool(forKey: key)
        cachedValue = value
        return value
    }
    
    static func invalidateDefault() {
        cachedValue = nil
    }
    
    @safe private static nonisolated(unsafe) var cachedValue: Bool? = nil
}
