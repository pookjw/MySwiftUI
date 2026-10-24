public import Foundation

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public protocol TimelineSchedule {
    typealias Mode = TimelineScheduleMode

    associatedtype Entries : Sequence where Self.Entries.Element == Date

    func entries(from startDate: Date, mode: Self.Mode) -> Self.Entries
}
