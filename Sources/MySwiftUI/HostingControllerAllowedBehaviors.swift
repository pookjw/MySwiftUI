struct HostingControllerAllowedBehaviors: OptionSet {
    let rawValue: Int
    
    static var unknown0: HostingControllerAllowedBehaviors {
        return HostingControllerAllowedBehaviors(rawValue: 1 << 0)
    }
}
