@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
public protocol EntityAction {
    associatedtype EventParameterType = Never
    var isReversible: Bool { get }
    var isAdditive: Bool { get }
    var animatedValueType: (any AnimatableData.Type)? { get }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension EntityAction {
    public var isReversible: Bool {
        get {
            assertUnimplemented()
        }
    }
    
    public var isAdditive: Bool {
        get {
            assertUnimplemented()
        }
    }
    
    public static func registerAction() {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor public static func subscribe(to eventType: ActionEventType, _ handler: @escaping @MainActor (ActionEvent<Self>) -> Void) {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor public static func unsubscribe(from eventType: ActionEventType) {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor public static func unsubscribeAll() {
        assertUnimplemented()
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension EntityAction where Self : Decodable, Self : Encodable, Self.EventParameterType : Decodable, Self.EventParameterType : Encodable {
    public static func registerAction() {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor public static func subscribe(to eventType: ActionEventType, _ handler: @escaping @MainActor (ActionEvent<Self>) -> Void) {
        assertUnimplemented()
    }
}
