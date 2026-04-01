public import MySwiftUICore

@available(iOS 16.0, macOS 13.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@preconcurrency @MainActor public struct OpenWindowAction {
    @available(macOS 15.0, *)
    @available(iOS, unavailable)
    public struct SharingBehavior: Sendable {
        public static let requested: OpenWindowAction.SharingBehavior = { assertUnimplemented() }()
        public static let required: OpenWindowAction.SharingBehavior = { assertUnimplemented() }()
    }

    @MainActor @preconcurrency public func callAsFunction<D>(value: D) where D: Decodable, D: Encodable, D: Hashable {
        assertUnimplemented()
    }

    @available(macOS 15.0, *)
    @available(iOS, unavailable)
    @MainActor public func callAsFunction<D>(value: D, sharingBehavior: OpenWindowAction.SharingBehavior) async throws where D: Decodable, D: Encodable, D: Hashable {
        assertUnimplemented()
    }

    @MainActor @preconcurrency public func callAsFunction(id: String) {
        assertUnimplemented()
    }

    @available(macOS 15.0, *)
    @available(iOS, unavailable)
    @MainActor public func callAsFunction(id: String, sharingBehavior: OpenWindowAction.SharingBehavior) async throws {
        assertUnimplemented()
    }

    @MainActor @preconcurrency public func callAsFunction<D>(id: String, value: D) where D: Decodable, D: Encodable, D: Hashable {
        assertUnimplemented()
    }

    @available(macOS 15.0, *)
    @available(iOS, unavailable)
    @MainActor public func callAsFunction<D>(id: String, value: D, sharingBehavior: OpenWindowAction.SharingBehavior) async throws where D: Decodable, D: Encodable, D: Hashable {
        assertUnimplemented()
    }
}

@available(iOS 16.0, macOS 13.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension EnvironmentValues {
    public var openWindow: OpenWindowAction {
        get {
            assertUnimplemented()
        }
    }
}

@available(iOS 16.0, macOS 13.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension OpenWindowAction: Sendable {}
