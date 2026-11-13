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
    private var minimumInterval: Double
    private var paused: Bool
    
    public init(minimumInterval: Double? = nil, paused: Bool = false) {
        self.minimumInterval = minimumInterval ?? (1.0 / 120.0)
        self.paused = paused
    }

    public func entries(from start: Date, mode: TimelineScheduleMode) -> AnimationTimelineSchedule.Entries {
        if self.paused {
            return AnimationTimelineSchedule.Entries(date: start, interval: nil)
        } else {
            return AnimationTimelineSchedule.Entries(
                date: start,
                interval: (mode == .lowFrequency) ? nil : self.minimumInterval
            )
        }
    }
    
    public struct Entries : Sequence, IteratorProtocol, Sendable {
        fileprivate private(set) var date: Date
        fileprivate private(set) var interval: Double?
        
        public mutating func next() -> Date? {
            guard let interval else {
                return nil
            }
            
            let result = self.date
            self.date += interval
            
            return result
        }
        
        @available(iOS 15.0, tvOS 15.0, watchOS 8.0, macOS 12.0, *)
        public typealias Element = Date
        
        @available(iOS 15.0, tvOS 15.0, watchOS 8.0, macOS 12.0, *)
        public typealias Iterator = AnimationTimelineSchedule.Entries
    }
}
