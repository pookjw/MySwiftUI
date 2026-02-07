internal import UIKit
internal import MySwiftUICore

class UIKitContentScrollViewBridge {
    weak var viewController: UIViewController? = nil // 0x10
    private var lastSeed: VersionSeed = .invalid // 0x3a8
    private var bridgeSetEdges: [UInt: ObjectIdentifier] = [:] // 0x3b0
    private var pendingScrollViews: [ContentScrollViewBox]? = nil // 0x3b8
    var pixelLength: CGFloat = 1
    
    init() {
    }
    
    // TODO
}

struct ContentScrollViewBox {
    // TODO
}

struct ContentScrollViewPreferenceKey: HostPreferenceKey {
    static var defaultValue: Never {
        fatalError("TODO")
    }
    
    static func reduce(value: inout Never, nextValue: () -> Never) {
        fatalError("TODO")
    }
    
    static var _isReadableByHost: Bool {
        fatalError("TODO")
    }
    
    static var _includesRemovedValues: Bool {
        fatalError("TODO")
    }
}
