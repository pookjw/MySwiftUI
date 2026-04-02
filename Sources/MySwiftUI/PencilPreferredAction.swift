// DBEB7E16FBD809A77C11AE6B483F2FFD
public import MySwiftUICore

@available(iOS 17.5, macOS 14.5, visionOS 26.2, *)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
public struct PencilPreferredAction : Hashable {
    private let guts: PencilPreferredAction.Guts
    
    @safe nonisolated(unsafe) public static let switchEraser = PencilPreferredAction(guts: .switchEraser)
    @safe nonisolated(unsafe) public static let switchPrevious = PencilPreferredAction(guts: .switchPrevious)
    @safe nonisolated(unsafe) public static let showColorPalette = PencilPreferredAction(guts: .showColorPalette)
    @safe nonisolated(unsafe) public static let showInkAttributes = PencilPreferredAction(guts: .showInkAttributes)
    @safe nonisolated(unsafe) public static let showContextualPalette = PencilPreferredAction(guts: .showContextualPalette)
    @safe nonisolated(unsafe) public static let runSystemShortcut = PencilPreferredAction(guts: .runSystemShortcut)
    @safe nonisolated(unsafe) public static let ignore = PencilPreferredAction(guts: .ignore)
}

@available(*, unavailable)
extension PencilPreferredAction : Sendable {
}

@available(iOS 17.5, macOS 14.5, visionOS 26.2, *)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension EnvironmentValues {
    public internal(set) var preferredPencilDoubleTapAction: PencilPreferredAction {
        get {
            return self[__Key_preferredPencilDoubleTapAction.self]
        }
        set {
            self[__Key_preferredPencilDoubleTapAction.self] = newValue
        }
    }
    
    // TODO: Macro Entry
    fileprivate struct __Key_preferredPencilDoubleTapAction : EnvironmentKey {
        static var defaultValue: PencilPreferredAction {
            return .switchEraser
        }
    }
}

@available(iOS 17.5, macOS 14.5, visionOS 26.2, *)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension EnvironmentValues {
    public internal(set) var preferredPencilSqueezeAction: PencilPreferredAction {
        get {
            return self[__Key_preferredPencilSqueezeAction.self]
        }
        set {
            self[__Key_preferredPencilSqueezeAction.self] = newValue
        }
    }
    
    // TODO: Macro Entry
    fileprivate struct __Key_preferredPencilSqueezeAction : EnvironmentKey {
        static var defaultValue: PencilPreferredAction {
            return .showContextualPalette
        }
    }
}

@available(iOS 17.5, macOS 14.5, visionOS 26.2, *)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension PencilPreferredAction {
    fileprivate enum Guts : Hashable {
        case switchEraser
        case switchPrevious
        case showColorPalette
        case showInkAttributes
        case showContextualPalette
        case runSystemShortcut
        case ignore
    }
}
