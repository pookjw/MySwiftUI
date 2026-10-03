// FF477D43CB6C041091B7CAE0853591AA
internal import MySwiftUICore

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct ListItemTint : Sendable {
    private var effect: ListItemTint.Effect
    private(set) var isFixed: Bool
    
    public static func fixed(_ tint: Color) -> ListItemTint {
        return ListItemTint(
            effect: .color(tint),
            isFixed: true
        )
    }
    
    public static func preferred(_ tint: Color) -> ListItemTint {
        return ListItemTint(
            effect: .color(tint),
            isFixed: false
        )
    }
    
    public static let monochrome: ListItemTint = {
        return ListItemTint(
            effect: .monochrome,
            isFixed: true
        )
    }()
}

extension ListItemTint {
    enum Effect {
        case color(Color)
        case monochrome
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension View {
    @inlinable nonisolated public func listItemTint(_ tint: ListItemTint?) -> some View {
        _trait(ListItemTintTraitKey.self, tint)
    }
    
    @inlinable nonisolated public func listItemTint(_ tint: Color?) -> some View {
        listItemTint(tint.map { .fixed($0) })
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
@usableFromInline
internal struct ListItemTintTraitKey : _ViewTraitKey {
    @inlinable internal static var defaultValue: ListItemTint? {
        get { nil }
    }
    
    @available(iOS 14.0, tvOS 14.0, watchOS 7.0, macOS 11.0, *)
    @usableFromInline
    internal typealias Value = ListItemTint?
}

@available(*, unavailable)
extension ListItemTintTraitKey : Sendable {
}

extension EnvironmentValues {
    var listItemTint: ListItemTint? {
        get {
            return self[ListItemTintKey.self]
        }
        set {
            self[ListItemTintKey.self] = newValue
        }
    }
}

fileprivate struct ListItemTintKey : EnvironmentKey {
    static var defaultValue: ListItemTint? {
        return nil
    }
}
