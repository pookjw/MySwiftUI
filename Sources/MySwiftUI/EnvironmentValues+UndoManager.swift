public import MySwiftUICore
public import UIKit

extension EnvironmentValues {
    public var undoManager: UndoManager? {
        get {
            return self[UndoManagerKey.self]
        }
    }
    
    var _undoManager: UndoManager? {
        get {
            return self[UndoManagerKey.self]
        }
        set {
            self[UndoManagerKey.self] = newValue
        }
    }
}

fileprivate struct UndoManagerKey : EnvironmentKey {
    static var defaultValue: UndoManager? {
        return nil
    }
}
