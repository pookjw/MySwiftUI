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
    
    private var schedule: Schedule // 0x0
    private var content: (TimelineView<PeriodicTimelineSchedule, Never>.Context) -> Content // 0x2c (offset field)
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
        self.schedule = schedule
        self.content = { context in
            // $s7SwiftUI12TimelineViewVA2A0D0R_rlE_7contentACyxq_Gx_q_AC7ContextVyxq__Gctcfcq_AHyAA08PeriodicC8ScheduleVs5NeverO_GcfU_TA
            let cadence: TimelineView<Schedule, Content>.Context.Cadence
            switch context.cadence {
            case .live:
                cadence = .live
            case .seconds:
                cadence = .seconds
            case .minutes:
                cadence = .minutes
            }
            
            return content(TimelineView<Schedule, Content>.Context(date: context.date, cadence: cadence))
        }
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
        
        mutating func updateValue() {
            // self -> x20 -> x25
            // <+1792>
            let d12 = self.currentTime
            // x23
            let resetSeed = self.phase.resetSeed
            var d9 = d12
            
            if resetSeed != self.resetSeed {
                // <+1948>
                self.resetSeed = self.phase.resetSeed
                self.iterator = nil
                self.currentTime = -.infinity
                self.nextTime = .infinity
                d9 = -.infinity
            }
            
            // <+2144>
            // x23
            let schedule = self.$schedule.changedValue(options: [])
            // x29 - 0x1b8
            let (_, viewChanged) = self.$view.changedValue(options: [])
            
            let referenceDate: (value: Date?, changed: Bool)
            if let attribute = self.$referenceDate {
                referenceDate = attribute.changedValue(options: [])
            } else {
                referenceDate = (nil, false)
            }
            
            let date = referenceDate.value ?? Date()
            var d8 = date.timeIntervalSinceReferenceDate
            
            if
                !schedule.changed,
                self.iterator != nil,
                !referenceDate.changed
            {
                // <+3968>
                // <+4152>
            } else {
                // <+3000>
                // x29 - 0xe8
                let mode = TimelineScheduleMode.normal
                self.nextTime = .infinity
                
                if referenceDate.value == nil {
                    // <+3612>
                    let view = self.view
                    let entries = view.schedule.entries(from: date, mode: mode)
                    self.iterator = entries.makeIterator()
                    
                    // <+3980>
                    if let next = self.iterator?.next() {
                        // <+5464>
                        d9 = next.timeIntervalSinceReferenceDate
                        self.currentTime = d9
                        
                        // <+5524>
                        if let next = self.iterator?.next() {
                            let d10 = next.timeIntervalSinceReferenceDate
                            self.nextTime = d10
                            // <+4144>
                        } else {
                            // <+4144>
                        }
                    } else {
                        // <+4076>
                        // <+4112>
                    }
                } else {
                    // <+3372>
                    self.currentTime = d8
                    d9 = d8
                    // <+4152>
                }
                
                // <+4152>
            }
            
            // <+4152>
            var d11 = self.nextTime
            var d10: Double
            
            if !(d11 <= d8) {
                // <+4456>
            } else {
                // <+4172>
                d10 = d11
                
                while let next = self.iterator?.next() {
                    self.currentTime = d10
                    
                    d11 = next.timeIntervalSinceReferenceDate
                    self.nextTime = d11
                    d9 = d10
                    
                    if !(d8 < d11) {
                        // <+4212>
                        d10 = d11
                    } else {
                        // <+4460>
                        break
                    }
                }
                
                // <+4456>
            }
            
            // <+4456>
            d10 = d9
            
            if d10.isFinite {
                // <+4492>
            } else {
                self.currentTime = d8
                d10 = d8
            }
            
            // <+4492>
            if viewChanged || (d10 != d12) || Graph.currentAttributeWasModified || !self.hasValue {
                // <+4540>
                let context = TimelineView<PeriodicTimelineSchedule, Never>.Context(
                    date: Date(timeIntervalSinceReferenceDate: d10),
                    cadence: .live
                )
                
                let content: Content = self.withObservation {
                    // $s7SwiftUI12TimelineViewVA2A0D0R_rlE12UpdateFilter33_A009558074DBEAE1A969E3C6E8DD1422LLV11updateValueyyFq_yXEfU_TA
                    return self.$view.syncMainIfReferences { view in
                        // $s7SwiftUI12TimelineViewVA2A0D0R_rlE12UpdateFilter33_A009558074DBEAE1A969E3C6E8DD1422LLV11updateValueyyFq_yXEfU_q_ACyxq_GXEfU_TA
                        return view.content(context)
                    }
                }
                
                self.value = content
            }
            
            // <+5016>
            var d0 = self.nextTime
            let d1 = Double.infinity
            
            if (d0 == d1) || d0.isNaN || d1.isNaN {
                // <+5296>
            } else {
                // <+5044>
                d8 = d0 - d8
                let graph = ViewGraph.current
                let time_1 = self.time
                d0 = time_1.seconds
                d0 = d8 + d0
                let time_2 = Time(seconds: d0)
                graph.nextUpdate.views.at(time_2)
                // <+5296>
            }
            
            // <+5296>
        }
    }
}
