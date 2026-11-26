// 7800CE2E251A218329C9998E1C3194FD
public import CoreGraphics
internal import UIFoundation

extension Text {
    @available(iOS, introduced: 13.0, deprecated: 100000.0, renamed: "foregroundStyle(_:)")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, renamed: "foregroundStyle(_:)")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, renamed: "foregroundStyle(_:)")
    @available(watchOS, introduced: 6.0, deprecated: 100000.0, renamed: "foregroundStyle(_:)")
    @available(visionOS, introduced: 1.0, deprecated: 100000.0, renamed: "foregroundStyle(_:)")
    nonisolated public func foregroundColor(_ color: Color?) -> Text {
        assertUnimplemented()
    }
    
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    nonisolated public func foregroundStyle<S>(_ style: S) -> Text where S : ShapeStyle {
        if let casted = style as? Color {
            var copy = self
            copy.modifiers.append(.color(casted))
            return copy
        } else {
            let modifier = TextForegroundStyleModifier(style)
            var copy = self
            copy.modifiers.append(.anyTextModifier(modifier))
            return copy
        }
    }
    
    nonisolated public func font(_ font: Font?) -> Text {
        var copy = self
        copy.modifiers.append(.font(font))
        return copy
    }
    
    nonisolated public func fontWeight(_ weight: Font.Weight?) -> Text {
        var copy = self
        copy.modifiers.append(.weight(weight))
        return copy
    }
    
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    nonisolated public func fontWidth(_ width: Font.Width?) -> Text {
        let modifier = TextWidthModifier(width?.value)
        var copy = self
        copy.modifiers.append(.anyTextModifier(modifier))
        return copy
    }
    
    nonisolated public func bold() -> Text {
        let modifier = BoldTextModifier(isActive: true)
        var copy = self
        copy.modifiers.append(.anyTextModifier(modifier))
        return copy
    }
    
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    nonisolated public func bold(_ isActive: Bool) -> Text {
        let modifier = BoldTextModifier(isActive: isActive)
        var copy = self
        copy.modifiers.append(.anyTextModifier(modifier))
        return copy
    }
    
    nonisolated public func italic() -> Text {
        var copy = self
        copy.modifiers.append(.italic)
        return copy
    }
    
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    nonisolated public func italic(_ isActive: Bool) -> Text {
        let modifier = ItalicTextModifier(isActive: isActive)
        var copy = self
        copy.modifiers.append(.anyTextModifier(modifier))
        return copy
    }
    
    @available(iOS 16.4, macOS 13.3, tvOS 16.4, watchOS 9.4, *)
    nonisolated public func monospaced(_ isActive: Bool = true) -> Text {
        let modifier = MonospacedTextModifier(isActive: isActive)
        var copy = self
        copy.modifiers.append(.anyTextModifier(modifier))
        return copy
    }
    
    @available(iOS 16.1, macOS 13.0, tvOS 16.1, watchOS 9.1, *)
    nonisolated public func fontDesign(_ design: Font.Design?) -> Text {
        let modifier = TextDesignModifier(design)
        var copy = self
        copy.modifiers.append(.anyTextModifier(modifier))
        return copy
    }
    
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    nonisolated public func monospacedDigit() -> Text {
        let modifier = MonospacedDigitTextModifier()
        var copy = self
        copy.modifiers.append(.anyTextModifier(modifier))
        return copy
    }
    
    nonisolated public func strikethrough(_ isActive: Bool = true, color: Color? = nil) -> Text {
        let modifier = StrikethroughTextModifier(
            isActive ? Text.LineStyle(pattern: .solid, color: color) : nil
        )
        
        var copy = self
        copy.modifiers.append(.anyTextModifier(modifier))
        return copy
    }
    
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    nonisolated public func strikethrough(_ isActive: Bool = true, pattern: Text.LineStyle.Pattern, color: Color? = nil) -> Text {
        let modifier = StrikethroughTextModifier(
            isActive ? Text.LineStyle(pattern: pattern, color: color) : nil
        )
        
        var copy = self
        copy.modifiers.append(.anyTextModifier(modifier))
        return copy
    }
    
    nonisolated public func underline(_ isActive: Bool = true, color: Color? = nil) -> Text {
        let modifier = UnderlineTextModifier(
            isActive ? Text.LineStyle(pattern: .solid, color: color) : nil
        )
        
        var copy = self
        copy.modifiers.append(.anyTextModifier(modifier))
        return copy
    }
    
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    nonisolated public func underline(_ isActive: Bool = true, pattern: Text.LineStyle.Pattern, color: Color? = nil) -> Text {
        let modifier = UnderlineTextModifier(
            isActive ? Text.LineStyle(pattern: pattern, color: color) : nil
        )
        
        var copy = self
        copy.modifiers.append(.anyTextModifier(modifier))
        return copy
    }
    
    nonisolated public func kerning(_ kerning: CGFloat) -> Text {
        var copy = self
        copy.modifiers.append(.kerning(kerning))
        return copy
    }
    
    nonisolated public func tracking(_ tracking: CGFloat) -> Text {
        var copy = self
        copy.modifiers.append(.tracking(tracking))
        return copy
    }
    
    nonisolated public func baselineOffset(_ baselineOffset: CGFloat) -> Text {
        var copy = self
        copy.modifiers.append(.baseline(baselineOffset))
        return copy
    }
    
    nonisolated public func _stylisticAlternative(_ alternative: Font._StylisticAlternative) -> Text {
        let modifier = StylisticAlternativeTextModifier(alternative)
        
        var copy = self
        copy.modifiers.append(.anyTextModifier(modifier))
        return copy
    }
}

