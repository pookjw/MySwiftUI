// F37E3733E490AA5E3BDC045E3D34D9F8

#warning("TODO")
internal import CoreGraphics
internal import _MySwiftUIShims
private import _QuartzCorePrivate
internal import QuartzCore
internal import Spatial
internal import AttributeGraph
internal import RenderBox

package struct DisplayList {
    package var items: [DisplayList.Item]
    package var features: DisplayList.Features
    package var properties: DisplayList.Properties
    
    package init() {
        items = []
        features = DisplayList.Features(rawValue: 0)
        properties = DisplayList.Properties(rawValue: 0)
    }
    
    init(_ item: DisplayList.Item) {
        // x29 = sp + 0xe0
        // x22 = sp + 0x60
        /*
         item = x20 / sp + 0x60
         x19 = return pointer
         */
        
        switch item.value {
        case .empty:
            items = []
            features = DisplayList.Features(rawValue: 0)
            properties = DisplayList.Properties(rawValue: 0)
        default:
            items = [item]
            features = item.features
            properties = item.properties
        }
    }
    
    mutating func append(contentsOf other: DisplayList) {
        fatalError("TODO")
    }
}

extension DisplayList {
    package struct Item: Equatable, ProtobufEncodableMessage, ProtobufDecodableMessage {
        package static func == (lhs: DisplayList.Item, rhs: DisplayList.Item) -> Bool {
            return (lhs.identity == rhs.identity) && (lhs.version == rhs.version)
        }
        
        var frame: CGRect
        var version: DisplayList.Version
        var value: DisplayList.Item.Value
        var identity: _DisplayList_Identity
        
        var position: CGPoint {
            return frame.origin
        }
        
        var size: CGSize {
            return frame.size
        }
        
        init(_ value: DisplayList.Item.Value, frame: CGRect, identity: _DisplayList_Identity, version: DisplayList.Version) {
            self.frame = frame
            self.value = value
            self.identity = identity
            self.version = version
        }
        
        var features: DisplayList.Features {
            switch value {
            case .content(let content):
                // <+60>
                switch content.value {
                case .sdfMask(let displayList, _): // 0x6
                    // <+908>
                    return displayList.features
                case .platformView(let factory): // 0x8
                    // <+948>
                    return factory.features
                case .text(let contentView, _): // 0xa
                    // <+96>
                    fatalError("TODO")
                case .flattened(let displayList, _, _): // 0xb
                    // <+476>
                    return displayList.features.union(.flattened)
                case .view(_): // 0xd
                    // <+936>
                    return .views
                case .placeholder(_): // 0xe
                    // <+920>
                    return .views
                default:
                    // <+1128>
                    return []
                }
            case .effect(let effect, let displayList):
                // <+356>
                return effect.features.union(displayList.features)
            case .states(let array):
                // <+328>
                let count = array.count
                if count == 0 {
                    return .states
                } else if count >= 8 {
                    // <+504>
                    if count >= 16 {
                        // <+664>
                        fatalError("TODO")
                    } else {
                        // <+512>
                        fatalError("TODO")
                    }
                } else {
                    return .states
                }
            case .empty:
                // <+1128>
                return []
            }
        }
        
        var properties: DisplayList.Properties {
            switch value {
            case .content(let content):
                // <+52>
                switch content.value {
                case .sdfMask(_, _):
                    // <+72>
                    fatalError("TODO")
                case .flattened(_, _, _):
                    // <+72>
                    fatalError("TODO")
                default:
                    // <+120>
                    return DisplayList.Properties(rawValue: 0)
                }
            case .effect(_, _):
                // <+128>
                fatalError("TODO")
            case .states(_):
                // <+92>
                fatalError("TODO")
            case .empty:
                // <+120>
                return DisplayList.Properties(rawValue: 0)
            }
        }
        
        func nextUpdate(after time: Time) -> Time {
            fatalError("TODO")
        }
        
        func forEachIdentity(_: (_DisplayList_Identity, inout Bool) -> Void) -> Bool {
            fatalError("TODO")
        }
        
        func forEachRBDisplayList(_: (RBDisplayListContents) -> Void) {
            fatalError("TODO")
        }
        
        mutating func canonicalize(options: DisplayList.Options = .defaultValue) {
            // options = w26
            guard !options.contains(.disableCanonicalization) else {
                return
            }
            
            // self = x28
            switch value {
            case .content(let content):
                guard !frame.isEmpty || features.contains(.required) else {
                    return
                }
                
                // <+264>
                switch content.value {
                case .color(let colorView):
                    // <+1232>
                    if (colorView.color.base.linearRed == 0) &&
                        (colorView.color.base.linearGreen == 0) &&
                        (colorView.color.base.linearBlue == 0) &&
                        (colorView.color.base.opacity == 0)
                    {
                        // <+4268>
                        value = .empty
                        identity = _DisplayList_Identity(decodedValue: 0)
                    } else {
                        // <+4072>
                        // nop
                    }
                case .shape(_, _, _):
                    // <+1068>
                    fatalError("TODO")
                case .shadow(_, _):
                    // <+1152>
                    fatalError("TODO")
                case .text(_, _):
                    // <+1200>
                    fatalError("TODO")
                case .flattened(_, _, _):
                    // <+300>
                    fatalError("TODO")
                default:
                    // <+4072>
                    fatalError("TODO")
                }
            case .effect(let effect, let displayList):
                // <+216>
                fatalError("TODO")
            default:
                // <+4316>
                return
            }
        }
        
        private func canonicalizeIdentityEffect(list: DisplayList) {
            fatalError("TODO")
        }
        
        func canonicalizePlatformEffect(options: DisplayList.Options) {
            fatalError("TODO")
        }
        
        func matchesTopLevelStructure(of item: DisplayList.Item) -> Bool {
            fatalError("TODO")
        }
        
        private func opaqueContentPath() -> (Path, FillStyle)? {
            fatalError("TODO")
        }
        
        private func paint(in: CGRect) -> AnyResolvedPaint? {
            fatalError("TODO")
        }
        
        private func backdropFilter(size: CGSize) -> GraphicsFilter? {
            fatalError("TODO")
        }
        
        func composite(_: DisplayList.Item, above: Bool) {
            fatalError("TODO")
        }
        
        func addDrawingGroup(contentSeed: DisplayList.Seed) {
            fatalError("TODO")
        }
        
        private func addExtent(to: inout CGRect) {
            fatalError("TODO")
        }
        
        var isSeparatedMask: Bool {
            fatalError("TODO")
        }
        
        func canMergeWithPlatformState(state: DisplayList.ViewUpdater.Model.PlatformState) -> Bool {
            // w23
            let separatedState = state.separatedState
            if
                case .effect(let effect, _) = value,
                case .platformGroup(_) = effect,
                separatedState == .separated
            {
                return false
            }
            
            // <+72>
            // state = x21
            // d10
            let zPosition = state.zPosition
            // w22
            let renderingTechnique = state.renderingTechnique
            // x24, x25
            let hoverEffectState = state.remoteEffects.hoverEffectState
            // w19
            let hitTestsAsOpaque = state.hitTestsAsOpaque
            // d8, d9
            let size = frame.size
            
            // <+96>
            fatalError("TODO")
        }
        
        func offset3D(by: Size3D) {
            fatalError("TODO")
        }
        
        func collectIdentities(container: inout [_DisplayList_Identity]) {
            fatalError("TODO")
        }
    }
    
