internal import MySwiftUICore
internal import UIKit

extension EnvironmentValues {
    var undoManager: UndoManager? {
        get {
            return self[UndoManagerKey.self]
        }
        set {
            self[UndoManagerKey.self]
        }
    }
}

fileprivate struct UndoManagerKey: EnvironmentKey {
    static var defaultValue: UndoManager? {
        return nil
    }
}
