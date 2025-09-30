#warning("TODO")

struct InterfaceIdiom: Hashable {
    static var phone: InterfaceIdiom { return InterfaceIdiom(role: .phone) }
    static var pad: InterfaceIdiom { return InterfaceIdiom(role: .pad) }
    static var tv: InterfaceIdiom { return InterfaceIdiom(role: .tv) }
    static var watch: InterfaceIdiom { return InterfaceIdiom(role: .watch) }
    static var carPlay: InterfaceIdiom { return InterfaceIdiom(role: .carPlay) }
    static var mac: InterfaceIdiom { return InterfaceIdiom(role: .mac) }
    static var macCatalyst: InterfaceIdiom { return InterfaceIdiom(role: .macCatalyst) }
    static var vision: InterfaceIdiom { return InterfaceIdiom(role: .vision) }
    static var clarityUI: InterfaceIdiom { return InterfaceIdiom(role: .clarityUI) }
    static var complication: InterfaceIdiom { return InterfaceIdiom(role: .complication) }
    static var widget: InterfaceIdiom { return InterfaceIdiom(role: .widget) }
    static var touchBar: InterfaceIdiom { return InterfaceIdiom(role: .touchBar) }
    static var nokit: InterfaceIdiom { return InterfaceIdiom(role: .nokit) }
    
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
    private let base: (any AnyInterfaceIdiomBox.Type)
    
    init(idiom: InterfaceIdiom) {
        fatalError("TODO")
    }
    
    init<T: InterfaceIdiomProtocol>(_ idiom: T) {
        self.base = InterfaceIdiomBox<T>.self
    }
}

protocol InterfaceIdiomProtocol {
    func accepts<T: InterfaceIdiomProtocol>(_ idiom: T.Type) -> Bool
    var interfaceIdiom: InterfaceIdiom { get }
}

fileprivate struct InterfaceIdiomBox<P: InterfaceIdiomProtocol>: AnyInterfaceIdiomBox, Hashable {
    func accepts<T>(_ idiom: T.Type) -> Bool where T : InterfaceIdiomProtocol {
        fatalError("TODO")
    }
    
    func isEqual(to box: any AnyInterfaceIdiomBox.Type) -> Bool {
        fatalError("TODO")
    }
}

fileprivate protocol AnyInterfaceIdiomBox {
    func accepts<T: InterfaceIdiomProtocol>(_ idiom: T.Type) -> Bool
    func hash(into hasher: inout Hasher)
    func isEqual(to box: (any AnyInterfaceIdiomBox.Type)) -> Bool
}
