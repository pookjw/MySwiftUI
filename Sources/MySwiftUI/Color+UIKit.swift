public import UIKit
public import MySwiftUICore

@available(iOS, introduced: 13.0, deprecated: 100000.0, message: "Use Color(uiColor:) when converting a UIColor, or create a standard Color directly")
@available(macOS, unavailable)
@available(tvOS, introduced: 13.0, deprecated: 100000.0, message: "Use Color(uiColor:) when converting a UIColor, or create a standard Color directly")
@available(watchOS, introduced: 6.0, deprecated: 100000.0, message: "Use Color(uiColor:) when converting a UIColor, or create a standard Color directly")
@available(visionOS, introduced: 1.0, deprecated: 100000.0, message: "Use Color(uiColor:) when converting a UIColor, or create a standard Color directly")
extension Color {
    @_disfavoredOverload public init(_ color: UIColor) {
        self.init(uiColor: color)
    }
}

@available(iOS 15.0, tvOS 15.0, watchOS 8.0, *)
@available(macOS, unavailable)
extension Color {
    public init(uiColor: UIColor) {
        self.init(_platformColor: uiColor, definition: UIKitPlatformColorDefinition.self)
    }
}

extension UIColor {
  @available(iOS 14.0, tvOS 14.0, watchOS 7.0, *)
  @available(macOS, unavailable)
    convenience public init(_ color: Color) {
        assertUnimplemented()
    }
}
