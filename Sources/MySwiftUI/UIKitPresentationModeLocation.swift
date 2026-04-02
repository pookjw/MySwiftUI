
internal import MySwiftUICore

struct UIKitPresentationModeLocation<Content : View>: Location {
    typealias Value = PresentationMode
    
    private weak var host: _UIHostingView<Content>?
    
    init(host: _UIHostingView<Content>?) {
        self.host = host
    }
    
    var wasRead: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    func get() -> Self.Value {
        assertUnimplemented()
    }
    
    mutating func set(_ newValue: Self.Value, transaction: Transaction) {
        assertUnimplemented()
    }
    
    func update() -> (Self.Value, Bool) {
        assertUnimplemented()
    }
}
