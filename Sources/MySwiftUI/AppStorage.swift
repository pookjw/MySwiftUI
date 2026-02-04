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
            return location.getValue(forReading: true)
        }
        nonmutating set {
            location.canonicalLocation.set(newValue, transaction: Transaction())
        }
    }
    
    public var projectedValue: Binding<Value> {
        fatalError("TODO")
    }
    
    public static func _makeProperty<V>(in buffer: inout _DynamicPropertyBuffer, container: _GraphValue<V>, fieldOffset: Int, inputs: inout _GraphInputs) {
        /*
         buffer -> x0 -> sp
         fieldOffset -> x1 -> x2
         inputs -> x3 -> x2 -> x27
         */
        let signal = Attribute<Void>(value: ())
        let host = GraphHost.currentHost
        let envrionment = inputs.environment
        let weakSignal = WeakAttribute<Void>(signal)
        let box = UserDefaultPropertyBox<Value>(host: host, environment: envrionment, signal: weakSignal)
        
        buffer.append(box, fieldOffset: fieldOffset)
        addTreeValue(signal, as: Value.self, at: fieldOffset, in: V.self, flags: .appStorageSignal)
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
    init(key: String, transform: any UserDefaultsValueTransform.Type, store: UserDefaults?, defaultValue: Value, base: UserDefaultLocation<Value>?) {
        // <+208>
        self.customStore = store
        self.key = key
        self.transform = transform
        self.defaultValue = defaultValue
        self.base = base
    }
    
    final var canonicalLocation: UserDefaultLocation<Value> {
        return base ?? self
    }
    
    fileprivate let key: String
    private let transform: any UserDefaultsValueTransform.Type
    private let defaultValue: Value
    private let customStore: UserDefaults? // 0x70
    private let base: UserDefaultLocation<Value>?
    
    // 0x80
    private var observableObjectPublisher: ObservableObjectPublisher? = nil {
        didSet {
            fatalError("TODO")
        }
    }
    
    fileprivate final var cachedValue: Value? = nil // 0x88
    fileprivate final var defaultStore: UserDefaults = .standard // 0x90
    fileprivate final var observer: UserDefaultObserver? = nil // 0x98
    
    @usableFromInline
    internal var wasRead: Bool = false // 0xa0
    
    final var changeSignal: WeakAttribute<Void>? = nil // 0xa8
    
    final var store: UserDefaults {
        return customStore ?? defaultStore
    }
    
    final func copy() -> UserDefaultLocation<Value> {
        fatalError("TODO")
    }
    
    final func getValue(forReading: Bool) -> Value {
        /*
         self -> x19
         forReading -> x27
         return pointer -> x28
         */
        if GraphHost.isUpdating && forReading {
            wasRead = true
        }
        
        // <+232>
        let result: Value
        if let cachedValue {
            // <+424>
            result = cachedValue
            // <+548>
        } else {
            // <+276>
            result = (transform.readValue(from: store, key: key) as? Value) ?? defaultValue
            // <+508>
        }
        
        if changeSignal != nil {
            cachedValue = result
        }
        
        return result
    }
    
    @usableFromInline
    internal func get() -> Value {
        fatalError("TODO")
    }
    
    @usableFromInline
    internal func set(_ value: Value, transaction: Transaction) {
        if let observableObjectPublisher {
            observableObjectPublisher.send()
        }
        
        withTransaction(transaction.current) { [self, value] in
            // $s7SwiftUI19UserDefaultLocationC3set_11transactionyx_AA11TransactionVtFyyXEfU_TA
            /*
             self -> x20
             value -> x22
             */
            // x24
            let copy_1 = value
            self.cachedValue = copy_1
            // sp + 0x10
            let copy_2 = value
            // x22
            let store = self.store
            self.transform.writeValue(copy_2, to: store, key: self.key)
        }
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
    static func readValue(from store: UserDefaults, key: String) -> Any?
    static func writeValue(_ newValue: Any?, to store: UserDefaults, key: String)
}

fileprivate protocol ScalarUserDefaultsValueTransform: UserDefaultsValueTransform {
    associatedtype Scalar
}

extension ScalarUserDefaultsValueTransform {
    static func readValue(from store: UserDefaults, key: String) -> Any? {
        guard store.object(forKey: key) != nil else {
            return nil
        }
        
        if Scalar.self == Bool.self {
            return store.bool(forKey: key)
        } else if Scalar.self == Double.self {
            return store.double(forKey: key)
        } else if Scalar.self == Int.self {
            return store.integer(forKey: key)
        } else {
            return nil
        }
    }
    
    static func writeValue(_ newValue: Any?, to store: UserDefaults, key: String) {
        guard let casted = newValue as? Scalar else {
            store.removeObject(forKey: key)
            return
        }
        
        store.set(casted, forKey: key)
    }
}

fileprivate struct JSONCodableTransform: UserDefaultsValueTransform {
    static func readValue(from store: UserDefaults, key: String) -> Any? {
        fatalError("TODO")
    }
    
    static func writeValue(_ newValue: Any?, to store: UserDefaults, key: String) {
        fatalError("TODO")
    }
}

fileprivate struct RawRepresentableTransform: UserDefaultsValueTransform {
    static func readValue(from store: UserDefaults, key: String) -> Any? {
        fatalError("TODO")
    }
    
    static func writeValue(_ newValue: Any?, to store: UserDefaults, key: String) {
        fatalError("TODO")
    }
}

fileprivate struct PropertyListTransform: UserDefaultsValueTransform {
    static func readValue(from store: UserDefaults, key: String) -> Any? {
        fatalError("TODO")
    }
    
    static func writeValue(_ newValue: Any?, to store: UserDefaults, key: String) {
        fatalError("TODO")
    }
}

fileprivate struct URLTransform: UserDefaultsValueTransform {
    static func readValue(from store: UserDefaults, key: String) -> Any? {
        fatalError("TODO")
    }
    
    static func writeValue(_ newValue: Any?, to store: UserDefaults, key: String) {
        fatalError("TODO")
    }
}

fileprivate struct StringTransform: UserDefaultsValueTransform {
    static func readValue(from store: UserDefaults, key: String) -> Any? {
        fatalError("TODO")
    }
    
    static func writeValue(_ newValue: Any?, to store: UserDefaults, key: String) {
        fatalError("TODO")
    }
}

fileprivate struct DoubleTransform: ScalarUserDefaultsValueTransform {
    typealias Scalar = Double
}

fileprivate struct IntegerTransform: ScalarUserDefaultsValueTransform {
    typealias Scalar = Int
}

fileprivate struct BoolTransform: ScalarUserDefaultsValueTransform {
    typealias Scalar = Bool
}

extension EnvironmentValues {
    var defaultAppStorageDefaults: UserDefaults {
        get {
            return self[DefaultAppStorageDefaultsKey.self]
        }
        set {
            self[DefaultAppStorageDefaultsKey.self]
        }
    }
}

fileprivate struct DefaultAppStorageDefaultsKey: EnvironmentKey {
    static var defaultValue: UserDefaults {
        return .standard
    }
}

fileprivate final class UserDefaultObserver: NSObject {
    fileprivate static nonisolated(unsafe) var observationContext: Int = 0
    fileprivate private(set) var state: UserDefaultObserver.State
    fileprivate private(set) var target: UserDefaultObserver.Target
    
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
        // $s7SwiftUI19UserDefaultObserver33_F2BB00CEA25D2617C18DE8984EB64B53LLC12observeValue10forKeyPath2of6change7contextySSSg_ypSgSDySo05NSKeyo6ChangeQ0aypGSgSvSgtFTf4nndnn_n
        /*
         self -> x20
         keyPath -> x22/x20
         change -> x26
         context -> x23
         */
        let owned = withUnsafeMutablePointer(to: &UserDefaultObserver.observationContext) {
            return context == UnsafeMutableRawPointer($0)
        }
        
        guard owned else {
            return
        }
        
        // x23, x25, x28
        guard case .subscribed(let userDefaults, let key) = state else {
            return
        }
        
        // <+160>
        fatalError("TODO")
    }
    
    @objc func userDefaultsDidChange(_ notification: Notification) {
        fatalError("TODO")
    }
    
    func observeDefaults(_ store: UserDefaults, key: String) {
        /*
         self -> x23
         store -> x21
         key -> x22
         */
        switch state {
        case .subscribed(let userDefaults, let _key):
            // <+140>
            /*
             userDefaults -> x25
             _key -> x27/x26
             */
            guard store != userDefaults && key != _key else {
                return
            }
            
            // <+268>
            unobserve(oldDefaults: userDefaults, key: _key)
            noteDefaultChange()
            // <+432>
        case .uninitialized:
            // <+432>
            break
        }
        
        // <+432>
        // key -> sp + 0x20
        if key.contains(".") {
            // <+488>
            NotificationCenter
                .default
                .addObserver(
                    self,
                    selector: #selector(userDefaultsDidChange(_:)),
                    name: UserDefaults.didChangeNotification,
                    object: store
                )
        } else {
            // <+564>
            store
                .addObserver(
                    self,
                    forKeyPath: key,
                    options: [],
                    context: &UserDefaultObserver.observationContext
                )
        }
        
        // <+620>
        self.state = .subscribed(userDefaults: store, key: key)
    }
    
    func unobserve(oldDefaults: UserDefaults, key: String) {
        fatalError("TODO")
    }
    
    func noteDefaultChange() {
        Update.enqueueAction(reason: nil) { 
            // $s7SwiftUI19UserDefaultObserver33_F2BB00CEA25D2617C18DE8984EB64B53LLC04noteD6ChangeyyFyycfU_
            fatalError("TODO")
        }
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
        private(set) weak var host: GraphHost?
        let signal: WeakAttribute<Void>
    }
}

