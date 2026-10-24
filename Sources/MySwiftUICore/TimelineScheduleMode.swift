public import Foundation

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public enum TimelineScheduleMode : Sendable {
    case normal

    case lowFrequency

    public static func == (a: TimelineScheduleMode, b: TimelineScheduleMode) -> Bool {
        assertUnimplemented()
    }

    public func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }

    public var hashValue: Int {
        get {
            assertUnimplemented()
        }
    }
}

extension TimelineScheduleMode : Equatable {}

extension TimelineScheduleMode : Hashable {}
