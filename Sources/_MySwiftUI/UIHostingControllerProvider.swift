protocol UIHostingControllerProvider: AnyObject {
    var hostingControllerOverrides: HostingControllerOverrides {
        get set
    }
}
