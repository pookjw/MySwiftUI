public import MySwiftUICore
public import CoreGraphics
internal import UIKit

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

struct ListContentStyling {
    private(set) var insets: EdgeInsets // 0x0
    private(set) var minHeight: CGFloat // 0x20
    private(set) var font: Font? // 0x28
    private(set) var foregroundStyle: Color? // 0x30
    private(set) var isUppercase: Bool // 0x38
    private(set) var labelIconToTitleSpacing: CGFloat // 0x40
    private(set) var tint: ListItemTint? // 0x48
}

struct ListRowHoverEffectConfiguration {
    private(set) var hoverStyle: UIHoverStyle?
    private var isEnabled: Bool
    private var effect: SystemHoverEffect.Info
    private var path: Path?
}
