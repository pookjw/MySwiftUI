// 7719FABF28E05207C06C2817640AD611
public import Combine
public import Observation
private import os.log
private import _DarwinFoundation3.pthread

@dynamicMemberLookup @propertyWrapper public struct Bindable<Value> {
    public var wrappedValue: Value
    
    public var projectedValue: Bindable<Value> {
        return self
    }
    
    @available(*, unavailable, message: "The wrapped value must be an object that conforms to Observable")
    public init(wrappedValue: Value) {
        preconditionFailure()
    }
    
    @available(*, unavailable, message: "The wrapped value must be an object that conforms to Observable")
    public init(projectedValue: Bindable<Value>) {
        preconditionFailure()
    }
}

extension Bindable where Value : AnyObject {
    public subscript<Subject>(dynamicMember keyPath: ReferenceWritableKeyPath<Value, Subject>) -> Binding<Subject> {
        return Binding(self.wrappedValue, keyPath: keyPath, isolation: nil)
    }
}

extension Bindable where Value : ObservableObject {
    @available(*, unavailable, message: "@Bindable only works with Observable types. For ObservableObject types, use @ObservedObject instead.")
    public init(wrappedValue: Value) {
        preconditionFailure()
    }
}

extension Bindable where Value : AnyObject, Value : Observable {
    public init(wrappedValue: Value) {
        self.wrappedValue = wrappedValue
    }
    
    public init(_ wrappedValue: Value) {
        self.init(wrappedValue: wrappedValue)
    }
    
    public init(projectedValue: Bindable<Value>) {
        self.wrappedValue = projectedValue.wrappedValue
    }
}

extension Bindable : Identifiable where Value : Identifiable {
    public var id: Value.ID {
        return self.wrappedValue.id
    }
    
    public typealias ID = Value.ID
}

extension Bindable : Sendable where Value : Sendable {
}

extension Binding {
    init<Subject : AnyObject>(_ base: Subject, keyPath: ReferenceWritableKeyPath<Subject, Value>, isolation: Actor?) {
        /*
         value -> x0 -> x19
         keyPath -> x1 -> x21
         isolation -> x2/x3 -> x22/x20
         return pointer -> x8 -> x23
         */
        let location = ObjectLocation<Subject, Value>(base: base, keyPath: keyPath, isolation: isolation)
        let value = location.get()
        let locationBox = LocationBox(location: location)
        self.init(value: value, location: locationBox)
    }
}

fileprivate struct ObjectLocation<T : AnyObject, U> : Equatable, Location {
    private(set) var base: T
    private(set) var keyPath: ReferenceWritableKeyPath<T, U>
    private(set) var isolation: Actor?
    
    func get() -> U {
        checkIsolation()
        return base[keyPath: keyPath]
    }
    
    func checkIsolation() {
        let mainActor = MainActor.shared
        
        guard
            let isolation,
            isolation === mainActor,
            pthread_main_np() == 0
        else {
            return
        }
        
        unsafe os_log(.fault, log: .runtimeIssuesLog, "\(String(describing: self.keyPath)) is isolated to the main actor. Accessing it via Binding from a different actor will cause undefined behaviors, and potential data races; This warning will become a runtime crash in a future version of SwiftUI.")
    }
    
    mutating func set(_ value: U, transaction: Transaction) {
        withTransaction(transaction.current) { 
            // $s7SwiftUI14ObjectLocation33_7719FABF28E05207C06C2817640AD611LLV3set_11transactionyq__AA11TransactionVtFyyXEfU_
            self.checkIsolation()
            base[keyPath: self.keyPath] = value
        }
    }
    
    var wasRead: Bool {
        get {
            return true
        }
        set {
            assertUnimplemented()
        }
    }
    
    static func == (lhs: ObjectLocation<T, U>, rhs: ObjectLocation<T, U>) -> Bool {
        if lhs.base === rhs.base {
            return true
        }
        
        return lhs.keyPath == rhs.keyPath
    }
}
