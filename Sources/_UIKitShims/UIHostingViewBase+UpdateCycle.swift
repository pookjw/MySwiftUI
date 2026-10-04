private import _UIKitPrivate
private import MySwiftUICore

@MainActor private var insertedItems: [UnsafeRawPointer] = unsafe []
@MainActor private var preCommitObservers: [@MainActor () -> Void] = []

extension UIHostingViewBase {
    package enum UpdateCycle {
        @MainActor package static func addPreCommitObserver(_ handler: @MainActor @escaping () -> Void) {
            guard UIHostingViewBase.UpdateCycle.isEnabled else {
                return
            }
            
            if unsafe insertedItems.isEmpty {
                let item = unsafe _UIUpdateSequenceInsertItem(_UIUpdateSequenceCATransactionCommitItemInternal, false, "UICoreHostingViewFlush", false, nil) { _, _, _ in
                    while !preCommitObservers.isEmpty {
                        let observers = preCommitObservers
                        preCommitObservers = []
                        ViewGraphHostUpdate.dispatchImmediately {
                            for observer in observers {
                                observer()
                            }
                        }
                    }
                }
                unsafe insertedItems.append(item)
            }
            preCommitObservers.append(handler)
        }
        
        @_transparent
        package static var isEnabled: Bool {
            return _UIUpdateCycleEnabled()
        }
        
        package static var useSetNeedsLayout: Bool {
            assertUnimplemented()
        }
        
        package static func addPreCommitObserverOrAsyncMain(_ handler: () -> Void) {
            assertUnimplemented()
        }
    }
}
