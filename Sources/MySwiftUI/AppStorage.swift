// F2BB00CEA25D2617C18DE8984EB64B53
public import Foundation
@_spi(Internal) public import MySwiftUICore
internal import AttributeGraph
private import Combine

@frozen @propertyWrapper public struct AppStorage<Value>: DynamicProperty {
    @usableFromInline
    internal var location: UserDefaultLocation<Value>
    
    public var wrappedValue: Value {
        get {
            fatalError("TODO")
        }
        nonmutating set {
            fatalError("TODO")
        }
    }
    
    public var projectedValue: Binding<Value> {
        fatalError("TODO")
    }
    
    public static func _makeProperty<V>(in buffer: inout _DynamicPropertyBuffer, container: _GraphValue<V>, fieldOffset: Int, inputs: inout _GraphInputs) {
        fatalError("TODO")
    }
    
    init(key: String, transform: any UserDefaultsValueTransform.Type, store: UserDefaults?, defaultValue: Value) {
        // $s7SwiftUI10AppStorageV3key9transform5store12defaultValueACyxGSS_AA012UserDefaultsI9Transform_pXpSo06NSUserK0CSgxtcfCTf4nnngn_n
        location = UserDefaultLocation(
            key: key,
            transform: transform,
            store: store,
            defaultValue: defaultValue,
            base: nil
        )
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension AppStorage: Sendable where Value : Sendable {
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension AppStorage {
    public init(wrappedValue: Value, _ key: String, store: UserDefaults? = nil) where Value == Bool {
        self.init(key: key, transform: BoolTransform.self, store: store, defaultValue: wrappedValue)
    }
    
    public init(wrappedValue: Value, _ key: String, store: UserDefaults? = nil) where Value == Int {
        self.init(key: key, transform: StringTransform.self, store: store, defaultValue: wrappedValue)
    }
    
    public init(wrappedValue: Value, _ key: String, store: UserDefaults? = nil) where Value == Double {
        self.init(key: key, transform: DoubleTransform.self, store: store, defaultValue: wrappedValue)
    }
    
    public init(wrappedValue: Value, _ key: String, store: UserDefaults? = nil) where Value == String {
        self.init(key: key, transform: StringTransform.self, store: store, defaultValue: wrappedValue)
    }
    
    public init(wrappedValue: Value, _ key: String, store: UserDefaults? = nil) where Value == URL {
        self.init(key: key, transform: URLTransform.self, store: store, defaultValue: wrappedValue)
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    public init(wrappedValue: Value, _ key: String, store: UserDefaults? = nil) where Value == Date {
        self.init(key: key, transform: PropertyListTransform.self, store: store, defaultValue: wrappedValue)
    }
    
    public init(wrappedValue: Value, _ key: String, store: UserDefaults? = nil) where Value == Data {
        self.init(key: key, transform: PropertyListTransform.self, store: store, defaultValue: wrappedValue)
    }
    
    public init(wrappedValue: Value, _ key: String, store: UserDefaults? = nil) where Value : RawRepresentable, Value.RawValue == Int {
        self.init(key: key, transform: IntegerTransform.self, store: store, defaultValue: wrappedValue)
    }
    
    public init(wrappedValue: Value, _ key: String, store: UserDefaults? = nil) where Value : RawRepresentable, Value.RawValue == String {
        self.init(key: key, transform: StringTransform.self, store: store, defaultValue: wrappedValue)
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension AppStorage where Value : ExpressibleByNilLiteral {
    public init(_ key: String, store: UserDefaults? = nil) where Value == Bool? {
        fatalError("TODO")
    }
    
    public init(_ key: String, store: UserDefaults? = nil) where Value == Int? {
        fatalError("TODO")
    }
    
    public init(_ key: String, store: UserDefaults? = nil) where Value == Double? {
        fatalError("TODO")
    }
    
    public init(_ key: String, store: UserDefaults? = nil) where Value == String? {
        fatalError("TODO")
    }
    
    public init(_ key: String, store: UserDefaults? = nil) where Value == URL? {
        fatalError("TODO")
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    public init(_ key: String, store: UserDefaults? = nil) where Value == Date? {
        fatalError("TODO")
    }
    
    public init(_ key: String, store: UserDefaults? = nil) where Value == Data? {
        fatalError("TODO")
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension AppStorage {
    public init<R>(_ key: String, store: UserDefaults? = nil) where Value == R?, R : RawRepresentable, R.RawValue == String {
        fatalError("TODO")
    }
    
    public init<R>(_ key: String, store: UserDefaults? = nil) where Value == R?, R : RawRepresentable, R.RawValue == Int {
        fatalError("TODO")
    }
}

//@available(iOS 17.0, macOS 14.0, *)
//@available(tvOS, unavailable)
//@available(watchOS, unavailable)
//extension AppStorage {
//    public init<RowValue>(wrappedValue: Value = TableColumnCustomization<RowValue>(), _ key: String, store: UserDefaults? = nil) where Value == TableColumnCustomization<RowValue>, RowValue : Identifiable {
//        fatalError("TODO")
//    }
//}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension View {
    public nonisolated func defaultAppStorage(_ store: UserDefaults) -> some View {
        fatalError("TODO")
    }
}

@usableFromInline
class UserDefaultLocation<Value>: @unchecked Sendable {
    init(key: String, transform: UserDefaultsValueTransform.Type, store: UserDefaults?, defaultValue: Value, base: UserDefaultLocation<Value>?) {
        // in이라는 함수 있는듯
        fatalError("TODO")
    }
    
    final var canonicalLocation: UserDefaultLocation<Value> {
        fatalError("TODO")
    }
    
    private let key: String
    private let transform: any UserDefaultsValueTransform.Type
    private let defaultValue: Value
    private let customStore: UserDefaults?
    private let base: UserDefaultLocation<Value>?
    
    private var observableObjectPublisher: ObservableObjectPublisher? {
        didSet {
            fatalError("TODO")
        }
    }
    
    fileprivate final var cachedValue: Value?
    fileprivate final var defaultStore: UserDefaults
    fileprivate final var observer: UserDefaultObserver?
    
    @usableFromInline
    internal var wasRead: Bool
    
    final var changeSignal: WeakAttribute<Void>?
    
    final var store: UserDefaults {
        fatalError("TODO")
    }
    
    final func copy() -> UserDefaultLocation<Value> {
        fatalError("TODO")
    }
    
    @usableFromInline
    internal func get() -> Value {
        fatalError("TODO")
    }
    
    @usableFromInline
    internal func set(_ value: Value, transaction: Transaction) {
        fatalError("TODO")
    }
    
    @usableFromInline
    internal func update() -> (Value, Bool) {
        fatalError("TODO")
    }
    
    @usableFromInline
    internal static func == (lhs: UserDefaultLocation<Value>, rhs: UserDefaultLocation<Value>) -> Bool {
        fatalError("TODO")
    }
}

protocol UserDefaultsValueTransform {
    static func readValue(from: UserDefaults, key: String) -> Any?
    static func writeValue(_ newValue: Any?, to: UserDefaults, key: String)
}

fileprivate protocol ScalarUserDefaultsValueTransform: UserDefaultsValueTransform {
    associatedtype Scalar
}

fileprivate struct JSONCodableTransform: UserDefaultsValueTransform {
    static func readValue(from: UserDefaults, key: String) -> Any? {
        fatalError("TODO")
    }
    
    static func writeValue(_ newValue: Any?, to: UserDefaults, key: String) {
        fatalError("TODO")
    }
}

fileprivate struct RawRepresentableTransform: UserDefaultsValueTransform {
    static func readValue(from: UserDefaults, key: String) -> Any? {
        fatalError("TODO")
    }
    
    static func writeValue(_ newValue: Any?, to: UserDefaults, key: String) {
        fatalError("TODO")
    }
}

fileprivate struct PropertyListTransform: UserDefaultsValueTransform {
    static func readValue(from: UserDefaults, key: String) -> Any? {
        fatalError("TODO")
    }
    
    static func writeValue(_ newValue: Any?, to: UserDefaults, key: String) {
        fatalError("TODO")
    }
}

fileprivate struct URLTransform: UserDefaultsValueTransform {
    static func readValue(from: UserDefaults, key: String) -> Any? {
        fatalError("TODO")
    }
    
    static func writeValue(_ newValue: Any?, to: UserDefaults, key: String) {
        fatalError("TODO")
    }
}

fileprivate struct StringTransform: UserDefaultsValueTransform {
    static func readValue(from: UserDefaults, key: String) -> Any? {
        fatalError("TODO")
    }
    
    static func writeValue(_ newValue: Any?, to: UserDefaults, key: String) {
        fatalError("TODO")
    }
}

fileprivate struct DoubleTransform: ScalarUserDefaultsValueTransform {
    typealias Scalar = Double
    
    static func readValue(from: UserDefaults, key: String) -> Any? {
        fatalError("TODO")
    }
    
    static func writeValue(_ newValue: Any?, to: UserDefaults, key: String) {
        fatalError("TODO")
    }
}

fileprivate struct IntegerTransform: ScalarUserDefaultsValueTransform {
    typealias Scalar = Int
    
    static func readValue(from: UserDefaults, key: String) -> Any? {
        fatalError("TODO")
    }
    
    static func writeValue(_ newValue: Any?, to: UserDefaults, key: String) {
        fatalError("TODO")
    }
}

fileprivate struct BoolTransform: ScalarUserDefaultsValueTransform {
    typealias Scalar = Bool
    
    static func readValue(from: UserDefaults, key: String) -> Any? {
        fatalError("TODO")
    }
    
    static func writeValue(_ newValue: Any?, to: UserDefaults, key: String) {
        fatalError("TODO")
    }
}

fileprivate struct DefaultAppStorageDefaultsKey: EnvironmentKey {
    static var defaultValue: UserDefaults {
        return .standard
    }
}

fileprivate final class UserDefaultObserver: NSObject {
    private var state: UserDefaultObserver.State
    private var target: UserDefaultObserver.Target
    
    @inline(__always)
    init(state: UserDefaultObserver.State, target: UserDefaultObserver.Target) {
        self.state = state
        self.target = target
        super.init()
    }
    
    deinit {
        fatalError("TODO")
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        fatalError("TODO")
    }
    
    @objc func userDefaultsDidChange(_ notification: Notification) {
        fatalError("TODO")
    }
    
    func observeDefaults(_ store: UserDefaults, key: String) {
        fatalError("TODO")
    }
    
    func unobserve(oldDefaults: UserDefaults, key: String) {
        fatalError("TODO")
    }
}

extension UserDefaultObserver {
    enum Target {
        case graph(UserDefaultObserver.Target.GraphAttribute)
        case publisher(ObservableObjectPublisher)
        
        func send() {
            fatalError("TODO")
        }
    }
    
    enum State {
        case subscribed(userDefaults: UserDefaults, key: String)
        case uninitialized
    }
}

extension UserDefaultObserver.Target {
    struct GraphAttribute {
        private weak var host: GraphHost?
        private let signal: WeakAttribute<Void>
    }
}

fileprivate struct UserDefaultPropertyBox<Value>: DynamicPropertyBox {
    @Attribute private var environment: EnvironmentValues
    private let observer: UserDefaultObserver
    private var firstUpdate: Bool
    
    func update(property: inout AppStorage<Value>, phase: _GraphInputs.Phase) -> Bool {
        fatalError("TODO")
    }
    
    func destroy() {
        fatalError("TODO")
    }
}
