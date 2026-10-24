public import Foundation
public import MySwiftUICore

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension TimelineSchedule where Self == AnimationTimelineSchedule {
    @_alwaysEmitIntoClient public static var animation: AnimationTimelineSchedule {
        get { .init() }
    }

    @_alwaysEmitIntoClient public static func animation(minimumInterval: Double? = nil, paused: Bool = false) -> AnimationTimelineSchedule {
        .init(minimumInterval: minimumInterval, paused: paused)
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public struct AnimationTimelineSchedule : TimelineSchedule, Sendable {
    public init(minimumInterval: Double? = nil, paused: Bool = false) {
        assertUnimplemented()
    }

    public func entries(from start: Date, mode: TimelineScheduleMode) -> AnimationTimelineSchedule.Entries {
        assertUnimplemented()
    }

    public struct Entries : Sequence, IteratorProtocol, Sendable {
        public mutating func next() -> Date? {
            assertUnimplemented()
        }

        @available(iOS 15.0, tvOS 15.0, watchOS 8.0, macOS 12.0, *)
        public typealias Element = Date

        @available(iOS 15.0, tvOS 15.0, watchOS 8.0, macOS 12.0, *)
        public typealias Iterator = AnimationTimelineSchedule.Entries
    }
}
