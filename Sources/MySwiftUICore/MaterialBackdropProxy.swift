private import os.lock

package struct MaterialBackdropProxy {
    private var storage = MaterialBackdropProxy.Storage()
    
    package var luminance: Float? {
        get {
            return storage.data.withLockUnchecked { data in
                return data.luminance
            }
        }
        set {
            let observers = storage.data.withLockUnchecked { data in
                data.luminance = newValue
                return data.observers
            }
            
            for observer in observers {
                observer.observer?.luminanceDidChange(luminance)
            }
        }
    }
    
    package init() {
    }
    
    package func removeObserver(_ observer: any MaterialBackdropObserver) {
        fatalError("TODO")
    }
    
    package func addObserver(_ observer: any MaterialBackdropObserver) {
        fatalError("TODO")
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

package protocol MaterialBackdropObserver: AnyObject {
    func luminanceDidChange(_ luminance: Float?)
}
