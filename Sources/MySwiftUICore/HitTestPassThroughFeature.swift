enum HitTestPassThroughFeature {
    @safe static nonisolated(unsafe) var overrideValue: Bool? = nil
    
    static var isEnabled: Bool {
        if let overrideValue {
            return overrideValue
        }
        
        return isLinkedOnOrAfter(.v7)
    }
}
