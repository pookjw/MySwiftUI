public import Foundation

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@preconcurrency @MainActor public protocol HasSynchronization : Entity {
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension HasSynchronization {
    @MainActor @preconcurrency public var synchronization: SynchronizationComponent? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public var isOwner: Bool {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public func requestOwnership(timeout: TimeInterval = 15, _ callback: @escaping (_ failure: SynchronizationComponent.OwnershipTransferCompletionResult) -> Void) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func withUnsynchronized(_ changes: () -> Void) {
        assertUnimplemented()
    }
}
