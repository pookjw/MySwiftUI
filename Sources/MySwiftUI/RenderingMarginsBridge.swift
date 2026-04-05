// 50C6897C55ADE827340B10B43BE19EE7
internal import MySwiftUICore
internal import UIKit
internal import _UIKitPrivate

@MainActor
final class RenderingMarginsBridge<Content : View> : _UISceneEffectiveClippingMarginsObserver {
    private weak var host: _UIHostingView<Content>? = nil // 0x10
    private weak var windowScene: UIWindowScene? = nil // 0x18
    private var preferredMarginsSeedTracker = VersionSeedTracker<RenderingMarginsKey>(seed: .invalid) // 0x20
    private var effectiveClippingMargins: EdgeInsets3D = .zero // 0x28
    
    init(_ host: _UIHostingView<Content>) {
        self.host = host
    }
    
    func hostDidMove(to windowScene: UIWindowScene?) {
        /*
         self -> x20
         windowScene -> x0 -> x19
         */
        if
            let windowScene = self.windowScene,
            let component = windowScene._clippingMarginsClientComponent
        {
            component._remove(self)
        }
        
        // <+76>
        if
            let windowScene,
            let component = windowScene._clippingMarginsClientComponent
        {
            component._add(self)
        }
        
        self.windowScene = windowScene
    }
    
    func preferencesDidChange(_ preferenceValues: PreferenceValues) {
        assertUnimplemented()
    }
    
    func updateEffectiveClippingMargins(environment: inout EnvironmentValues) {
        environment[WindowClippingMarginsKey.self] = self.effectiveClippingMargins
    }
    
    func effectiveClippingMarginsChanged(_ insets: _UIEdgeInsets3D) {
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

extension EnvironmentValues {
    var effectiveWindowMargins: EdgeOutsets3D {
        let insets = self[WindowClippingMarginsKey.self]
        let negated = insets.negatedInsets
        return EdgeOutsets3D(
            top: -negated.top,
            leading: -negated.leading,
            bottom: -negated.bottom,
            trailing: -negated.trailing,
            front: -negated.front,
            back: -negated.back
        )
    }
}

fileprivate struct WindowClippingMarginsKey : EnvironmentKey {
    static let defaultValue = EdgeInsets3D.zero
}
