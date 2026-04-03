// F20C61CD9B558E2290275C15412F9D85
public import MySwiftUICore
private import os.log

@available(iOS 16.0, macOS 13.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@preconcurrency @MainActor public struct OpenWindowAction {
    private var namespace: SceneList.Namespace = .app
    private var windowNumber: Int? = nil
    
    @available(macOS 15.0, *)
    @available(iOS, unavailable)
    public struct SharingBehavior : Sendable {
        private var behavior: OpenWindowAction.SharingBehavior.Behavior
        
        public static let requested = OpenWindowAction.SharingBehavior(behavior: .requested)
        public static let required = OpenWindowAction.SharingBehavior(behavior: .required)
    }

    @MainActor @preconcurrency public func callAsFunction<D>(value: D) where D : Decodable, D : Encodable, D : Hashable {
        assertUnimplemented()
    }

    @available(macOS 15.0, *)
    @available(iOS, unavailable)
    @MainActor public func callAsFunction<D>(value: D, sharingBehavior: OpenWindowAction.SharingBehavior) async throws where D : Decodable, D : Encodable, D : Hashable {
        assertUnimplemented()
    }

    @MainActor @preconcurrency public func callAsFunction(id: String) {
        /*
         self -> x20
         id -> x0/x1 -> x21/x25
         */
        let strategy = SceneNavigationStrategy_Phone.shared
        
        if strategy.sceneNavigationEnabled {
            // <+92>
            strategy.openWindow(namespace: self.namespace, id: id, withBehavior: .default)
        } else {
            // <+160>
            unsafe os_log(.fault, log: .runtimeIssuesLog, "Use of OpenWindowAction requires the SwiftUI App Lifecycle.")
        }
    }

    @available(macOS 15.0, *)
    @available(iOS, unavailable)
    @MainActor public func callAsFunction(id: String, sharingBehavior: OpenWindowAction.SharingBehavior) async throws {
        assertUnimplemented()
    }

    @MainActor @preconcurrency public func callAsFunction<D>(id: String, value: D) where D : Decodable, D : Encodable, D : Hashable {
        assertUnimplemented()
    }

    @available(macOS 15.0, *)
    @available(iOS, unavailable)
    @MainActor public func callAsFunction<D>(id: String, value: D, sharingBehavior: OpenWindowAction.SharingBehavior) async throws where D : Decodable, D : Encodable, D : Hashable {
        assertUnimplemented()
    }
}

@available(iOS 16.0, macOS 13.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension EnvironmentValues {
    public var openWindow: OpenWindowAction {
        return self[OpenWindowActionKey.self]
    }
}

@available(iOS 16.0, macOS 13.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension OpenWindowAction : Sendable {}

extension EnvironmentValues {
    fileprivate struct OpenWindowActionKey : EnvironmentKey {
        static let defaultValue = OpenWindowAction()
    }
}

@available(macOS 15.0, *)
@available(iOS, unavailable)
extension OpenWindowAction.SharingBehavior {
    enum Behavior: Hashable {
        case requested
        case required
    }
}

extension OpenWindowAction {
    struct Destination {
        private var role: OpenWindowAction.Destination.Role
        
        static var automatic: OpenWindowAction.Destination {
            return OpenWindowAction.Destination(role: .automatic)
        }
        
        static var sharingSession: OpenWindowAction.Destination {
            return OpenWindowAction.Destination(role: .sharingSession)
        }
    }
}

extension OpenWindowAction.Destination {
    enum Role: Hashable {
        case automatic
        case sharingSession
    }
}
