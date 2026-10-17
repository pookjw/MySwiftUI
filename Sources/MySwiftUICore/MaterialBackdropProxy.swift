#if SwiftUICompatibility
package import _SwiftUIPrivate

fileprivate struct MaterialBackdropProxyKey : EnvironmentKey {
    static var defaultValue: _SwiftUIPrivate::MaterialBackdropProxy? {
        return nil
    }
}

extension EnvironmentValues {
    package var materialBackdropProxy: _SwiftUIPrivate::MaterialBackdropProxy? {
        get {
            return self[MaterialBackdropProxyKey.self]
        }
        set {
            self[MaterialBackdropProxyKey.self] = newValue
        }
    }
}

#else
private import os.lock

package struct MaterialBackdropProxy : Equatable {
    package static func == (lhs: MaterialBackdropProxy, rhs: MaterialBackdropProxy) -> Bool {
        return ObjectIdentifier(lhs.storage) == ObjectIdentifier(rhs.storage)
    }
    
    private var storage = MaterialBackdropProxy.Storage()
    
    package var luminance: Float? {
        get {
            return storage.data.withLockUnchecked { data in
                return data.luminance
            }
        }
        nonmutating set {
            let observers = storage.data.withLockUnchecked { data in
                let oldValue = data.luminance
                if oldValue == newValue {
                    return []
                } else {
                    data.luminance = newValue
                    return data.observers
                }
            }
            
            for observer in observers {
                observer.observer?.luminanceDidChange(luminance)
            }
        }
    }
    
    package init() {
    }
    
    package func removeObserver(_ observer: any MaterialBackdropObserver) {
        storage.data.withLockUnchecked { data in
            if let firstIndex = data.observers.firstIndex(where: { other in
                guard let other = other.observer else {
                    return false
                }
                return ObjectIdentifier(other) == ObjectIdentifier(observer)
            }) {
                data.observers.remove(at: firstIndex)
            }
        }
    }
    
    package func addObserver(_ observer: any MaterialBackdropObserver) {
        storage.data.withLockUnchecked { data in
            var isRegistered = false
            var index = 0
            while index < data.observers.count {
                if let other = data.observers[index].observer {
                    if ObjectIdentifier(other) == ObjectIdentifier(observer) {
                        isRegistered = true
                    }
                    index += 1
                } else {
                    data.observers.remove(at: index)
                }
            }
            if !isRegistered {
                data.observers.append(MaterialBackdropProxy.Observer(observer: observer))
            }
        }
    }
}

extension MaterialBackdropProxy {
    fileprivate final class Storage {
        let data = OSAllocatedUnfairLock(uncheckedState: MaterialBackdropProxy.Storage.Data())
    }
    
    fileprivate struct Observer {
        weak var observer: MaterialBackdropObserver?
    }
}

extension MaterialBackdropProxy.Storage {
    fileprivate struct Data {
        var luminance: Float? = nil
        var observers: [MaterialBackdropProxy.Observer] = []
    }
}

package protocol MaterialBackdropObserver : AnyObject {
    func luminanceDidChange(_ luminance: Float?)
}

fileprivate struct MaterialBackdropProxyKey : EnvironmentKey {
    static var defaultValue: MaterialBackdropProxy? {
        return nil
    }
}

extension EnvironmentValues {
    package var materialBackdropProxy: MaterialBackdropProxy? {
        get {
            return self[MaterialBackdropProxyKey.self]
        }
        set {
            self[MaterialBackdropProxyKey.self] = newValue
        }
    }
}
#endif
