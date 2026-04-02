internal import MySwiftUICore

struct ViewGraphBridgePropertiesAreInput : ViewInputBoolFlag, UserDefaultKeyedFeature {
    static var key: String {
        return "com.apple.SwiftUI.ViewGraphBridgePropertiesAreInput"
    }
    
    @safe nonisolated(unsafe) static var cachedValue: Bool?
    
    static var defaultFeatureValue: Bool {
        return true
    }
}
