internal import MySwiftUICore
internal import UIKit

@MainActor
final class RenderingMarginsBridge<Content : View> {
    private weak var host: _UIHostingView<Content>? = nil // 0x10
    private weak var windowScene: UIWindowScene? = nil // 0x18
    private var preferredMarginsSeedTracker = VersionSeedTracker<RenderingMarginsKey>(seed: .invalid) // 0x20
    private var effectiveClippingMargins: EdgeInsets3D = .zero // 0x28
    
    init(_ host: _UIHostingView<Content>) {
        self.host = host
    }
    
    func hostDidMove(to windowScene: UIWindowScene?) {
        assertUnimplemented()
    }
    
    func preferencesDidChange(_ preferenceValues: PreferenceValues) {
        assertUnimplemented()
    }
    
    func updateEffectiveClippingMargins(environment: inout EnvironmentValues) {
        assertUnimplemented()
    }
}

struct RenderingMarginsKey: HostPreferenceKey {
    static let defaultValue: RenderingMarginsKey.Value = {
        assertUnimplemented()
    }()
    
    static func reduce(value: inout Value, nextValue: () -> Value) {
        assertUnimplemented()
    }
}

extension RenderingMarginsKey {
    struct Value: Equatable {
        private var margins: OptionalEdgeInsets3D
        private var animation: Animation?
    }
}
