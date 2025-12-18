internal import MySwiftUICore

struct ViewGraphBridgePropertiesAreInput: ViewInputBoolFlag, UserDefaultKeyedFeature {
    static var key: String {
        return "com.apple.SwiftUI.ViewGraphBridgePropertiesAreInput"
    }
    
    @safe static nonisolated(unsafe) var cachedValue: Bool?
}
