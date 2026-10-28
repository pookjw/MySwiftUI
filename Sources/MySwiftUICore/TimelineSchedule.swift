public import Foundation

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public protocol TimelineSchedule {
    typealias Mode = TimelineScheduleMode

    associatedtype Entries : Sequence where Self.Entries.Element == Date

    func entries(from startDate: Date, mode: Self.Mode) -> Self.Entries
}

extension TimelineSchedule {
    public func entries(within range: DateInterval, mode: TimelineScheduleMode = .normal, limit: UInt? = nil) -> [Date] {
        assertUnimplemented()
    }
    
    public func lazyEntries(within range: Range<Date>, mode: TimelineScheduleMode = .normal, limit: UInt? = nil) -> LazySequence<AnySequence<Date>> {
        assertUnimplemented()
    }
    
    public func nextEntry(after date: Date, mode: TimelineScheduleMode, limit: UInt?) -> Date {
        assertUnimplemented()
    }
}