fileprivate struct UserDefaultPropertyBox<Value>: DynamicPropertyBox {
    @Attribute private var environment: EnvironmentValues
    private let observer: UserDefaultObserver
    private var firstUpdate: Bool
    
    init(host: GraphHost, environment: Attribute<EnvironmentValues>, signal: WeakAttribute<Void>) {
        // x23
        let observer = UserDefaultObserver(
            state: .uninitialized,
            target: .graph(
                UserDefaultObserver
                    .Target
                    .GraphAttribute(host: host, signal: signal)
            )
        )
        
        self._environment = environment
        self.observer = observer
        self.firstUpdate = true
    }
    
    mutating func update(property: inout AppStorage<Value>, phase: _GraphInputs.Phase) -> Bool {
        /*
         self -> x25
         property -> x19 -> sp + 0x20
         */
        // x26
        let location = property.location
        // x19
        let canonicalLocation = location.canonicalLocation
        // x24
        let observer = observer
        // sp + 0x2c
        let firstUpdate = firstUpdate
        
        let store = environment.defaultAppStorageDefaults
        canonicalLocation.defaultStore = store
        
        observer.observeDefaults(canonicalLocation.defaultStore, key: canonicalLocation.key)
        
        // <+348>
        // sp + 0x58
        var copy_1 = observer.target
        var w28: Bool
        switch copy_1 {
        case .graph(let attribute):
            // <+416>
            let signal = attribute.signal
            let changed = signal.changedValue(options: [])
            
            w28 = false
            
            guard let changed, changed.changed else {
                // <+560>
                break
            }
            
            // <+472>
            if firstUpdate {
                self.firstUpdate = false
            } else {
                let copy = canonicalLocation.copy()
                property.location = copy
            }
            
            // <+516>
            w28 = true
            canonicalLocation.cachedValue = nil
            // <+560>
        case .publisher(_):
            // <+560>
            w28 = false
            break
        }
        
        // <+560>
        copy_1 = observer.target
        switch copy_1 {
        case .graph(let attribute):
            // <+596>
            // sp + 0x48
            let copy_2 = attribute
            canonicalLocation.changeSignal = copy_2.signal
        case .publisher(_):
            // <+580>
            canonicalLocation.changeSignal = nil
        }
        
        // <+640>
        if w28 {
            return canonicalLocation.wasRead
        } else {
            // <+680>
            return false
        }
    }
    
    func reset() {
        fatalError("TODO")
    }
    
    func destroy() {
        fatalError("TODO")
    }
}