    struct Seed: Hashable {
        private(set) var value: UInt16
        
        init() {
            value = 0
        }
        
        init(decodedValue: UInt16) {
            value = decodedValue
        }
        
        init(_ version: DisplayList.Version) {
            var w9 = version.value
            if w9 == 0 {
                value = 0
            } else {
                var w10 = (w9 &>> 0x10)
                w10 = (w10 &+ (w10 &<< 5))
                w9 = (w10 ^ w9)
                w10 = 1
                w9 = (w10 | (w9 &<< 1))
                value = UInt16(w9)
            }
        }
        
        mutating func invalidate() {
            guard value != 0 else {
                return
            }
            value = (~value | 1)
        }
        
        static var undefined: DisplayList.Seed {
            return DisplayList.Seed(decodedValue: 2)
        }
    }
}

extension DisplayList.Item {
    enum Value {
        case content(DisplayList.Content)
        case effect(DisplayList.Effect, DisplayList)
        case states([(StrongHash, DisplayList)])
        case empty
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
        package static var views: DisplayList.Features { return DisplayList.Features(rawValue: 1 << 1) }
        
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
        package static var mayNotInsertCALayers: DisplayList.Properties { return DisplayList.Properties(rawValue: 1 << 9) }
        
        
        package let rawValue: UInt32
        
        package init(rawValue: UInt32) {
            self.rawValue = rawValue
        }
    }
}

