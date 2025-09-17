private import _UIKitPrivate
private import MySwiftUICore

@MainActor private var insertedItems: [UnsafeRawPointer] = []

extension UIHostingViewBase {
    enum UpdateCycle {
        @MainActor package static func addPreCommitObserver(_ handler: @MainActor @escaping () -> Void) {
            guard UIHostingViewBase.UpdateCycle.isEnabled else {
                return
            }
            
            guard insertedItems.isEmpty else {
                return
            }
            
            let item = _UIUpdateSequenceInsertItem(_UIUpdateSequenceCATransactionCommitItemInternal, false, "UICoreHostingViewFlush", false, nil) { _, a, b in
                guard insertedItems.count == 1 else {
                    return
                }
                
                insertedItems = []
                
                ViewGraphHostUpdate.dispatchImmediately {
                    handler()
                }
            }
            
            insertedItems.append(item)
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
