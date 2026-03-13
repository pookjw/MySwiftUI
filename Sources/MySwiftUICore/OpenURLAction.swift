// B30D3CE6A753616B2150C4E3EFDA1ED9
public import Foundation

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
@preconcurrency @MainActor
public struct OpenURLAction {
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    public struct Result: Sendable {
        private var actionResult: OpenURLAction.Result.ActionResult
        
        public static let handled = OpenURLAction.Result(actionResult: .handled)
        public static let discarded = OpenURLAction.Result(actionResult: .discarded)
        public static let systemAction = OpenURLAction.Result(actionResult: .systemAction(url: nil, prefersInApp: false))
        
        public static func systemAction(_ url: URL) -> OpenURLAction.Result {
            return OpenURLAction.Result(actionResult: .systemAction(url: url, prefersInApp: false))
        }
        
        @available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
        public static func systemAction(_ url: URL? = nil, prefersInApp: Bool) -> OpenURLAction.Result {
            return OpenURLAction.Result(actionResult: .systemAction(url: url, prefersInApp: prefersInApp))
        }
    }
    
    private let handler: OpenURLAction.Handler
    private let isDefault: Bool
    
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    @preconcurrency @MainActor
    public init(handler: @escaping (URL) -> OpenURLAction.Result) {
        self.handler = .custom(handler, fallback: nil)
        self.isDefault = false
    }
    
    init(handler: OpenURLAction.Handler) {
        self.handler = handler
        self.isDefault = false
    }
    
    init(isDefault: Bool = false, handler: @escaping (OpenURLAction.SystemHandlerInput) -> Void) {
        self.handler = .system(handler)
        self.isDefault = isDefault
    }
    
    init(_handler: @escaping (URL, (Bool) -> Void) -> Void) {
        self.handler = .system({ input in
            _handler(input.url, input.completion)
        })
        
        self.isDefault = false
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
            return _openURL
        }
        @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
        set {
            fatalError("TODO")
        }
    }
    
    @preconcurrency @MainActor
    public var _openURL: OpenURLAction {
        get {
            if let action = self[OpenURLActionKey.self] {
                return action
            }
            
            if hasSystemOpenURLAction {
                return resolvedDefaultOpenURL
            } else {
                return .invalidAction
            }
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
            if let action = self[OpenSensitiveURLActionKey.self] {
                return action
            }
            
            if hasSystemOpenURLAction, let action = OpenURLAction.defaultSensitiveAction {
                return action
            } else {
                return .invalidAction
            }
        }
        set {
            fatalError("TODO")
        }
    }
}

extension EnvironmentValues {
    fileprivate var resolvedDefaultOpenURL: OpenURLAction {
        if let defaultAction = OpenURLAction.defaultAction {
            return defaultAction
        }
        
        if let defaultOpenURL = _defaultOpenURL {
            return defaultOpenURL
        }
        
        return .invalidAction
    }
    
    var _defaultOpenURL: OpenURLAction? {
        get {
            return self[EnvironmentValues.DefaultOpenURLActionKey.self]
        }
        set {
            self[EnvironmentValues.DefaultOpenURLActionKey.self] = newValue
        }
    }
    
    fileprivate struct DefaultOpenURLActionKey: EnvironmentKey {
        static var defaultValue: OpenURLAction? {
            return nil
        }
    }
    
    var hasSystemOpenURLAction: Bool {
        get {
            return self[HasSystemOpenURLActionKey.self]
        }
        set {
            self[HasSystemOpenURLActionKey.self] = newValue
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
        return OpenURLAction(
            isDefault: true,
            handler: { input in
                handler(input.url, input.completion)
            }
        )
    }
    
    static var defaultAction: OpenURLAction?
    static var defaultSensitiveAction: OpenURLAction?
    
    static var invalidAction: OpenURLAction {
        return OpenURLAction { (url: URL) in
            // $s7SwiftUI13OpenURLActionVAAE13invalidActionACvgZAC6ResultV10Foundation3URLVcfU_
            return .discarded
        }
    }
    
    struct SystemHandlerInput {
        let url: URL
        let prefersInApp: Bool
        let completion: (Bool) -> Void
    }
    
    enum Handler {
        case system((OpenURLAction.SystemHandlerInput) -> Void)
        case custom((URL) -> OpenURLAction.Result, fallback: ((OpenURLAction.SystemHandlerInput) -> Void)?)
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

struct OpenURLActionKey: EnvironmentKey {
    static var defaultValue: OpenURLAction? {
        return nil
    }
}

struct OpenSensitiveURLActionKey: EnvironmentKey {
    static var defaultValue: OpenURLAction? {
        return nil
    }
}

fileprivate struct HasSystemOpenURLActionKey: EnvironmentKey {
    static var defaultValue: Bool {
        return false
    }
}
