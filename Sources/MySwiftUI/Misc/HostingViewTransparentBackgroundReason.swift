struct HostingViewTransparentBackgroundReason: OptionSet, CustomStringConvertible {
    static var `default`: HostingViewTransparentBackgroundReason { HostingViewTransparentBackgroundReason(rawValue: 1 << 0) }
    static var catalystSidebar: HostingViewTransparentBackgroundReason { HostingViewTransparentBackgroundReason(rawValue: 1 << 1) }
    static var catalystPresentation: HostingViewTransparentBackgroundReason { HostingViewTransparentBackgroundReason(rawValue: 1 << 2) }
    static var legacyPresentationSPI: HostingViewTransparentBackgroundReason { HostingViewTransparentBackgroundReason(rawValue: 1 << 3) }
    static var containerBackground: HostingViewTransparentBackgroundReason { HostingViewTransparentBackgroundReason(rawValue: 1 << 4) }
    static var listItemBackground: HostingViewTransparentBackgroundReason { HostingViewTransparentBackgroundReason(rawValue: 1 << 5) }
    
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
