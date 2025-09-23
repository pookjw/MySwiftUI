#warning("TODO")
package import UIKit

public struct EnvironmentValues: CustomStringConvertible {
    private var _plist: PropertyList
    
    package var plist: PropertyList {
        get {
            return _plist
        }
        set {
            tracker?.invalidateAllValues(from: _plist, to: newValue)
            _plist = newValue
        }
        _modify {
            let oldValue = _plist
            yield &_plist
            tracker?.invalidateAllValues(from: oldValue, to: _plist)
        }
    }
    
    package let tracker: PropertyList.Tracker?
    
    package init() {
        if unsafe ViewGraphHost.isDefaultEnvironmentConfigured {
            let defaultEnvironment = unsafe ViewGraphHost.defaultEnvironment
            self._plist = defaultEnvironment._plist
            self.tracker = defaultEnvironment.tracker
        } else {
            self._plist = PropertyList()
            self.tracker = nil
            unsafe CoreGlue2.shared.configureEmptyEnvironment(&self)
        }
    }
    
    package init(_ plist: PropertyList) {
        self._plist = plist
        self.tracker = nil
    }
    
    public subscript<K>(key: K.Type) -> K.Value where K : EnvironmentKey {
        get {
            return getValue(for: key)
        }
        set {
            setValue(newValue, for: key)
        }
     }
    
    public var description: String {
        fatalError("TODO")
    }
    
    func getValue<K: EnvironmentKey>(for type: K.Type) -> K.Value {
        /*
         _plist = x19
         tracker = x23
         */
        if let tracker {
            return tracker.value(_plist, for: EnvironmentPropertyKey<K>.self)
        } else {
            return _plist[EnvironmentPropertyKey<K>.self]
        }
    }
    
    func setValue<K: EnvironmentKey>(_ value: K.Value, for type: K.Type) {
        fatalError("TODO")
    }
    
    package func configureForPlatform(traitCollection: UITraitCollection?) {
        fatalError("TODO")
    }
}

extension EnvironmentValues {
    package init(_: EnvironmentValues) {
        fatalError("TODO")
    }
}

public protocol EnvironmentKey {
    associatedtype Value
    static var defaultValue: Self.Value { get }
    static func _valuesEqual(_ lhs: Self.Value, _ rhs: Self.Value) -> Bool
}

extension EnvironmentKey {
    public static func _valuesEqual(_ lhs: Value, _ rhs: Value) -> Bool {
        fatalError("TODO")
    }
}

extension EnvironmentKey where Self.Value : Equatable {
  public static func _valuesEqual(_ lhs: Value, _ rhs: Value) -> Bool {
      fatalError("TODO")
  }
}

struct EnvironmentPropertyKey<T: EnvironmentKey>: PropertyKey {
    static var defaultValue: T.Value {
        return T.defaultValue
    }
    
    static func valuesEqual(_: T.Value, _: T.Value) -> Bool {
        fatalError("TODO")
    }
}
