#warning("TODO")

package struct InterfaceIdiom: Hashable {
    package static var phone: InterfaceIdiom { return InterfaceIdiom(role: .phone) }
    package static var pad: InterfaceIdiom { return InterfaceIdiom(role: .pad) }
    package static var tv: InterfaceIdiom { return InterfaceIdiom(role: .tv) }
    package static var watch: InterfaceIdiom { return InterfaceIdiom(role: .watch) }
    package static var carPlay: InterfaceIdiom { return InterfaceIdiom(role: .carPlay) }
    package static var mac: InterfaceIdiom { return InterfaceIdiom(role: .mac) }
    package static var macCatalyst: InterfaceIdiom { return InterfaceIdiom(role: .macCatalyst) }
    package static var vision: InterfaceIdiom { return InterfaceIdiom(role: .vision) }
    package static var clarityUI: InterfaceIdiom { return InterfaceIdiom(role: .clarityUI) }
    package static var complication: InterfaceIdiom { return InterfaceIdiom(role: .complication) }
    package static var widget: InterfaceIdiom { return InterfaceIdiom(role: .widget) }
    package static var touchBar: InterfaceIdiom { return InterfaceIdiom(role: .touchBar) }
    package static var nokit: InterfaceIdiom { return InterfaceIdiom(role: .nokit) }
    
    private var role: Role
}

extension InterfaceIdiom {
    private enum Role {
        case carPlay
        case clarityUI
        case complication
        case widget
        case mac
        case macCatalyst
        case phone
        case pad
        case tv
        case touchBar
        case watch
        case vision
        case nokit
    }
}

package struct AnyInterfaceIdiom: Hashable {
    package static func == (lhs: AnyInterfaceIdiom, rhs: AnyInterfaceIdiom) -> Bool {
        return lhs.base == rhs.base
    }
    
    package static func ~= <T: InterfaceIdiomProtocol>(_ lhs: T, _ rhs: AnyInterfaceIdiom) -> Bool {
        let other = AnyInterfaceIdiom(lhs)
        return other == rhs
    }
    
    private let base: (any AnyInterfaceIdiomBox.Type)
    
    package init(idiom: InterfaceIdiom) {
        switch idiom {
        case .carPlay:
            self.base = InterfaceIdiomBox<CarPlayInterfaceIdiom>.self
        case .clarityUI:
            self.base = InterfaceIdiomBox<ClarityUIInterfaceIdiom>.self
        case .complication:
            self.base = InterfaceIdiomBox<ComplicationInterfaceIdiom>.self
        case .widget:
            self.base = InterfaceIdiomBox<WidgetInterfaceIdiom>.self
        case .mac:
            self.base = InterfaceIdiomBox<MacInterfaceIdiom>.self
        case .macCatalyst:
            self.base = InterfaceIdiomBox<MacCatalystInterfaceIdiom>.self
        case .phone:
            self.base = InterfaceIdiomBox<PhoneInterfaceIdiom>.self
        case .pad:
            self.base = InterfaceIdiomBox<PadInterfaceIdiom>.self
        case .tv:
            self.base = InterfaceIdiomBox<TVInterfaceIdiom>.self
        case .touchBar:
            self.base = InterfaceIdiomBox<TouchBarInterfaceIdiom>.self
        case .watch:
            self.base = InterfaceIdiomBox<WatchInterfaceIdiom>.self
        case .vision:
            self.base = InterfaceIdiomBox<VisionInterfaceIdiom>.self
        case .nokit:
            self.base = InterfaceIdiomBox<NoKitInterfaceIdiom>.self
        default:
            self.base = InterfaceIdiomBox<NoKitInterfaceIdiom>.self
        }
    }
    
    package init<T: InterfaceIdiomProtocol>(_ idiom: T) {
        self.base = InterfaceIdiomBox<T>.self
    }
    
    package func hash(into hasher: inout Hasher) {
        base.hash(into: &hasher)
    }
    
    package func accepts<T: InterfaceIdiomProtocol>(_ type: T.Type) -> Bool {
        return base.accepts(type)
    }
    
    package var interfaceIdiom: InterfaceIdiom {
        return base.interfaceIdiom
    }
}

package protocol InterfaceIdiomProtocol {
    static func accepts<T: InterfaceIdiomProtocol>(_ idiom: T.Type) -> Bool
    static var interfaceIdiom: InterfaceIdiom { get }
}

extension InterfaceIdiomProtocol where Self == CarPlayInterfaceIdiom {
    package static var carPlay: CarPlayInterfaceIdiom {
        return CarPlayInterfaceIdiom()
    }
}

extension InterfaceIdiomProtocol where Self == ClarityUIInterfaceIdiom {
    package static var clarityUI: ClarityUIInterfaceIdiom {
        return ClarityUIInterfaceIdiom()
    }
}

extension InterfaceIdiomProtocol where Self == WidgetInterfaceIdiom {
    package static var widget: WidgetInterfaceIdiom {
        return WidgetInterfaceIdiom()
    }
}

extension InterfaceIdiomProtocol where Self == MacInterfaceIdiom {
    package static var mac: MacInterfaceIdiom {
        return MacInterfaceIdiom()
    }
}

extension InterfaceIdiomProtocol where Self == MacCatalystInterfaceIdiom {
    package static var macCatalyst: MacCatalystInterfaceIdiom {
        return MacCatalystInterfaceIdiom()
    }
}

extension InterfaceIdiomProtocol where Self == PadInterfaceIdiom {
    package static var pad: PadInterfaceIdiom {
        return PadInterfaceIdiom()
    }
}

