// 50A236BE05D8013F647BA5A7CED497D1
internal import UIKit
internal import MySwiftUICore
private import _MySwiftUIShims

final class UIKitContentScrollViewBridge {
    weak var viewController: UIViewController? = nil // 0x10
    private var lastSeed: VersionSeed = .invalid // 0x208
    private var bridgeSetEdges: [UInt: ObjectIdentifier] = [:] // 0x210
    private var pendingScrollViews: [ContentScrollViewBox]? = nil // 0x218
    var pixelLength: CGFloat = 1 // 0x220
    
    init() {
    }
    
    func preferencesDidChange(_ preferences: PreferenceValues) {
        /*
         self -> x20 -> x19
         preferences -> x0 -> x20
         */
        // x24
        let contentScrollView = preferences[ContentScrollViewPreferenceKey.self]
        let matches = lastSeed.matches(contentScrollView.seed)
        
        if !matches, viewController != nil {
            // <+336>
            // sp + 0x58 (x29 - 0x98)
            let newValue = contentScrollView.value
            var w21 = true
            for value in newValue {
                // <+412>
                fatalError("TODO")
            }
            
            // <+608>
            self.pendingScrollViews = contentScrollView.value
            if w21 {
                update()
            }
            
            // <+668>
            self.lastSeed = contentScrollView.seed
        } else {
            // <+520>
            self.lastSeed = contentScrollView.seed
        }
    }
    
    func update() {
        guard
            let pendingScrollViews,
            let viewController // sp + 0x8
        else {
            return
        }
        
        if let candidates = findBestCandidates(in: pendingScrollViews) {
            // <+124>
            self.pendingScrollViews = nil
            
            func update(edge: NSDirectionalRectEdge) {
                /*
                 edge -> x0 -> x21
                 viewController -> x1 -> x22
                 self -> x2 -> x19
                 candidates -> x3/x4 -> x24/x23
                 */
                if
                    let contentScrollView = viewController.contentScrollView(for: edge), // x25
                    !type(of: contentScrollView)._isFromMySwiftUI()
                {
                    // <+116>
                    // x20
                    let bridge = bridgeSetEdges[edge.rawValue]
                    // <+196>
                    guard ObjectIdentifier(contentScrollView) == bridge else {
                        return
                    }
                    
                    // <+204>
                }
                
                // <+204>
                if
                    (edge == .bottom) || (edge == .top),
                    let scrollView1 = candidates.scrollView1 // x24 -> x23
                {
                    // <+228>
                    viewController.setContentScrollView(scrollView1, for: edge)
                    bridgeSetEdges[edge.rawValue] = ObjectIdentifier(scrollView1)
                    // <+480>
                } else {
                    // <+356>
                    viewController.setContentScrollView(nil, for: edge)
                    bridgeSetEdges.removeValue(forKey: edge.rawValue)
                    // <+480>
                }
                
                // <+480>
            }
            
            update(edge: .bottom)
            update(edge: .top)
        }
        
        // <+200>
    }
    
    fileprivate func findBestCandidates(in scrollViews: [ContentScrollViewBox]) -> UIKitContentScrollViewBridge.Candidates? {
        // scrollView -> x23
        guard
            let viewController,
            let view = viewController.view // sp + 0x30
        else {
            return nil
        }
        
        // <+52>
        guard !scrollViews.isEmpty else {
            return Candidates(scrollView1: nil, scrollView2: nil)
        }
        
        var results: [ContentScrollViewBox] = []
        for scrollView in scrollViews {
            fatalError("TODO")
        }
        fatalError("TODO")
    }
    
    // TODO
}

extension UIKitContentScrollViewBridge {
    fileprivate struct Candidates {
        let scrollView1: UIScrollView?
        let scrollView2: UIScrollView?
    }
}

struct ContentScrollViewBox {
    // TODO
}

struct ContentScrollViewPreferenceKey: HostPreferenceKey {
    static nonisolated(unsafe) let defaultValue: [ContentScrollViewBox] = []
    
    static func reduce(value: inout [ContentScrollViewBox], nextValue: () -> [ContentScrollViewBox]) {
        fatalError("TODO")
    }
    
    static var _isReadableByHost: Bool {
        fatalError("TODO")
    }
    
    static var _includesRemovedValues: Bool {
        fatalError("TODO")
    }
}
