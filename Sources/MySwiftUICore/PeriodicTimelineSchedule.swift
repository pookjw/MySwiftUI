public import Foundation

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension TimelineSchedule where Self == PeriodicTimelineSchedule {
    @_alwaysEmitIntoClient public static func periodic(from startDate: Date, by interval: TimeInterval) -> PeriodicTimelineSchedule {
        .init(from: startDate, by: interval)
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public struct PeriodicTimelineSchedule : TimelineSchedule, Sendable {
    public struct Entries : Sequence, IteratorProtocol, Sendable {
        public mutating func next() -> Date? {
            assertUnimplemented()
        }

        @available(iOS 15.0, tvOS 15.0, watchOS 8.0, macOS 12.0, *)
        public typealias Element = Date

        @available(iOS 15.0, tvOS 15.0, watchOS 8.0, macOS 12.0, *)
        public typealias Iterator = PeriodicTimelineSchedule.Entries
    }

    public init(from startDate: Date, by interval: TimeInterval) {
        assertUnimplemented()
    }

    public func entries(from startDate: Date, mode: TimelineScheduleMode) -> PeriodicTimelineSchedule.Entries {
        assertUnimplemented()
    }
}
