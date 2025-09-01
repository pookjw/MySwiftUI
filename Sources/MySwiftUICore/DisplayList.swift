#warning("TODO")

internal import CoreGraphics

package struct DisplayList {
    package var items: [Item]
    package var features: Features
    package var properties: Properties
}

extension DisplayList {
    package struct Item {
        var frame: CGRect
        var version: DisplayList.Version
        var value: Item.Value
        var identity: _DisplayList_Identity
    }
}

extension DisplayList.Item {
    package enum Value {
        
    }
}

extension DisplayList {
    package struct Features {
        
    }
}

extension DisplayList {
    package struct Properties {
        
    }
}

extension DisplayList {
    package struct Version {
        package private(set) var value: Int
        
        package init() {
            value = 0
        }
    }
}

extension DisplayList {
    class ViewUpdater {
        // TODO
    }
}

extension DisplayList.ViewUpdater {
    struct Platform {
        private var encoding: DisplayList.ViewUpdater.Platform.Encoding
    }
}

extension DisplayList.ViewUpdater.Platform {
    fileprivate struct Encoding: OptionSet {
        // TODO
        let rawValue: UInt
        
        init(rawValue: UInt) {
            self.rawValue = rawValue
        }
        
        // method 많음
    }
}

extension DisplayList {
    class ViewRenderer {
        private let platform: DisplayList.ViewUpdater.Platform
        private var configuration: _RendererConfiguration
        private weak var host: ViewRendererHost?
        private var state: DisplayList.ViewRenderer.State
        private var configChanged: Bool
        
        // TODO
        init() {
            fatalError()
        }
    }
}

extension DisplayList.ViewRenderer {
    fileprivate enum State {
        case none
        case updating
        case rasterizing
    }
}

package struct _DisplayList_Identity {
    var value: UInt32
}
