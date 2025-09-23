#warning("TODO")

public struct EnvironmentValues {
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
}
