internal import Foundation

extension NSAttributedString {
    final var isDynamic: Bool {
        assertUnimplemented()
    }
    
    final var updateSchedule: any TimelineSchedule {
        assertUnimplemented()
    }
    
    struct Metrics {
        // TODO
    }
}

extension NSMutableAttributedString {
    final func setUpdateSchedule(_ schedule: (any TimelineSchedule)?) {
        assertUnimplemented()
    }
}

extension NSAttributedString.Key {
    static var updateSchedule: NSAttributedString.Key {
        assertUnimplemented()
    }
}