@usableFromInline
package class AnyTextModifier {
    func isStyled(options: Text.ResolveOptions) -> Bool {
        return true
    }
    
    func modify(style: inout Text.Style, environment: EnvironmentValues) {
        fatalError()
    }
    
    func isEqual(to other: AnyTextModifier) -> Bool {
        fatalError()
    }
    
    init() {}
}

@available(*, unavailable)
extension AnyTextModifier : Sendable {}

final class TextForegroundStyleModifier : AnyTextModifier {
    private let style: AnyShapeStyle
    
    override func modify(style: inout Text.Style, environment: EnvironmentValues) {
        assertUnimplemented()
    }
    
    override func isEqual(to other: AnyTextModifier) -> Bool {
        assertUnimplemented()
    }
    
    init<T : ShapeStyle>(_ style: T) {
        self.style = AnyShapeStyle(style)
        super.init()
    }
}

final class TextWidthModifier : AnyTextModifier {
    private let width: CGFloat?
    
    override func modify(style: inout Text.Style, environment: EnvironmentValues) {
        assertUnimplemented()
    }
    
    override func isEqual(to other: AnyTextModifier) -> Bool {
        assertUnimplemented()
    }
    
    init(_ width: CGFloat?) {
        self.width = width
        super.init()
    }
}

final class BoldTextModifier : AnyTextModifier {
    private let isActive: Bool
    
    override func modify(style: inout Text.Style, environment: EnvironmentValues) {
        assertUnimplemented()
    }
    
    override func isEqual(to other: AnyTextModifier) -> Bool {
        assertUnimplemented()
    }
    
    init(isActive: Bool) {
        self.isActive = isActive
        super.init()
    }
}

final class ItalicTextModifier : AnyTextModifier {
    private let isActive: Bool
    
    override func modify(style: inout Text.Style, environment: EnvironmentValues) {
        assertUnimplemented()
    }
    
    override func isEqual(to other: AnyTextModifier) -> Bool {
        assertUnimplemented()
    }
    
    init(isActive: Bool) {
        self.isActive = isActive
        super.init()
    }
}

final class MonospacedTextModifier : AnyTextModifier {
    private let isActive: Bool
    
    override func modify(style: inout Text.Style, environment: EnvironmentValues) {
        assertUnimplemented()
    }
    
    override func isEqual(to other: AnyTextModifier) -> Bool {
        assertUnimplemented()
    }
    
    init(isActive: Bool) {
        self.isActive = isActive
        super.init()
    }
}

final class TextDesignModifier : AnyTextModifier {
    private let design: Font.Design?
    
    override func modify(style: inout Text.Style, environment: EnvironmentValues) {
        assertUnimplemented()
    }
    
    override func isEqual(to other: AnyTextModifier) -> Bool {
        assertUnimplemented()
    }
    
    init(_ design: Font.Design?) {
        self.design = design
        super.init()
    }
}

final class MonospacedDigitTextModifier : AnyTextModifier {
    override func modify(style: inout Text.Style, environment: EnvironmentValues) {
        assertUnimplemented()
    }
    
    override func isEqual(to other: AnyTextModifier) -> Bool {
        assertUnimplemented()
    }
}

final class StrikethroughTextModifier : AnyTextModifier {
    private let lineStyle: Text.LineStyle?
    
    override func modify(style: inout Text.Style, environment: EnvironmentValues) {
        assertUnimplemented()
    }
    
    override func isEqual(to other: AnyTextModifier) -> Bool {
        assertUnimplemented()
    }
    
    init(_ lineStyle: Text.LineStyle?) {
        self.lineStyle = lineStyle
        super.init()
    }
}

final class UnderlineTextModifier : AnyTextModifier {
    private let lineStyle: Text.LineStyle?
    
    override func modify(style: inout Text.Style, environment: EnvironmentValues) {
        assertUnimplemented()
    }
    
    override func isEqual(to other: AnyTextModifier) -> Bool {
        assertUnimplemented()
    }
    
    init(_ lineStyle: Text.LineStyle?) {
        self.lineStyle = lineStyle
        super.init()
    }
}

fileprivate final class StylisticAlternativeTextModifier : AnyTextModifier {
    private let value: Font._StylisticAlternative
    
    override func modify(style: inout Text.Style, environment: EnvironmentValues) {
        assertUnimplemented()
    }
    
    override func isEqual(to other: AnyTextModifier) -> Bool {
        assertUnimplemented()
    }
    
    init(_ value: Font._StylisticAlternative) {
        self.value = value
        super.init()
    }
}
