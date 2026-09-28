internal import Foundation
private import _MySwiftUICoreShims

extension Thread {
    func _startAndReturnError() -> Bool {
        return _NSThreadStart(self)
    }
}
