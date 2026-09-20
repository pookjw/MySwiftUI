// 16FA549D504C127F429806EC47FAADE
internal import MySwiftUICore

extension View {
    func clearSharingPickerHost() -> some View {
        self.environment(\.presentSharingPicker, nil)
    }
}

extension EnvironmentValues {
    var presentSharingPicker: PresentSharingPickerAction? {
        get {
            return self[PresentSharingPickerKey.self]
        }
        set {
            self[PresentSharingPickerKey.self] = newValue
        }
    }
}

struct PresentSharingPickerAction {
    @Binding private var model: SharingPickerHostModifier.Model?
}

fileprivate struct PresentSharingPickerKey : EnvironmentKey {
    static var defaultValue: PresentSharingPickerAction? {
        return nil
    }
}

fileprivate struct SharingPickerHostModifier {
    @State private var model: SharingPickerHostModifier.Model?
}

extension SharingPickerHostModifier {
    struct Model {
        private var shareConfiguration: AnyIdentifiableShareConfiguration?
        private var onPresentationChanged: ((Bool) -> Void)?
    }
}
