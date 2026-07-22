struct DebugOptions : OptionSet {
    let rawValue: Int
    
    static var none: DebugOptions {
        return DebugOptions(rawValue: 0)
    }
    
    init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    static var showPhysics: DebugOptions {
        return DebugOptions(rawValue: 1 << 0)
    }
}