extension InterfaceIdiomProtocol where Self == TVInterfaceIdiom {
    package static var tv: TVInterfaceIdiom {
        return TVInterfaceIdiom()
    }
}

extension InterfaceIdiomProtocol where Self == TouchBarInterfaceIdiom {
    package static var touchBar: TouchBarInterfaceIdiom {
        return TouchBarInterfaceIdiom()
    }
}

extension InterfaceIdiomProtocol where Self == WatchInterfaceIdiom {
    package static var watch: WatchInterfaceIdiom {
        return WatchInterfaceIdiom()
    }
}

extension InterfaceIdiomProtocol where Self == ComplicationInterfaceIdiom {
    package static var complication: ComplicationInterfaceIdiom {
        return ComplicationInterfaceIdiom()
    }
}

extension InterfaceIdiomProtocol where Self == PhoneInterfaceIdiom {
    package static var phone: PhoneInterfaceIdiom {
        return PhoneInterfaceIdiom()
    }
}

extension InterfaceIdiomProtocol where Self == VisionInterfaceIdiom {
    package static var vision: VisionInterfaceIdiom {
        return VisionInterfaceIdiom()
    }
}

extension InterfaceIdiomProtocol where Self == NoKitInterfaceIdiom {
    package static var nokit: NoKitInterfaceIdiom {
        return NoKitInterfaceIdiom()
    }
}

extension InterfaceIdiomProtocol {
    package static func accepts<T: InterfaceIdiomProtocol>(_ idiom: T.Type) -> Bool {
        return self == idiom
    }
    
    package static func accepts<T: InterfaceIdiomProtocol>(_ idiom: T) -> Bool {
        return self == type(of: idiom)
    }
}

fileprivate struct InterfaceIdiomBox<P: InterfaceIdiomProtocol>: AnyInterfaceIdiomBox, Hashable {
    static var interfaceIdiom: InterfaceIdiom {
        return P.interfaceIdiom
    }
    
    static func accepts<T>(_ idiom: T.Type) -> Bool where T : InterfaceIdiomProtocol {
        return P.accepts(idiom)
    }
    
    static func isEqual(to box: any AnyInterfaceIdiomBox.Type) -> Bool {
        return (box as? P) != nil
    }
    
    static func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(P.self))
    }
}

fileprivate protocol AnyInterfaceIdiomBox {
    static var interfaceIdiom: InterfaceIdiom { get }
    static func accepts<T: InterfaceIdiomProtocol>(_ idiom: T.Type) -> Bool
    static func hash(into hasher: inout Hasher)
    static func isEqual(to box: (any AnyInterfaceIdiomBox.Type)) -> Bool
}

package struct CarPlayInterfaceIdiom: InterfaceIdiomProtocol {
    package static var interfaceIdiom: InterfaceIdiom {
        return .carPlay
    }
}

package struct ClarityUIInterfaceIdiom: InterfaceIdiomProtocol {
    package static var interfaceIdiom: InterfaceIdiom {
        return .clarityUI
    }
}

package struct WidgetInterfaceIdiom: InterfaceIdiomProtocol {
    package static var interfaceIdiom: InterfaceIdiom {
        return .widget
    }
}

package struct MacInterfaceIdiom: InterfaceIdiomProtocol {
    package static var interfaceIdiom: InterfaceIdiom {
        return .mac
    }
}

package struct MacCatalystInterfaceIdiom: InterfaceIdiomProtocol {
    package static var interfaceIdiom: InterfaceIdiom {
        return .macCatalyst
    }
}

package struct PadInterfaceIdiom: InterfaceIdiomProtocol {
    package static var interfaceIdiom: InterfaceIdiom {
        return .pad
    }
}

package struct TVInterfaceIdiom: InterfaceIdiomProtocol {
    package static var interfaceIdiom: InterfaceIdiom {
        return .tv
    }
}

package struct TouchBarInterfaceIdiom: InterfaceIdiomProtocol {
    package static var interfaceIdiom: InterfaceIdiom {
        return .touchBar
    }
}

package struct WatchInterfaceIdiom: InterfaceIdiomProtocol {
    package static var interfaceIdiom: InterfaceIdiom {
        return .watch
    }
}

package struct ComplicationInterfaceIdiom: InterfaceIdiomProtocol {
    package static var interfaceIdiom: InterfaceIdiom {
        return .complication
    }
}

package struct PhoneInterfaceIdiom: InterfaceIdiomProtocol {
    package static var interfaceIdiom: InterfaceIdiom {
        return .phone
    }
}

package struct VisionInterfaceIdiom: InterfaceIdiomProtocol {
    package static var interfaceIdiom: InterfaceIdiom {
        return .vision
    }
}

package struct NoKitInterfaceIdiom: InterfaceIdiomProtocol {
    package static var interfaceIdiom: InterfaceIdiom {
        return .nokit
    }
}

struct InterfaceIdiomPredicate<T> {
    // TODO
}

extension EnvironmentValues {
    package var viewGraphIdiom: ViewGraphHost.Idiom {
        get {
            return self[__Key__interfaceIdiom.self]
        }
        set {
            self[__Key__interfaceIdiom.self] = newValue
        }
    }
    
    // TODO: Entry Macro
    fileprivate struct __Key__interfaceIdiom: EnvironmentKey {
        static var defaultValue: ViewGraphHost.Idiom {
            return .phone
        }
    }
}

package struct InterfaceIdiomInput: ViewInput {
    package static var defaultValue: AnyInterfaceIdiom? {
        return nil
    }
}

extension _GraphInputs {
    package var interfaceIdiom: AnyInterfaceIdiom {
        return self[InterfaceIdiomInput.self] ?? AnyInterfaceIdiom(idiom: .phone)
    }
}
