public import Foundation

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension TimelineSchedule {
    @_alwaysEmitIntoClient public static func explicit<S>(_ dates: S) -> ExplicitTimelineSchedule<S> where Self == ExplicitTimelineSchedule<S>, S : Sequence, S.Element == Date {
        .init(dates)
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public struct ExplicitTimelineSchedule<Entries> : TimelineSchedule where Entries : Sequence, Entries.Element == Date {
    public init(_ dates: Entries) {
        assertUnimplemented()
    }

    public func entries(from startDate: Date, mode: TimelineScheduleMode) -> Entries {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension ExplicitTimelineSchedule : Sendable {
}
