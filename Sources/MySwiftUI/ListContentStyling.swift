// 29B507D90C2CA5FC124E821FB4208B50
public import MySwiftUICore
public import CoreGraphics
internal import UIKit

struct ListContentStyling {
    private(set) var insets: EdgeInsets // 0x0
    private(set) var minHeight: CGFloat // 0x20
    private(set) var font: Font? // 0x28
    private(set) var foregroundStyle: Color? // 0x30
    private(set) var isUppercase: Bool // 0x38
    private(set) var labelIconToTitleSpacing: CGFloat // 0x40
    private(set) var tint: ListItemTint? // 0x48
}

struct ListRowHoverEffectConfiguration : Equatable {
    static func == (lhs: ListRowHoverEffectConfiguration, rhs: ListRowHoverEffectConfiguration) -> Bool {
        assertUnimplemented()
    }
    
    var hoverStyle: UIHoverStyle?
    private(set) var isEnabled: Bool
    private(set) var effect: SystemHoverEffect.Info
    var path: Path?
    
    mutating func updateEffect(with preferences: PreferenceValues) {
        assertUnimplemented()
    }
}