extension DisplayList {
    package struct Version: Comparable, Hashable {
        @safe private static nonisolated(unsafe) var lastValue: Int = 0
        
        package static func < (lhs: DisplayList.Version, rhs: DisplayList.Version) -> Bool {
            return lhs.value < rhs.value
        }
        
        package private(set) var value: Int
        
        package init() {
            self.value = 0
        }
        
        package init(decodedValue: Int) {
            DisplayList.Version.lastValue = max( DisplayList.Version.lastValue, decodedValue)
            self.value = decodedValue
        }
        
        package init(forUpdate: Void) {
            let value = DisplayList.Version.lastValue + 1
            DisplayList.Version.lastValue = value
            self.value = value
        }
        
        package mutating func combine(with other: DisplayList.Version) {
            self.value = max(other.value, self.value)
        }
    }
}

extension DisplayList {
    enum Effect {
//        case backdropGroup(DisplayList.BackdropGroup)
//        case archive(DisplayList.ArchiveIDs?)
//        case properties(DisplayList.Properties)
        case platformGroup(any PlatformGroupFactory)
//        case opacity(Float)
//        case blendMode(GraphicsBlendMode)
//        case clip(Path, FillStyle, GraphicsContext.ClipOptions)
//        case mask(DisplayList, GraphicsContext.ClipOptions)
//        case sdfShape(SDFShape)
//        case transform(DisplayList.Transform)
//        case filter(GraphicsFilter)
//        case animation(_DisplayList_AnyEffectAnimation)
//        case contentTransition(ContentTransition.State)
//        case view(_DisplayList_ViewFactory)
//        case accessibility([AccessibilityNodeAttachment])
//        case platform(DisplayList.PlatformEffect)
//        case state(StrongHash)
//        case interpolatorRoot(DisplayList.InterpolatorGroup, contentOrigin: CGPoint, SwiftOffset: CGSize)
//        case interpolatorLayer(DisplayList.InterpolatorGroup, serial: UInt32)
//        case interpolatorAnimation(DisplayList.InterpolatorAnimation)
//        case identity
//        case geometryGroup
//        case compositingGroup
        
        var features: DisplayList.Features {
            fatalError("TODO")
        }
    }
}

extension DisplayList {
    struct Index {
        var identity = _DisplayList_Identity(decodedValue: 0)
        var serial: UInt32 = 0
        fileprivate var archiveIdentity = _DisplayList_Identity(decodedValue: 0)
        fileprivate var archiveSerial: UInt32 = 0
        fileprivate var restored = DisplayList.Index.RestoreOptions(rawValue: 0)
        
        init() {}
        
        @inline(__always)
        mutating func enter(identity: _DisplayList_Identity) -> DisplayList.Index {
            var old = self
            if identity.value != 0 {
                self.identity = identity
                self.serial = 0
                self.restored = .unknown1
            } else {
                old.serial += 1
                self.serial = old.serial
                self.restored = []
            }
            
            return old
        }
        
        @inline(__always)
        mutating func leave(index: DisplayList.Index) {
            let restored = restored
            if restored.contains(.unknown4) || restored.contains(.unknown8) {
                let oldIdentity = identity
                let oldSerial = serial
                
                if restored.contains(.unknown4) {
                    // <+1792>
                    self.identity = archiveIdentity
                    self.serial = archiveSerial
                }
                
                if restored.contains([.unknown8]) {
                    // <+1804>
                    self.archiveIdentity = oldIdentity
                    self.archiveSerial = oldSerial
                }
            }
            
            if restored.contains(.unknown1) {
                // <+1812>
                self.identity = index.identity
                self.serial = index.serial
            }
            
            if restored.contains(.unknown2) {
                // <+1820>
                self.archiveIdentity = index.archiveIdentity
                self.archiveSerial = index.archiveSerial
            }
        }
    }
}

extension DisplayList.Index {
    struct ID {
        private var identity: _DisplayList_Identity
        private var serial: UInt32
        private var archiveIdentity: _DisplayList_Identity
        private var archiveSerial: UInt32
    }
    
    fileprivate struct RestoreOptions: OptionSet {
        static let unknown1 = RestoreOptions(rawValue: 1 << 0)
        static let unknown2 = RestoreOptions(rawValue: 1 << 1)
        static let unknown4 = RestoreOptions(rawValue: 1 << 2)
        static let unknown8 = RestoreOptions(rawValue: 1 << 3)
        
        let rawValue: UInt8
    }
}

