// 293A0AF83C78DECE53AFAAF3EDCBA9D4
public import MySwiftUICore
private import AttributeGraph

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension View {
    @usableFromInline
    @_disfavoredOverload
    nonisolated internal func task(
        priority: TaskPriority = .userInitiated,
        @_inheritActorContext _ action: @escaping @Sendable () async -> Void
    ) -> some View {
        assertUnimplemented()
    }

    @usableFromInline
    @_disfavoredOverload
    nonisolated internal func task<T>(
        id value: T,
        priority: TaskPriority = .userInitiated,
        @_inheritActorContext _ action: @escaping @Sendable () async -> Void
    ) -> some View where T : Equatable {
        assertUnimplemented()
    }

    @_alwaysEmitIntoClient
    nonisolated public func task(
        name: String? = nil,
        priority: TaskPriority = .userInitiated,
        file: String = #fileID,
        line: Int = #line,
        @_inheritActorContext _ action: sending @escaping @isolated(any) () async -> Void
    ) -> some View {
        if #available(iOS 26.4, macOS 26.4, tvOS 26.4, watchOS 26.4, visionOS 26.4, *) {
            return modifier(_TaskModifier2(
                name: name ?? "View.task @ \(file):\(line)",
                executorPreference: nil,
                priority: priority,
                action: action
            ))
        }

        return modifier(_TaskModifier(priority: priority, action: action))
    }

    @available(iOS 26.4, macOS 26.4, tvOS 26.4, watchOS 26.4, visionOS 26.4, *)
    nonisolated public func task(
        name: String? = nil,
        executorPreference taskExecutor: any TaskExecutor,
        priority: TaskPriority = .userInitiated,
        file: String = #fileID,
        line: Int = #line,
        @_inheritActorContext action: sending @escaping @isolated(any) () async -> Void
    ) -> some View {
        assertUnimplemented()
    }

    @_alwaysEmitIntoClient
    nonisolated public func task<T>(
        id: T,
        name: String? = nil,
        priority: TaskPriority = .userInitiated,
        file: String = #fileID,
        line: Int = #line,
        @_inheritActorContext _ action: sending @escaping @isolated(any) () async -> Void
    ) -> some View where T : Equatable {
        if #available(iOS 26.4, macOS 26.4, tvOS 26.4, watchOS 26.4, visionOS 26.4, *) {
            return modifier(_TaskValueModifier2(
                id: id,
                name: name ?? "View.task @ \(file):\(line)",
                executorPreference: nil,
                priority: priority,
                action: action
            ))
        }

        return modifier(
            _TaskValueModifier(
                value: id,
                priority: priority,
                action: unsafeBitCast(action, to: (@Sendable () async -> Void).self) // unsafeBitCast는 원래 없음
            )
        )
    }

    @available(iOS 26.4, macOS 26.4, tvOS 26.4, watchOS 26.4, visionOS 26.4, *)
    nonisolated public func task<T>(
        id: T,
        name: String? = nil,
        executorPreference taskExecutor: any TaskExecutor,
        priority: TaskPriority = .userInitiated,
        file: String = #fileID,
        line: Int = #line,
        @_inheritActorContext _ action: sending @escaping @isolated(any) () async -> Void
    ) -> some View where T : Equatable {
        assertUnimplemented()
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
@frozen public struct _TaskModifier : ViewModifier {
    nonisolated public var action: @Sendable () async -> Void
    public var priority: TaskPriority

    @inlinable public init(
        priority: TaskPriority,
        action: @escaping @Sendable () async -> Void
    ) {
        self.priority = priority
        self.action = action
    }

    nonisolated public static func _makeView(
        modifier: _GraphValue<_TaskModifier>,
        inputs: _ViewInputs,
        body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs
    ) -> _ViewOutputs {
        assertUnimplemented()
    }

    nonisolated public static func _makeViewList(
        modifier: _GraphValue<_TaskModifier>,
        inputs: _ViewListInputs,
        body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs
    ) -> _ViewListOutputs {
        assertUnimplemented()
    }

    nonisolated public static func _viewListCount(
        inputs: _ViewListCountInputs,
        body: (_ViewListCountInputs) -> Int?
    ) -> Int? {
        assertUnimplemented()
    }

    @available(iOS 15.0, tvOS 15.0, watchOS 8.0, macOS 12.0, *)
    public typealias Body = Never
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension _TaskModifier : Sendable {}

extension _TaskModifier : PrimitiveViewModifier {}

@available(iOS 26.4, macOS 26.4, tvOS 26.4, watchOS 26.4, visionOS 26.4, *)
public struct _TaskModifier2 : ViewModifier {
    private var action: @isolated(any) () async -> Void // 0x0
    private var priority: TaskPriority // 0x10
    private var name: String? // 0x18
    private var taskExecutor: TaskExecutor? // 0x28
    
    @usableFromInline
    internal init(
        name: String,
        executorPreference taskExecutor: (any TaskExecutor)?,
        priority: TaskPriority,
        action: sending @escaping @isolated(any) () async -> Void
    ) {
        self.name = name
        self.taskExecutor = taskExecutor
        self.priority = priority
        self.action = action
    }

    nonisolated public static func _makeView(
        modifier: _GraphValue<_TaskModifier2>,
        inputs: _ViewInputs,
        body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs
    ) -> _ViewOutputs {
        let rule = _TaskModifier2.Child(modifier: modifier.value)
        let attribute = Attribute(rule)
        let graphValue = _GraphValue(attribute)
        return _TaskModifier2.InnerModifier.makeDebuggableView(modifier: graphValue, inputs: inputs, body: body)
    }

    nonisolated public static func _makeViewList(
        modifier: _GraphValue<_TaskModifier2>,
        inputs: _ViewListInputs,
        body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs
    ) -> _ViewListOutputs {
        assertUnimplemented()
    }

    nonisolated public static func _viewListCount(
        inputs: _ViewListCountInputs,
        body: (_ViewListCountInputs) -> Int?
    ) -> Int? {
        assertUnimplemented()
    }

    @available(iOS 26.4, tvOS 26.4, watchOS 26.4, visionOS 26.4, macOS 26.4, *)
    public typealias Body = Never
}

@available(*, unavailable)
extension _TaskModifier2 : Sendable {
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
@frozen public struct _TaskValueModifier<Value> : ViewModifier where Value : Equatable {
    nonisolated public var action: @Sendable () async -> Void
    public var priority: TaskPriority
    @safe public nonisolated(unsafe) var value: Value // safe + nonisolated는 원래 없음

    @inlinable public nonisolated /* nonisolated는 원래 없음 */ init(
        value: Value,
        priority: TaskPriority,
        action: @escaping @Sendable () async -> Void
    ) {
        self.action = action
        self.priority = priority
        self.value = value
    }

    nonisolated public static func _makeView(
        modifier: _GraphValue<_TaskValueModifier<Value>>,
        inputs: _ViewInputs,
        body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs
    ) -> _ViewOutputs {
        assertUnimplemented()
    }

    nonisolated public static func _makeViewList(
        modifier: _GraphValue<_TaskValueModifier<Value>>,
        inputs: _ViewListInputs,
        body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs
    ) -> _ViewListOutputs {
        assertUnimplemented()
    }

    nonisolated public static func _viewListCount(
        inputs: _ViewListCountInputs,
        body: (_ViewListCountInputs) -> Int?
    ) -> Int? {
        assertUnimplemented()
    }

    @available(iOS 15.0, tvOS 15.0, watchOS 8.0, macOS 12.0, *)
    public typealias Body = Never
}

@available(*, unavailable)
extension _TaskValueModifier : Sendable {
}

extension _TaskValueModifier : PrimitiveViewModifier {}

@available(iOS 26.4, macOS 26.4, tvOS 26.4, watchOS 26.4, visionOS 26.4, *)
public struct _TaskValueModifier2<ID> : ViewModifier where ID : Equatable {
    private var action: @isolated(any) () async -> ()
    private var priority: TaskPriority
    private var id: ID
    private var name: String
    private var taskExecutor: TaskExecutor?
    
    @usableFromInline
    internal nonisolated /* nonisolated는 원래 없음 */ init(
        id: ID,
        name: String,
        executorPreference taskExecutor: (any TaskExecutor)?,
        priority: TaskPriority,
        action: sending @escaping @isolated(any) () async -> Void
    ) {
        assertUnimplemented()
    }

    nonisolated public static func _makeView(
        modifier: _GraphValue<_TaskValueModifier2<ID>>,
        inputs: _ViewInputs,
        body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs
    ) -> _ViewOutputs {
        let child = _TaskValueModifier2.Child(modifier: modifier.value)
        let graphValue = _GraphValue(child)
        return _TaskValueModifier2.InnerModifier.makeDebuggableView(modifier: graphValue, inputs: inputs, body: body)
    }

    nonisolated public static func _makeViewList(
        modifier: _GraphValue<_TaskValueModifier2<ID>>,
        inputs: _ViewListInputs,
        body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs
    ) -> _ViewListOutputs {
        assertUnimplemented()
    }

    nonisolated public static func _viewListCount(
        inputs: _ViewListCountInputs,
        body: (_ViewListCountInputs) -> Int?
    ) -> Int? {
        assertUnimplemented()
    }

    @available(iOS 26.4, tvOS 26.4, watchOS 26.4, visionOS 26.4, macOS 26.4, *)
    public typealias Body = Never
}

@available(*, unavailable)
extension _TaskValueModifier2 : Sendable {
}

extension _TaskValueModifier2 : PrimitiveViewModifier {}

extension _TaskModifier2 : PrimitiveViewModifier {}

extension _TaskModifier2 {
    fileprivate struct Child : Rule, AsyncAttribute {
        @Attribute private(set) var modifier: _TaskModifier2
        
        var value: _TaskModifier2.InnerModifier {
            return _TaskModifier2.InnerModifier(base: self.modifier, task: nil)
        }
    }
    
    fileprivate struct InnerModifier : ViewModifier {
        private(set) var base: _TaskModifier2
        @State private(set) var task: Task<Void, Never>?
        
        func body(content: Self.Content) -> some View {
            content
                .modifier(
                    _AppearanceActionModifier(
                        appear: {
                            // $s7SwiftUI14_TaskModifier2V13InnerModifier33_293A0AF83C78DECE53AFAAF3EDCBA9D4LLV4body7contentQrAA05_ViewF8_ContentVyAFG_tFyycfU_TA
                            guard self.task == nil else {
                                return
                            }
                            
                            // <+192>
                            let task: Task<Void, Never>
                            
                            if isLinkedOnOrAfter(.v7_4) {
                                // <+204>
                                task = Task.immediate(
                                    name: base.name,
                                    priority: base.priority,
                                    executorPreference: base.taskExecutor,
                                    operation: unsafeBitCast(base.action, to: (@Sendable @isolated(any) () async -> Void).self)
                                )
                            } else {
                                // <+424>
                                task = Task.detached(
                                    name: base.name,
                                    executorPreference: base.taskExecutor,
                                    priority: base.priority,
                                    operation: unsafeBitCast(base.action, to: (@Sendable @isolated(any) () async -> Void).self)
                                )
                            }
                            
                            self.task = task
                        },
                        disappear: {
                            // $s7SwiftUI14_TaskModifier2V13InnerModifier33_293A0AF83C78DECE53AFAAF3EDCBA9D4LLV4body7contentQrAA05_ViewF8_ContentVyAFG_tFyycfU0_TA
                            if let task {
                                task.cancel()
                                self.task = nil
                            }
                        }
                    )
                )
        }
    }
}

extension _TaskValueModifier2 {
    fileprivate struct Child : Rule, AsyncAttribute {
        @Attribute private(set) var modifier: _TaskValueModifier2<ID>
        
        var value: _TaskValueModifier2.InnerModifier {
            assertUnimplemented()
        }
    }
    
    fileprivate struct InnerModifier : ViewModifier {
        private var base: _TaskValueModifier2<ID>
        @State private var taskState: _TaskValueModifier2<ID>.InnerModifier.TaskState?
        
        func body(content: Self.Content) -> some View {
            // <+444>
            content
                .modifier(
                    _AppearanceActionModifier(
                        appear: {
                            // $s7SwiftUI19_TaskValueModifier2V13InnerModifier33_293A0AF83C78DECE53AFAAF3EDCBA9D4LLV4body7contentQrAA05_ViewG8_ContentVyAFyx_GG_tFyycfU_TA
                            assertUnimplemented()
                        },
                        disappear: {
                            // $s7SwiftUI19_TaskValueModifier2V13InnerModifier33_293A0AF83C78DECE53AFAAF3EDCBA9D4LLV4body7contentQrAA05_ViewG8_ContentVyAFyx_GG_tFyycfU0_TA
                            assertUnimplemented()
                        }
                    )
                )
                .onChange(of: base.id, initial: false) { _, _ in
                    // $s7SwiftUI19_TaskValueModifier2V13InnerModifier33_293A0AF83C78DECE53AFAAF3EDCBA9D4LLV4body7contentQrAA05_ViewG8_ContentVyAFyx_GG_tFyycfU1_TA
                    assertUnimplemented()
                }
        }
    }
}

extension _TaskValueModifier2.InnerModifier {
    struct TaskState {
        private var task: Task<Void, Never>
        private var id: ID
    }
}
