
internal import MySwiftUICore

struct UIKitPresentationModeLocation<Content: View>: Location {
    typealias Value = PresentationMode
    
    private weak var host: _UIHostingView<Content>?
    
    init(host: _UIHostingView<Content>?) {
        self.host = host
    }
    
    var wasRead: Bool {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
    
    func get() -> Self.Value {
        fatalError("TODO")
    }
    
    mutating func set(_ newValue: Self.Value, transaction: Transaction) {
        fatalError("TODO")
    }
    
    func update() -> (Self.Value, Bool) {
        fatalError("TODO")
    }
}
