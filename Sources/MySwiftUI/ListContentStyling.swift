public import MySwiftUICore
public import CoreGraphics
private import UIKit

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct ListItemTint : Sendable {
    public static func fixed(_ tint: Color) -> ListItemTint {
        assertUnimplemented()
    }
    
    public static func preferred(_ tint: Color) -> ListItemTint {
        assertUnimplemented()
    }
    
    public static let monochrome: ListItemTint = {
        assertUnimplemented()
    }()
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
    private var insets: EdgeInsets
    private var minHeight: CGFloat
    private var font: Font?
    private var foregroundStyle: Color?
    private var isUppercase: Bool
    private var labelIconToTitleSpacing: CGFloat
    private var tint: ListItemTint?
}

struct ListRowHoverEffectConfiguration {
    private var hoverStyle: UIHoverStyle?
    private var isEnabled: Bool
    private var effect: SystemHoverEffect.Info
    private var path: Path?
}
