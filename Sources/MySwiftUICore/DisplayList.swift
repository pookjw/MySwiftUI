#warning("TODO")

internal import CoreGraphics

package struct DisplayList {
    package var items: [Item] = []
    package var features = DisplayList.Features(rawValue: 0)
    package var properties = DisplayList.Properties(rawValue: 0)
    
    package init() {
    }
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
    package struct Features: OptionSet {
        package static var required: DisplayList.Features { return DisplayList.Features(rawValue: 1 << 0) }
        package static var animations: DisplayList.Features { return DisplayList.Features(rawValue: 1 << 2) }
        package static var dynamicContent: DisplayList.Features { return DisplayList.Features(rawValue: 1 << 3) }
        package static var interpolatorLayers: DisplayList.Features { return DisplayList.Features(rawValue: 1 << 4) }
        package static var interpolatorRoots: DisplayList.Features { return DisplayList.Features(rawValue: 1 << 5) }
        package static var stateEffects: DisplayList.Features { return DisplayList.Features(rawValue: 1 << 6) }
        package static var states: DisplayList.Features { return DisplayList.Features(rawValue: 1 << 7) }
        package static var entities: DisplayList.Features { return DisplayList.Features(rawValue: 1 << 8) }
        package static var flattened: DisplayList.Features { return DisplayList.Features(rawValue: 1 << 9) }
        package static var platformViews: DisplayList.Features { return DisplayList.Features(rawValue: 1 << 10) }
        
        package let rawValue: UInt16
        
        package init(rawValue: UInt16) {
            self.rawValue = rawValue
        }
    }
}

extension DisplayList {
    package struct Properties: OptionSet {
        package static var foregroundLayer: DisplayList.Properties { return DisplayList.Properties(rawValue: 1 << 0) }
        package static var ignoresEvents: DisplayList.Properties { return DisplayList.Properties(rawValue: 1 << 1) }
        package static var privacySensitive: DisplayList.Properties { return DisplayList.Properties(rawValue: 1 << 2) }
        package static var archivesInteractiveControls: DisplayList.Properties { return DisplayList.Properties(rawValue: 1 << 3) }
        package static var secondaryForegroundLayer: DisplayList.Properties { return DisplayList.Properties(rawValue: 1 << 4) }
        package static var tertiaryForegroundLayer: DisplayList.Properties { return DisplayList.Properties(rawValue: 1 << 5) }
        package static var quaternaryForegroundLayer: DisplayList.Properties { return DisplayList.Properties(rawValue: 1 << 6) }
        package static var screencaptureProhibited: DisplayList.Properties { return DisplayList.Properties(rawValue: 1 << 7) }
        package static var hiddenForReuse: DisplayList.Properties { return DisplayList.Properties(rawValue: 1 << 8) }
        
        
        package let rawValue: UInt32
        
        package init(rawValue: UInt32) {
            self.rawValue = rawValue
        }
    }
}

extension DisplayList {
    package struct Version: Comparable, Hashable {
        private static nonisolated(unsafe) var lastValue: Int = 0
        
        package static func < (lhs: DisplayList.Version, rhs: DisplayList.Version) -> Bool {
            return lhs.value < rhs.value
        }
        
        package private(set) var value: Int
        
        package init() {
            self.value = 0
        }
        
        package init(decodedValue: Int) {
            unsafe DisplayList.Version.lastValue = max(unsafe DisplayList.Version.lastValue, decodedValue)
            self.value = decodedValue
        }
        
        package init(forUpdate: Void) {
            let value = unsafe DisplayList.Version.lastValue + 1
            unsafe DisplayList.Version.lastValue = value
            self.value = value
        }
        
        package mutating func combine(with other: DisplayList.Version) {
            self.value = max(other.value, self.value)
        }
    }
}

extension DisplayList {
    final class ViewUpdater: ViewRendererBase {
        var rootPlatform: Platform {
            fatalError("TODO")
        }
        
        var exportedObject: AnyObject? {
            fatalError("TODO")
        }
        
        func render(rootView: AnyObject, from displayList: DisplayList, time: Time, version: DisplayList.Version, maxVersion: DisplayList.Version, environment: DisplayList.ViewRenderer.Environment) -> Time {
            fatalError("TODO")
        }
        
        func renderAsync(to displayList: DisplayList, time: Time, targetTimestamp: Time?, version: DisplayList.Version, maxVersion: DisplayList.Version) -> Time? {
            fatalError("TODO")
        }
        
        func destroy(rootView: AnyObject) {
            fatalError("TODO")
        }
        
        var viewCacheIsEmpty: Bool {
            fatalError("TODO")
        }
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
    package final class ViewRenderer: ViewRendererBase {
        private let platform: DisplayList.ViewUpdater.Platform
        private(set) var configuration = _RendererConfiguration(renderer: .default)
        package weak var host: ViewRendererHost? = nil
        private var state: DisplayList.ViewRenderer.State = .none
        private(set) var renderer: ViewRendererBase? = nil
        private(set) var configChanged: Bool = false
        
        init(platform: DisplayList.ViewUpdater.Platform) {
            self.platform = platform
        }
        
        init(definition: PlatformViewDefinition.Type) {
            fatalError("TODO")
        }
        
        var definition: PlatformViewDefinition.Type {
            fatalError("TODO")
        }
        
        var rootPlatform: DisplayList.ViewUpdater.Platform {
            fatalError("TODO")
        }
        
        var exportedObject: AnyObject? {
            fatalError("TODO")
        }
        
        func render(rootView: AnyObject, from displayList: DisplayList, time: Time, version: DisplayList.Version, maxVersion: DisplayList.Version, environment: Environment) -> Time {
            let renderer = updateRenderer(rootView: rootView)
            return renderer.render(rootView: rootView, from: displayList, time: time, version: version, maxVersion: maxVersion, environment: environment)
        }
        
        func renderAsync(to displayList: DisplayList, time: Time, targetTimestamp: Time?, version: DisplayList.Version, maxVersion: DisplayList.Version) -> Time? {
            fatalError("TODO")
        }
        
        func destroy(rootView: AnyObject) {
            fatalError("TODO")
        }
        
        var viewCacheIsEmpty: Bool {
            fatalError("TODO")
        }
        
        fileprivate func updateRenderer(rootView: AnyObject) -> ViewRendererBase {
            fatalError("TODO")
        }
    }
}

protocol ViewRendererBase: AnyObject {
    var rootPlatform: DisplayList.ViewUpdater.Platform {
        get
    }
    
    var exportedObject: AnyObject? {
        get
    }
    
    func render(rootView: AnyObject, from displayList: DisplayList, time: Time, version: DisplayList.Version, maxVersion: DisplayList.Version, environment: DisplayList.ViewRenderer.Environment) -> Time
    
    func renderAsync(to displayList: DisplayList, time: Time, targetTimestamp: Time?, version: DisplayList.Version, maxVersion: DisplayList.Version) -> Time?
    
    func destroy(rootView: AnyObject)
    
    var viewCacheIsEmpty: Bool {
        get
    }
}

extension DisplayList.ViewRenderer {
    struct Environment: Equatable {
        static var invalid: DisplayList.ViewRenderer.Environment {
            return DisplayList.ViewRenderer.Environment(contentsScale: 0)
        }
        
        var contentsScale: CGFloat
        
        init(contentsScale: CGFloat) {
            self.contentsScale = contentsScale
        }
    }
    
    fileprivate enum State {
        case none
        case updating
        case rasterizing
    }
}

package struct _DisplayList_Identity {
    var value: UInt32
}
