public import MySwiftUICore
public import Foundation
public import UIKit

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension Text {
    nonisolated public func accessibilityTextContentType(_ value: AccessibilityTextContentType) -> Text { assertUnimplemented() }
    nonisolated public func accessibilityHeading(_ level: AccessibilityHeadingLevel) -> Text { assertUnimplemented() }
    nonisolated public func accessibilityLabel(_ label: Text) -> Text { assertUnimplemented() }
    nonisolated public func accessibilityLabel(_ labelKey: LocalizedStringKey) -> Text { assertUnimplemented() }
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    @_disfavoredOverload @_alwaysEmitIntoClient nonisolated public func accessibilityLabel(_ label: LocalizedStringResource) -> Text {
        accessibilityLabel(Text(label))
    }
    @_disfavoredOverload nonisolated public func accessibilityLabel<S>(_ label: S) -> Text where S : StringProtocol { assertUnimplemented() }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension Text {
    public func speechAlwaysIncludesPunctuation(_ value: Bool = true) -> Text { assertUnimplemented() }
    public func speechSpellsOutCharacters(_ value: Bool = true) -> Text { assertUnimplemented() }
    public func speechAdjustedPitch(_ value: Double) -> Text { assertUnimplemented() }
    public func speechAnnouncementsQueued(_ value: Bool = true) -> Text { assertUnimplemented() }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension Text.LineStyle {
    public init?(nsUnderlineStyle: NSUnderlineStyle) { assertUnimplemented() }
}
