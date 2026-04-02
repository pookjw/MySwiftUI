enum HitTestPassThroughFeature {
    @safe nonisolated(unsafe) static var overrideValue: Bool? = nil
    
    static var isEnabled: Bool {
        if let overrideValue {
            return overrideValue
        }
        
        return isLinkedOnOrAfter(.v7)
    }
}
