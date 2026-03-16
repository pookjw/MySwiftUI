internal import MySwiftUICore
internal import UIKit

final class RenderingMarginsBridge<Content: View> {
    @MainActor func hostDidMove(to windowScene: UIWindowScene?) {
        assertUnimplemented()
    }
    
    func preferencesDidChange(_ preferenceValues: PreferenceValues) {
        assertUnimplemented()
    }
    
    func updateEffectiveClippingMargins(environment: inout EnvironmentValues) {
        assertUnimplemented()
    }
}
