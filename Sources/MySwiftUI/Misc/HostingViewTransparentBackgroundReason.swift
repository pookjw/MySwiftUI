struct HostingViewTransparentBackgroundReason: OptionSet, CustomStringConvertible {
    static let `default` = HostingViewTransparentBackgroundReason(rawValue: 1 << 0)
    static let catalystSidebar = HostingViewTransparentBackgroundReason(rawValue: 1 << 1)
    static let catalystPresentation = HostingViewTransparentBackgroundReason(rawValue: 1 << 2)
    static let legacyPresentationSPI = HostingViewTransparentBackgroundReason(rawValue: 1 << 3)
    static let containerBackground = HostingViewTransparentBackgroundReason(rawValue: 1 << 4)
    static let listItemBackground = HostingViewTransparentBackgroundReason(rawValue: 1 << 5)
    
    var rawValue: UInt32
    
    init(rawValue: UInt32) {
        self.rawValue = rawValue
    }
    
    var description: String {
        var result = String()
        result.append("[")
        
        if contains(.default) {
            result.append("default, ")
        }
        
        if contains(.catalystSidebar) {
            result.append("catalystSidebar, ")
        }
        
        if contains(.catalystPresentation) {
            result.append("catalystPresentation, ")
        }
        
        if contains(.legacyPresentationSPI) {
            result.append("legacyPresentationSPI, ")
        }
        
        if contains(.containerBackground) {
            result.append("containerBackground, ")
        }
        
        if contains(.listItemBackground) {
            result.append("listItemBackground, ")
        }
        
        if result.count > 1 {
            result.removeLast(2)
        }
        
        result.append("]")
        return result
    }
}
