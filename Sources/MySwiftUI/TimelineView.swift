// A009558074DBEAE1A969E3C6E8DD1422
public import Foundation
public import MySwiftUICore

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public struct TimelineView<Schedule, Content> where Schedule : TimelineSchedule {
    public struct Context {
        public enum Cadence : Comparable, Sendable {
            case live

            case seconds

            case minutes

            public static func < (a: TimelineView<Schedule, Content>.Context.Cadence, b: TimelineView<Schedule, Content>.Context.Cadence) -> Bool {
                assertUnimplemented()
            }

            public static func == (a: TimelineView<Schedule, Content>.Context.Cadence, b: TimelineView<Schedule, Content>.Context.Cadence) -> Bool {
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

        public let date: Date

        public let cadence: TimelineView<Schedule, Content>.Context.Cadence
    }
}

@available(*, unavailable)
extension TimelineView : Sendable {
}

@available(*, unavailable)
extension TimelineView.Context : Sendable {
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public typealias TimelineViewDefaultContext = TimelineView<EveryMinuteTimelineSchedule, Never>.Context

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension TimelineView : View where Content : View {
    public var body: Never {
        assertUnimplemented()
    }

    public typealias Body = Never

    @_alwaysEmitIntoClient nonisolated public init(_ schedule: Schedule, @ViewBuilder content: @escaping (TimelineViewDefaultContext) -> Content) {
        self.init(schedule) { (context: Context) -> Content in

            content(unsafeBitCast(
                context,
                to: TimelineViewDefaultContext.self))
        }
    }

    @available(iOS, deprecated, introduced: 15.0, message: "Use TimelineViewDefaultContext for the type of the context parameter passed into TimelineView's content closure to resolve this warning. The new version of this initializer, using TimelineViewDefaultContext, improves compilation performance by using an independent generic type signature, which helps avoid unintended cyclical type dependencies.")
    @available(macOS, deprecated, introduced: 12.0, message: "Use TimelineViewDefaultContext for the type of the context parameter passed into TimelineView's content closure to resolve this warning. The new version of this initializer, using TimelineViewDefaultContext, improves compilation performance by using an independent generic type signature, which helps avoid unintended cyclical type dependencies.")
    @available(watchOS, deprecated, introduced: 8.0, message: "Use TimelineViewDefaultContext for the type of the context parameter passed into TimelineView's content closure to resolve this warning. The new version of this initializer, using TimelineViewDefaultContext, improves compilation performance by using an independent generic type signature, which helps avoid unintended cyclical type dependencies.")
    @available(tvOS, deprecated, introduced: 15.0, message: "Use TimelineViewDefaultContext for the type of the context parameter passed into TimelineView's content closure to resolve this warning. The new version of this initializer, using TimelineViewDefaultContext, improves compilation performance by using an independent generic type signature, which helps avoid unintended cyclical type dependencies.")
    @available(visionOS, deprecated, introduced: 1.0, message: "Use TimelineViewDefaultContext for the type of the context parameter passed into TimelineView's content closure to resolve this warning. The new version of this initializer, using TimelineViewDefaultContext, improves compilation performance by using an independent generic type signature, which helps avoid unintended cyclical type dependencies.")
    @_disfavoredOverload nonisolated public init(_ schedule: Schedule, @ViewBuilder content: @escaping (TimelineView<Schedule, Content>.Context) -> Content) {
        assertUnimplemented()
    }

    nonisolated public static func _makeView(view: _GraphValue<TimelineView<Schedule, Content>>, inputs: _ViewInputs) -> _ViewOutputs {
        assertUnimplemented()
    }
}

extension TimelineView.Context.Cadence : Hashable {}