protocol AnySeparatedOptionKey {
    // TODO
}

protocol _DisplayList_AnyEffectAnimator {
    // TODO
}

struct _DisplayList_StableIdentity: Sendable {
    var hash: StrongHash
    var serial: UInt32
}

struct _DisplayList_StableIdentityMap: Sendable {
    fileprivate var map: [_DisplayList_Identity: _DisplayList_StableIdentity]
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

@safe fileprivate nonisolated(unsafe) var lastIdentity: UInt32 = 0

package struct _DisplayList_Identity: Hashable, Codable, CustomStringConvertible, Sendable {
    var value: UInt32
    
    init() {
        let identity = (lastIdentity &+ 1)
        lastIdentity = identity
        self.value = identity
    }
    
    init(decodedValue: UInt32) {
        self.value = decodedValue
    }
    
    static var none: _DisplayList_Identity {
        return _DisplayList_Identity(decodedValue: 0)
    }
    
    package var description: String {
        fatalError("TODO")
    }
}

extension DisplayList {
    struct Key: @unsafe PreferenceKey {
        static var _includesRemovedValues: Bool {
            return true
        }
        
        @safe static nonisolated(unsafe) let defaultValue = DisplayList()
        
        static func reduce(value: inout DisplayList, nextValue: () -> DisplayList) {
            value.append(contentsOf: nextValue())
        }
    }
}

extension DisplayList {
    struct Content {
        var value: DisplayList.Content.Value
        var seed: DisplayList.Seed
        
        init(_ value: DisplayList.Content.Value, seed: DisplayList.Seed) {
            self.value = value
            self.seed = seed
        }
    }
}

extension DisplayList.Content {
    enum Value {
        case backdrop(BackdropEffect)
        case color(ColorView)
        case chameleonColor(DisplayList.ChameleonColor)
        case image(GraphicsImage)
        case shape(Path, AnyResolvedPaint, FillStyle)
        case sdfShape(SDFShape)
        case sdfMask(DisplayList, Material.Layer.SDFLayer)
        case shadow(Path, ResolvedShadowStyle)
        case platformView(any PlatformViewFactory)
        case platformLayer(any PlatformLayerFactory)
        case text(StyledTextContentView, CGSize)
        case flattened(DisplayList, CGPoint, RasterizationOptions)
        case drawing
        case view(any _DisplayList_ViewFactory)
        case placeholder(id: _DisplayList_Identity)
    }
}

extension DisplayList {
    struct Options: OptionSet, ViewInput {
        let rawValue: UInt8
        
        init(rawValue: UInt8) {
            self.rawValue = rawValue
        }
        
        static var defaultValue: DisplayList.Options {
            return DisplayList.Options(rawValue: 0)
        }
        
        static var disableCanonicalization: DisplayList.Options {
            return DisplayList.Options(rawValue: 1 << 0)
        }
    }
}

struct _DisplayList_StableIdentityScope: ViewInput {
    static let defaultValue = WeakAttribute<_DisplayList_StableIdentityScope>()
    
    let root: _DisplayList_StableIdentityRoot
    let hash: StrongHash
    var map: _DisplayList_StableIdentityMap
    var serial: UInt32
    
    mutating func pushIdentity(identity: _DisplayList_Identity) {
        map.map[identity] = makeIdentity()
    }
    
    mutating func makeIdentity() -> _DisplayList_StableIdentity {
        let serial = (serial &+ 1)
        self.serial = serial
        return _DisplayList_StableIdentity(hash: hash, serial: serial)
    }
}

final class _DisplayList_StableIdentityRoot {
    private var scopes: [WeakAttribute<_DisplayList_StableIdentityScope>]
    private var map: _DisplayList_StableIdentityMap?
    
    init() {
        self.scopes = []
        self.map = nil
    }
    
    subscript(_ identity: _DisplayList_Identity) -> _DisplayList_StableIdentity? {
        fatalError("TODO")
    }
}

extension _ViewInputs {
    func pushIdentity(_ identity: _DisplayList_Identity) {
        guard base.needsStableDisplayListIDs else {
            return
        }
        
        self[_DisplayList_StableIdentityScope.self].projectedValue!.value.pushIdentity(identity: identity)
    }
}

extension DisplayList {
    struct ChameleonColor {
        private var fallback: Color.ResolvedHDR
        private var allowedDynamicRange: Image.DynamicRange
        private var filters: [GraphicsFilter]
    }
}
