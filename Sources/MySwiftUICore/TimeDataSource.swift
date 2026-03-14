public import Foundation

@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public struct TimeDataSource<Value> {
}

@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension TimeDataSource: Sendable where Value: Sendable {
}

@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension TimeDataSource {
    public static var currentDate: TimeDataSource<Date> {
        get {
            assertUnimplemented()
        }
    }
    
    public static func durationOffset(to date: Date) -> TimeDataSource<Duration> {
        assertUnimplemented()
    }
    
    public static func dateRange(startingAt date: Date) -> TimeDataSource<Range<Date>> {
        assertUnimplemented()
    }
    
    public static func dateRange(endingAt date: Date) -> TimeDataSource<Range<Date>> {
        assertUnimplemented()
    }
}

@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public enum SystemFormatStyle: Sendable {
}

extension Text {
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    public init<V, F>(_ source: TimeDataSource<V>, format: F) where V == F.FormatInput, F: DiscreteFormatStyle, F.FormatOutput == AttributedString {
        assertUnimplemented()
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @_disfavoredOverload
    public init<V, F>(_ source: TimeDataSource<V>, format: F) where V == F.FormatInput, F: DiscreteFormatStyle, F.FormatOutput == String {
        assertUnimplemented()
    }
}

extension LocalizedStringKey.StringInterpolation {
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @_semantics("swiftui.localized.appendInterpolation_@_specifier")
    public mutating func appendInterpolation<V, F>(_ source: TimeDataSource<V>, format: F) where V == F.FormatInput, F: DiscreteFormatStyle, F.FormatOutput == AttributedString {
        assertUnimplemented()
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @_disfavoredOverload
    @_semantics("swiftui.localized.appendInterpolation_@_specifier")
    public mutating func appendInterpolation<V, F>(_ source: TimeDataSource<V>, format: F) where V == F.FormatInput, F: DiscreteFormatStyle, F.FormatOutput == String {
        assertUnimplemented()
    }
}
