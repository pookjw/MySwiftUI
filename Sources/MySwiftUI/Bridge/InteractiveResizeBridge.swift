#warning("TODO")
internal import UIKit
@_spi(Internal) internal import MySwiftUICore
internal import AttributeGraph

final class InteractiveResizeBridge {
    var lastValue: Bool = false
    var isInteractivelyResizing = WeakAttribute<Bool>()
    
    func handleLiveResize(isResizing: Bool, host: ViewRendererHost) {
        /*
         isResizing = w28
         host = x26
         self = x19
         */
        guard self.lastValue != isResizing else {
            return
        }
        
        // x20
        let viewGraph = host.viewGraph
        
        viewGraph.asyncTransaction(setting: isInteractivelyResizing, to: isResizing, style: .deferred)
        self.lastValue = isResizing
    }
}
