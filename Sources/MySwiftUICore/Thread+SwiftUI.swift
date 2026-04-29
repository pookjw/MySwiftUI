internal import Foundation
private import _MySwiftUIShims

extension Thread {
    func _startAndReturnError() -> Bool {
        return _NSThreadStart(self)
    }
}
