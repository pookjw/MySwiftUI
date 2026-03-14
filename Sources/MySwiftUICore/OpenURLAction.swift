// B30D3CE6A753616B2150C4E3EFDA1ED9
public import Foundation

/*
 TODO
 +[UIApplication _setupDefaultEnvironmentWithScreen:]
 $s7SwiftUI17EnvironmentValuesV17setDefaultOpenURLyyAA0G9URLActionVF:        // SwiftUI.EnvironmentValues.setDefaultOpenURL(SwiftUI.OpenURLAction) -> ()
 */

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
@preconcurrency @MainActor
public struct OpenURLAction {
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    public struct Result: Sendable {
        fileprivate private(set) var actionResult: OpenURLAction.Result.ActionResult
        
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
    
    fileprivate let handler: OpenURLAction.Handler
    fileprivate let isDefault: Bool
    
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
    
    package init(isDefault: Bool = false, handler: @escaping (OpenURLAction.SystemHandlerInput) -> Void) {
        self.handler = .system(handler)
        self.isDefault = isDefault
    }
    
    init(_handler: @escaping (URL, (Bool) -> Void) -> Void) {
        self.handler = .system({ input in
            _handler(input.url, input.completion)
        })
        
        self.isDefault = false
    }
    
    @inline(__always)
    fileprivate init(handler: OpenURLAction.Handler, isDefault: Bool) {
        self.handler = handler
        self.isDefault = isDefault
    }
    
    @MainActor @preconcurrency
    public func callAsFunction(_ url: URL) {
        _open(url, prefersInApp: nil, completion: { _ in })
    }
    
    @available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
    @MainActor @preconcurrency
    public func callAsFunction(_ url: URL, prefersInApp: Bool) {
        _open(url, prefersInApp: prefersInApp, completion: { _ in })
    }
    
    @available(watchOS, unavailable)
    @MainActor @preconcurrency
    public func callAsFunction(_ url: URL, completion: @escaping (_ accepted: Bool) -> Void) {
        _open(url, prefersInApp: false, completion: completion)
    }
    
    fileprivate func _open(_ url: URL, prefersInApp: Bool?, completion: @escaping (Bool) -> Void) {
        // <+328>
        switch handler {
        case .system(let action):
            guard !url.isFileURL else {
                completion(false)
                return
            }
            
            // <+568>
            let input = OpenURLAction.SystemHandlerInput(url: url, prefersInApp: prefersInApp == true, completion: completion)
            action(input)
        case .custom(let action, let fallback):
            let result = action(url)
            
            switch result.actionResult {
            case .systemAction(let _url, let _prefersInApp):
                guard let fallback else {
                    Log.internalWarning("OpenURLAction configured without a fallback")
                    return
                }
                
                // <+716>
                let input = OpenURLAction.SystemHandlerInput(url: _url ?? url, prefersInApp: prefersInApp ?? _prefersInApp, completion: completion)
                fallback(input)
            case .handled:
                completion(true)
            case .discarded:
                completion(false)
            }
        }
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
            self[OpenURLActionKey.self] = newValue
        }
    }
    
    @preconcurrency @MainActor
    public var _openURL: OpenURLAction {
        get {
            if let action = self[OpenURLActionKey.self] {
                switch action.handler {
                case .system(_):
                    return action
                case .custom(let result, fallback: let fallback):
                    if !hasSystemOpenURLAction {
                        return OpenURLAction(handler: .custom(result, fallback: fallback), isDefault: false)
                    } else {
                        let resolved = resolvedDefaultOpenURL
                        switch resolved.handler {
                        case .system(let resolved):
                            return OpenURLAction(handler: .custom(result, fallback: resolved), isDefault: false)
                        case .custom(_, let fallback):
                            return OpenURLAction(handler: .custom(result, fallback: fallback), isDefault: false)
                        }
                    }
                }
            }
            
            if hasSystemOpenURLAction {
                return resolvedDefaultOpenURL
            } else {
                return .invalidAction
            }
        }
        set {
            self.openURL = newValue
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
            self[OpenSensitiveURLActionKey.self] = newValue
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
    
    package var hasSystemOpenURLAction: Bool {
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
        environment(\.openURL, OpenURLAction(handler: { url in
            return .systemAction(url, prefersInApp: prefersInApp)
        }))
    }
}

extension OpenURLAction {
    package static func defaultSystemAction(handler: @escaping (URL, (Bool) -> Void) -> Void) -> OpenURLAction {
        return OpenURLAction(
            isDefault: true,
            handler: { input in
                handler(input.url, input.completion)
            }
        )
    }
    
    package static var defaultAction: OpenURLAction?
    package static var defaultSensitiveAction: OpenURLAction?
    
    static var invalidAction: OpenURLAction {
        return OpenURLAction { (url: URL) in
            // $s7SwiftUI13OpenURLActionVAAE13invalidActionACvgZAC6ResultV10Foundation3URLVcfU_
            return .discarded
        }
    }
    
    package struct SystemHandlerInput {
        package let url: URL
        package let prefersInApp: Bool
        package let completion: (Bool) -> Void
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

extension EnvironmentValues {
    package mutating func setDefaultOpenURL(_ action: OpenURLAction) {
        self._defaultOpenURL = action
        self.hasSystemOpenURLAction = true
    }
}
