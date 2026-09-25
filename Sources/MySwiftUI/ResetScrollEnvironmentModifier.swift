// 333E2209AFE841F0F3215E9AA4F7EA22
internal import MySwiftUICore
private import AttributeGraph

struct ResetScrollEnvironmentModifier : ViewModifier {
    fileprivate private(set) var axes: Axis.Set
    
    func body(content: Content) -> some View {
        content
            .modifier(AdditionalResetModifier())
            .modifier(
                TransformScrollStorageModifier(
                    transform: ResetScrollEnvironmentModifier.ResetTransform(axes: self.axes)
                )
            )
    }
}

extension ResetScrollEnvironmentModifier {
    fileprivate struct ResetTransform : ScrollEnvironmentTransform {
        private(set) var axes: Axis.Set
        
        func update(properties: inout ScrollEnvironmentProperties) {
            assertUnimplemented()
        }
    }
    
    fileprivate struct AdditionalResetModifier : _GraphInputsModifier, EnvironmentModifier, PrimitiveViewModifier {
        static func makeEnvironment(modifier: Attribute<ResetScrollEnvironmentModifier.AdditionalResetModifier>, environment: inout EnvironmentValues) {
            environment.scrollAnchors = ScrollAnchorStorage()
            environment.onScrollToTopGesture = nil
            environment.scrollContentBackground = ScrollContentBackground(
                style: nil,
                visibility: .automatic,
                wantsWindowBackground: false
            )
            environment.popoverAutomaticallyDismissesWhenScrolledOutOfView = nil
        }
    }
}

extension View {
    func resetScrollEnvironment() -> some View {
        self.modifier(ResetScrollEnvironmentModifier(axes: .both))
    }
}

struct ScrollToTopGestureAction {
    private let action: () -> Void
}

extension EnvironmentValues {
    var onScrollToTopGesture: ScrollToTopGestureAction? {
        get {
            return self[ScrollToTopGestureActionKey.self]
        }
        set {
            self[ScrollToTopGestureActionKey.self] = newValue
        }
    }
}

fileprivate struct ScrollToTopGestureActionKey : EnvironmentKey {
    static var defaultValue: ScrollToTopGestureAction? {
        return nil
    }
}
