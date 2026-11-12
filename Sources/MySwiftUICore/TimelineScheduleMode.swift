@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public enum TimelineScheduleMode : Sendable {
    case normal
    case lowFrequency
}

extension TimelineScheduleMode : Equatable {}

extension TimelineScheduleMode : Hashable {}
