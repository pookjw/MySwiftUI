@available(iOS 16.0, tvOS 16.0, *)
@available(macOS, unavailable)
public struct UIHostingControllerSizingOptions: OptionSet, Sendable {
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public static let preferredContentSize = UIHostingControllerSizingOptions(rawValue: 1 << 0)
    public static let intrinsicContentSize = UIHostingControllerSizingOptions(rawValue: 1 << 1)
    
    static var unknown2: UIHostingControllerSizingOptions {
        return UIHostingControllerSizingOptions(rawValue: 1 << 2)
    }
    
    static var unknown3: UIHostingControllerSizingOptions {
        return UIHostingControllerSizingOptions(rawValue: 1 << 3)
    }
    
    static let idealSize: UIHostingControllerSizingOptions = [.preferredContentSize, .intrinsicContentSize]
}
