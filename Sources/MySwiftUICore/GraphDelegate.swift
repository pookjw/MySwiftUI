private import Foundation

@_spi(Internal) public protocol GraphDelegate : AnyObject {
    func updateGraph<T>(body: (GraphHost) -> T) -> T
    func graphDidChange()
    func preferencesDidChange()
    func beginTransaction()
}

extension GraphDelegate {
    @_spi(Internal) public func beginTransaction() {
        let box = WeakBox(self)
        
        onMainThread {
            // $s7SwiftUI13GraphDelegatePAAE16beginTransactionyyFyycfU_
            RunLoop.addObserver { 
                // $s7SwiftUI13GraphDelegatePAAE16beginTransactionyyFyycfU_yycfU_TA
                Update.ensure { 
                    // $s7SwiftUI13GraphDelegatePAAE16beginTransactionyyFyycfU_yycfU_yyXEfU_
                    guard let self = box.base else {
                        return
                    }
                    
                    self.updateGraph { host in
                        // $s7SwiftUI13GraphDelegatePAAE16beginTransactionyyFyycfU_yycfU_yyXEfU_yAA0C4HostCXEfU_
                        host.flushTransactions()
                    }
                }
            }
        }
    }
}
