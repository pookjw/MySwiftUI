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
        
        init(definition: PlatformViewDefinition.Type) {
            let system = definition.system
            self.encoding = Encoding(rawValue: UInt(bitPattern: ObjectIdentifier(definition)) | UInt(system.base.rawValue))
        }
        
        // TODO
        // method 많음
    }
}

extension DisplayList.ViewUpdater.Platform {
    fileprivate struct Encoding: OptionSet {
        // TODO
        let rawValue: UInt
    }
}

extension DisplayList {
    class ViewRenderer {
        private let platform: DisplayList.ViewUpdater.Platform
        private var configuration = _RendererConfiguration(renderer: .default)
        private weak var host: ViewRendererHost? = nil
        private var state: DisplayList.ViewRenderer.State = .none
        private var configChanged: Bool = false
        
        init(platform: DisplayList.ViewUpdater.Platform) {
            self.platform = platform
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
