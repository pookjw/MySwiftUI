private import _UIKitPrivate

extension UIHostingViewBase {
    enum UpdateCycle {
        @MainActor package static func addPreCommitObserver(_ handler: @MainActor @escaping () -> Void) {
            guard UIHostingViewBase.UpdateCycle.isEnabled else {
                return
            }
            
            _UIUpdateSequenceInsertItem(_UIUpdateSequenceCATransactionCommitItemInternal, false, "UICoreHostingViewFlush", false) { _ in
                fatalError("TODO")
            }
            
            fatalError("TODO")
        }
        
        package static var isEnabled: Bool {
            return _UIUpdateCycleEnabled()
        }
        
        package static var useSetNeedsLayout: Bool {
            fatalError("TODO")
        }
        
        package static func addPreCommitObserverOrAsyncMain(_ handler: () -> Void) {
            fatalError("TODO")
        }
    }
}
