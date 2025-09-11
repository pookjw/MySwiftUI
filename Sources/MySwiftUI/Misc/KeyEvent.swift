#warning("TODO")
private import MySwiftUICore

struct KeyEvent {
    private var phase: EventPhase
    private var timestamp: Time
    private var binding: EventBinding?
    private var modifiers: EventModifiers
    private var keys: String
    private var stringValue: String
    private var keyID: AnyHashable
}

extension KeyEvent {
    struct Tracker {
        private var activeVersions: [AnyHashable : DisplayList.Version] = [:]
    }
}
