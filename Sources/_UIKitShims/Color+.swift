internal import MySwiftUICore
internal import UIKit

extension Color {
    static let uiColorCache = ObjectCache<Color.Resolved, UIColor> { resolved in
        let red = resolved.red
        let green = resolved.green
        let blue = resolved.blue
        let opacity = resolved.opacity
        return UIColor(
            red: CGFloat(red),
            green: CGFloat(green),
            blue: CGFloat(blue),
            alpha: CGFloat(opacity)
        )
    }
}
