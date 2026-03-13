public import Foundation

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
@preconcurrency @MainActor
public struct OpenURLAction {
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    public struct Result: Sendable {
        public static let handled: OpenURLAction.Result = {
            fatalError("TODO")
        }()
        
        public static let discarded: OpenURLAction.Result = {
            fatalError("TODO")
        }()
        
        public static let systemAction: OpenURLAction.Result = {
            fatalError("TODO")
        }()
        
        public static func systemAction(_ url: URL) -> OpenURLAction.Result {
            fatalError("TODO")
        }
        
        @available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
        public static func systemAction(_ url: URL? = { fatalError("TODO") }(), prefersInApp: Bool) -> OpenURLAction.Result {
            fatalError("TODO")
        }
    }
    
    private let handler: OpenURLAction.Handler
    private let isDefault: Bool
    
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    @preconcurrency @MainActor
    public init(handler: @escaping (URL) -> OpenURLAction.Result) {
        fatalError("TODO")
    }
    
    init(handler: @escaping (URL, (Bool) -> Void) -> Void) {
        fatalError("TODO")
    }
    
    init(isDefault: Bool = false, handler: @escaping (OpenURLAction.SystemHandlerInput) -> Void) {
        fatalError("TODO")
    }
    
    @MainActor @preconcurrency
    public func callAsFunction(_ url: URL) {
        fatalError("TODO")
    }
    
    @available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
    @MainActor @preconcurrency
    public func callAsFunction(_ url: URL, prefersInApp: Bool) {
        fatalError("TODO")
    }
    
    @available(watchOS, unavailable)
    @MainActor @preconcurrency
    public func callAsFunction(_ url: URL, completion: @escaping (_ accepted: Bool) -> Void) {
        fatalError("TODO")
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension EnvironmentValues {
    @preconcurrency @MainActor
    public var openURL: OpenURLAction {
        get {
            fatalError("TODO")
        }
        @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
        set {
            fatalError("TODO")
        }
    }
    
    @preconcurrency @MainActor
    public var _openURL: OpenURLAction {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension EnvironmentValues {
    @preconcurrency @MainActor
    public var _openSensitiveURL: OpenURLAction {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
}

extension View {
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    @_alwaysEmitIntoClient @MainActor @preconcurrency
    internal func onOpenURL(_ action: @escaping (URL) -> OpenURLAction.Result) -> some View {
        environment(\.openURL, OpenURLAction(handler: action))
    }
    
    @available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
    @MainActor @preconcurrency
    public func onOpenURL(prefersInApp: Bool) -> some View {
        fatalError("TODO")
    }
}

extension OpenURLAction {
    static func defaultSystemAction(handler: @escaping (URL, (Bool) -> Void) -> Void) -> OpenURLAction {
        fatalError("TODO")
    }
    
    static var defaultAction: OpenURLAction? {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
    
    static var defaultSensitiveAction: OpenURLAction? {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
    
    static var invalidAction: OpenURLAction {
        fatalError("TODO")
    }
    
    struct SystemHandlerInput {
        private let _url: URL
        private let _prefersInApp: Bool
        private let _completion: (Bool) -> Void
        
        var url: URL {
            fatalError("TODO")
        }
        
        var prefersInApp: Bool {
            fatalError("TODO")
        }
        
        var completion: (Bool) -> Void {
            fatalError("TODO")
        }
    }
    
    enum Handler {
        case system((OpenURLAction.SystemHandlerInput) -> Void)
        case custom((URL) -> OpenURLAction.Result, fallback: ((OpenURLAction.SystemHandlerInput) -> Void)?)
    }
    
    struct OpenURLActionKey: EnvironmentKey {
        static var defaultValue: OpenURLAction {
            fatalError("TODO")
        }
    }
}

extension OpenURLAction.Result {
    enum ActionResult {
        case systemAction(url: URL?, prefersInApp: Bool)
        case handled
        case discarded
    } 
}

extension OpenURLAction: Sendable {}
