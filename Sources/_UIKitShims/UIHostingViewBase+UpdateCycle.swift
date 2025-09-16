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
                // ___lldb_unnamed_symbol317968
                // ___lldb_unnamed_symbol317973
                
                let insertedItems = insertedItems
                guard insertedItems.count == 1 else {
                    return
                }
                
                let item = insertedItems[0]
                
                ViewGraphHostUpdate.dispatchImmediately {
                    // ___lldb_unnamed_symbol311502
                    // ___lldb_unnamed_symbol317393
                    fatalError("TODO")
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
