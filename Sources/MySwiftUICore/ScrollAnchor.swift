// 7B1EE599701509BF28EDF9C7B4D1E4E3

package struct ScrollAnchorStorage : Equatable, Sendable {
    private var anchors: [ScrollAnchorStorage.Role: UnitPoint]
    private var defaultValue: UnitPoint?
    
    package init() {
        self.anchors = [:]
        self.defaultValue = nil
    }
}

extension ScrollAnchorStorage {
    enum Role : Hashable, CaseIterable {
        case initialOffset
        case sizeChanges
        case alignment
    }
}

extension EnvironmentValues {
    package var scrollAnchors: ScrollAnchorStorage {
        get {
            return self[ScrollAnchorsKey.self]
        }
        set {
            self[ScrollAnchorsKey.self] = newValue
        }
    }
}

fileprivate struct ScrollAnchorsKey : EnvironmentKey {
    static let defaultValue = ScrollAnchorStorage()
}
