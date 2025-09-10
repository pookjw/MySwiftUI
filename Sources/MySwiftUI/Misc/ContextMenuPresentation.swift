#warning("TODO")
internal import MySwiftUICore
private import MRUIKit
private import StopwatchSupport

struct ContextMenuPresentation {
    private var isPresented: Binding<Bool>
    private var isPresentedValue: Bool
    private var location: Anchor<SPPoint3D>
}

extension ContextMenuPresentation {
    struct Key: HostPreferenceKey {
        static nonisolated(unsafe) let defaultValue: [ViewIdentity: ContextMenuPresentation] = [:]
    }
}
