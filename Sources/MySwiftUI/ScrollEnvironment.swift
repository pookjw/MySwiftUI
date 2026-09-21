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
            assertUnimplemented()
        }
    }
}

extension View {
    func resetScrollEnvironment() -> some View {
        self.modifier(ResetScrollEnvironmentModifier(axes: .both))
    }
}

extension View {
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    @available(visionOS, unavailable)
    nonisolated public func scrollDismissesKeyboard(_ mode: ScrollDismissesKeyboardMode) -> some View {
        assertUnimplemented()
    }
}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
//@available(visionOS, unavailable)
public struct ScrollDismissesKeyboardMode : Sendable {
    public static var automatic: ScrollDismissesKeyboardMode {
        assertUnimplemented()
    }
    public static var immediately: ScrollDismissesKeyboardMode {
        assertUnimplemented()
    }
    public static var interactively: ScrollDismissesKeyboardMode {
        assertUnimplemented()
    }
    public static var never: ScrollDismissesKeyboardMode {
        assertUnimplemented()
    }
}

@available(iOS 18.2, macOS 15.2, tvOS 18.2, watchOS 11.2, *)
//@available(visionOS, unavailable)
extension ScrollDismissesKeyboardMode : Equatable, Hashable {
    public static func == (a: ScrollDismissesKeyboardMode, b: ScrollDismissesKeyboardMode) -> Bool {
        assertUnimplemented()
    }
    
    public func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
}

@available(iOS 18.2, macOS 15.2, tvOS 18.2, watchOS 11.2, *)
//@available(visionOS, unavailable)
extension ScrollDismissesKeyboardMode {
    enum Role : Hashable {
        case automatic
        case immediately
        case interactively
        case never
    }
}

extension EnvironmentValues {
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    @available(visionOS, unavailable)
    public var scrollDismissesKeyboardMode: ScrollDismissesKeyboardMode {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

enum HandGestureShortcutPaginationDirection : Hashable, CaseIterable {
    case forward
    case reverse
    case none
}

struct NavigationBarScrollMetrics : Equatable {
    private var minHeight: Double
    private var maxHeight: Double
    private var preferredHeight: Double
    private var scrollTargets: [ScrollTarget]
}
