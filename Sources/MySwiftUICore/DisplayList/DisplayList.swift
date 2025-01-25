import CoreGraphics
import Foundation

package struct DisplayList {
    package let items: [Item]
    package let features: Features
    package let properties: Properties
    
    package init() {
        items = []
        features = []
        properties = []
    }
    
    package init(_ item: Item) {
        let items: [Item]
        let features: Features
        let properties: Properties
        
        switch item.value {
        case .empty:
            items = []
            features = []
            properties = []
        default:
            fatalError()
        }
        
        self.items = items
        self.features = features
        self.properties = properties
    }
    
    func nextUpdate(after time: Time) -> Time {
        guard time != .infinity else {
            return time
        }
        
        fatalError()
    }
}

extension DisplayList {
    package struct Item: Equatable {
        package enum Value {
            case content(DisplayList.Content)
            case effect(DisplayList.Effect, DisplayList)
            case states([(StrongHash, DisplayList)])
            case empty
        }
        
        package var frame: CGRect
        package var version: Version
        package var value: Value
        fileprivate var identity: _DisplayList_Identity
        
        package var position: CGPoint { frame.origin }
        package var size: CGSize { frame.size }
        
        package var features: Features {
            get {
                Features(rawValue: UInt16(identity.value))
            }
            set {
                identity = _DisplayList_Identity(decodedValue: UInt32(newValue.rawValue))
            }
        }
        
        package var properties: Properties {
            // value를 switch 돌면서 뭔가 하는 것 같다
            fatalError("TODO")
        }
        
        fileprivate init(_ value: Value, frame: CGRect, identity: _DisplayList_Identity, version: Version) {
            self.value = value
            self.frame = frame
            self.identity = identity
            self.version = version
        }
        
        package func nextUpdate(after time: Time) -> Time {
            fatalError()
        }
        
        fileprivate func canonicalizeIdentityEffectlist(list: DisplayList) {
            fatalError("TODO")
        }
        
        fileprivate func opaqueContentPath() -> (Path, FillStyle) {
            fatalError("TODO")
        }
        
        fileprivate func paint(in rect /* frame? bounds? */: CGRect) -> AnyResolvedPoint? {
            fatalError("TODO")
        }
        
        fileprivate func colorMatrix(size: CGSize) -> (_ColorMatrix, DisplayList)? {
            fatalError("TODO")
        }
        
        fileprivate func addExtent(to rect: CGRect) {
            fatalError("TODO")
        }
        
        fileprivate func print(into printer: inout SExpPrinter) {
            fatalError("TODO")
        }
        
        fileprivate func printMinimally(into printer: inout SExpPrinter) {
            fatalError("TODO")
        }
        
        fileprivate func rewriteVibrancyFilterAsBackdrop(matrix: _ColorMatrix, list: DisplayList) {
            fatalError("TODO")
        }
        
        fileprivate func discardContainingClips(state: inout DisplayList.ViewUpdater.Model.State) -> Bool {
            fatalError("TODO")
        }
        
        static package func == (lhs: DisplayList.Item, rhs: DisplayList.Item) -> Bool {
            lhs.identity == rhs.identity && lhs.version == rhs.version
        }
    }
}

extension DisplayList {
    package struct Content {}
}

extension DisplayList {
    package struct Effect {}
}

extension DisplayList {
    package struct Version: Hashable, Comparable, Sendable {
        static private nonisolated(unsafe) var lastValue = 0
        
        static package func < (lhs: DisplayList.Version, rhs: DisplayList.Version) -> Bool {
            lhs.value < rhs.value
        }
        
        var value: Int
        
        init() {
            value = 0
        }
        
        init(decodedValue value: Int) {
            Version.lastValue = max(Version.lastValue, value)
            self.value = value
        }
        
        init(forUpdate: ()) {
            let lastValue = Version.lastValue + 1
            Version.lastValue = lastValue
            value = lastValue
        }
        
        mutating func combine(with other: Version) {
            value = max(value, other.value)
        }
    }
}

extension DisplayList {
    package struct Features: OptionSet, SetAlgebra, RawRepresentable, Equatable {
        package let rawValue: UInt16
        
        static var required: Features { Features(rawValue: 1 << 0) }
        static var views: Features { Features(rawValue: 1 << 1) }
        static var animations: Features { Features(rawValue: 1 << 2) }
        static var dynamicContent: Features { Features(rawValue: 1 << 3) }
        static var interpolatorLayers: Features { Features(rawValue: 1 << 4) }
        static var interpolatorRoots: Features { Features(rawValue: 1 << 5) }
        static var stateEffects: Features { Features(rawValue: 1 << 6) }
        static var states: Features { Features(rawValue: 1 << 7) }
        static var flattened: Features { Features(rawValue: 1 << 9) /* 0x200 = 512 = 2^9 */ }
        
        package init(rawValue: UInt16) {
            self.rawValue = rawValue
        }
    }
}

extension DisplayList {
    package struct Seed {}
}

extension DisplayList {
    package struct Properties: OptionSet, Equatable {
        static var foregroundLayer: Properties { Properties(rawValue: 1 << 0) }
        static var ignoresEvents: Properties { Properties(rawValue: 1 << 1) }
        static var privacySensitive: Properties { Properties(rawValue: 1 << 2) }
        static var archivesInteractiveControls: Properties { Properties(rawValue: 1 << 3) }
        static var secondaryForegroundLayer: Properties { Properties(rawValue: 1 << 4) }
        static var tertiaryForegroundLayer: Properties { Properties(rawValue: 1 << 5) }
        static var quaternaryForegroundLayer: Properties { Properties(rawValue: 1 << 6) }
        static var screencaptureProhibited: Properties { Properties(rawValue: 1 << 7) }
        
        package let rawValue: UInt8
        
        package init(rawValue: UInt8) {
            self.rawValue = rawValue
        }
    }
}

private nonisolated(unsafe) var lastIdentity: UInt32 = 0

struct _DisplayList_Identity: Codable, Hashable, CustomStringConvertible, Sendable {
    let value: UInt32
    
    init() {
        value = lastIdentity
    }
    
    init(decodedValue: UInt32) {
        value = decodedValue
    }
    
    var description: String {
        var string = String()
        string.append(value.description)
        return string
    }
}
