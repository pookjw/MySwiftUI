package struct TreeValueFlags: OptionSet {
    package let rawValue: UInt32
    
    package init(rawValue: UInt32) {
        self.rawValue = rawValue
    }
    
    static var stateSignal: TreeValueFlags {
        return TreeValueFlags(rawValue: 1 << 0)
    }
    
    static var environmentObjectSignal: TreeValueFlags {
        return TreeValueFlags(rawValue: 1 << 1)
    }
    
    static var observedObjectSignal: TreeValueFlags {
        return [.stateSignal, .environmentObjectSignal]
    }
    
    package static var appStorageSignal: TreeValueFlags {
        return TreeValueFlags(rawValue: 1 << 2)
    }
    
    static var sceneStorageSignal: TreeValueFlags {
        return [.stateSignal, .appStorageSignal]
    }
    
    static var stateObjectSignal: TreeValueFlags {
        return [.environmentObjectSignal, .appStorageSignal]
    }
    
    static var focusedObjectSignal: TreeValueFlags {
        return [.stateSignal, .environmentObjectSignal, .appStorageSignal]
    }
    
    static var lazyStateSignal: TreeValueFlags {
        return TreeValueFlags(rawValue: 1 << 3)
    }
}
