internal import MySwiftUICore
private import FeatureFlags

struct ClientSideSceneClipping3DDuringResize: Feature {
    @usableFromInline
    @safe static nonisolated(unsafe) var isEnabledForTesting: Bool = false
    
    @inlinable
    static var isEnabled: Bool {
        let result: Bool
        if ClientSideSceneClipping3DDuringResize.isEnabledForTesting {
            result = true
        } else {
            result = isFeatureEnabled(ClientSideSceneClipping3DDuringResize.Key())
        }
        
        if result {
            return isLinkedOnOrAfter(.v6)
        } else {
            return false
        }
    }
    
    init() {}
}

extension ClientSideSceneClipping3DDuringResize {
    fileprivate struct Key: FeatureFlagsKey {
        var domain: StaticString {
            return "SwiftUI"
        }
        
        var feature: StaticString {
            return "clientSideSceneClipping3DDuringResize"
        }
    }
}
