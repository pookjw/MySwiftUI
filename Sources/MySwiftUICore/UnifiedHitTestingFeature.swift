package struct UnifiedHitTestingFeature: Feature {
    package init() {}
    
    package static var isEnabled: Bool {
        if isLinkedOnOrAfter(.v6) {
            return true
        }
        
        return GestureContainerFeature.isEnabled
    }
}
