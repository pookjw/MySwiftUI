@available(iOS 16.0, tvOS 16.0, *)
@available(macOS, unavailable)
public struct UIHostingControllerSizingOptions: OptionSet, Sendable {
    public let rawValue: Int
    
    public init(rawValue: Int) {
        fatalError("TODO")
    }
    
    public static let preferredContentSize: UIHostingControllerSizingOptions = {
        fatalError("TODO")
    }()
    
    public static let intrinsicContentSize: UIHostingControllerSizingOptions = {
        fatalError("TODO")
    }()
}

extension UIHostingController {
    @preconcurrency public var sizingOptions: UIHostingControllerSizingOptions {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
}
