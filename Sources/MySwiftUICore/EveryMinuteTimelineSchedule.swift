public import Foundation

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension TimelineSchedule where Self == EveryMinuteTimelineSchedule {
    @_alwaysEmitIntoClient public static var everyMinute: EveryMinuteTimelineSchedule {
        get { .init() }
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public struct EveryMinuteTimelineSchedule : TimelineSchedule, Sendable {
    public struct Entries : Sequence, IteratorProtocol, Sendable {
        static let zeroSecondComponents: DateComponents = { assertUnimplemented() }()

        init(startDate: Date) {
            assertUnimplemented()
        }

        public mutating func next() -> Date? {
            assertUnimplemented()
        }

        @available(iOS 15.0, tvOS 15.0, watchOS 8.0, macOS 12.0, *)
        public typealias Element = Date

        @available(iOS 15.0, tvOS 15.0, watchOS 8.0, macOS 12.0, *)
        public typealias Iterator = EveryMinuteTimelineSchedule.Entries
    }

    public init() {
        assertUnimplemented()
    }

    public func entries(from startDate: Date, mode: TimelineScheduleMode) -> EveryMinuteTimelineSchedule.Entries {
        assertUnimplemented()
    }
}
