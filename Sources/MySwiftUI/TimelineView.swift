// A009558074DBEAE1A969E3C6E8DD1422
public import Foundation
@_spi(Internal) public import MySwiftUICore
private import AttributeGraph

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
    
    private var schedule: Schedule
    private var content: (TimelineView<PeriodicTimelineSchedule, Never>.Context) -> Content
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
        // <+384>
        let filter = TimelineView.UpdateFilter(
            view: view.value,
            schedule: view.value[offset: { .of(&$0.schedule)} ],
            phase: inputs.viewPhase,
            time: inputs.time,
            referenceDate: inputs[ReferenceDateInput.self],
            resetSeed: 0, 
            currentTime: -.infinity,
            nextTime: .infinity,
            cadence: .live
        )
        
        let viewValue = _GraphValue(filter)
        return Content.makeDebuggableView(view: viewValue, inputs: inputs)
    }
}

extension TimelineView : PrimitiveView, UnaryView where Content : View {}

extension TimelineView.Context.Cadence : Hashable {}

extension TimelineView where Content : View {
    fileprivate struct UpdateFilter : AsyncAttribute, StatefulRule {
        @Attribute private var view: TimelineView<Schedule, Content> // 0x0
        @Attribute private var schedule: Schedule // 0x4
        @Attribute private var phase: _GraphInputs.Phase // 0x8
        @Attribute private var time: Time // 0xc
        @WeakAttribute private var referenceDate: Date?? // 0x10
        private var resetSeed: UInt32 // 0x18
        private var iterator: Schedule.Entries.Iterator? // 0x48 (offset field)
        private var currentTime: Double // 0x4c (offset field)
        private var nextTime: Double // 0x50 (offset field)
        private var cadence: TimelineView<Schedule, Content>.Context.Cadence // 0x54 (offset field)
        
        init(
            view: Attribute<TimelineView<Schedule, Content>>,
            schedule: Attribute<Schedule>,
            phase: Attribute<_GraphInputs.Phase>,
            time: Attribute<Time>,
            referenceDate: WeakAttribute<Date?>,
            resetSeed: UInt32,
            iterator: Schedule.Entries.Iterator? = nil,
            currentTime: Double,
            nextTime: Double,
            cadence: TimelineView<Schedule, Content>.Context.Cadence
        ) {
            self._view = view
            self._schedule = schedule
            self._phase = phase
            self._time = time
            self._referenceDate = referenceDate
            self.resetSeed = resetSeed
            self.iterator = iterator
            self.currentTime = currentTime
            self.nextTime = nextTime
            self.cadence = cadence
        }
        
        typealias Value = Content
        
        func updateValue() {
            assertUnimplemented()
        }
    }
}
