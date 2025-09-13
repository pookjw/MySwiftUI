internal import UIKit
internal import ObjectiveC

extension Notification.Name {
    static let applicationWillBeginSnapshotSessionNotification = Notification.Name(rawValue: "_UIApplicationWillBeginSnapshotSessionNotification")
    static let applicationDidEndSnapshotSessionNotification = Notification.Name(rawValue: "_UIApplicationDidEndSnapshotSessionNotification")
}

func _UICoreKeyboardTrackingClass() -> AnyClass {
    return objc_lookUpClass("_UICoreKeyboardTracking")!
}

@MainActor var _UIUpdateSequenceScheduledItemInternal: UnsafeMutableRawPointer {
    return item(from: .afterUpdateScheduled)!
}

@MainActor var _UIUpdateSequenceBeginItemInternal: UnsafeMutableRawPointer {
    return item(from: .afterEventDispatch)!
}

@MainActor var _UIUpdateSequenceCADisplayLinksItemInternal: UnsafeMutableRawPointer {
    return item(from: .afterCADisplayLinkDispatch)!
}

@MainActor var _UIUpdateSequenceCATransactionCommitItemInternal: UnsafeMutableRawPointer {
    return item(from: .afterCATransactionCommit)!
}

@MainActor var _UIUpdateSequenceLowLatencyHIDEventsItemInternal: UnsafeMutableRawPointer {
    return item(from: .afterLowLatencyEventDispatch)!
}

@MainActor var _UIUpdateSequenceLowLatencyCATransactionCommitItemInternal: UnsafeMutableRawPointer {
    return item(from: .afterLowLatencyCATransactionCommit)!
}

@MainActor var _UIUpdateSequenceDoneItemInternal: UnsafeMutableRawPointer {
    return item(from: .afterUpdateComplete)!
}

fileprivate func item(from phase: UIUpdateActionPhase) -> UnsafeMutableRawPointer? {
    let (ivarsCount, ivars) = withUnsafeTemporaryAllocation(of: UInt32.self, capacity: 1) { pointer in
        let ivars = class_copyIvarList(UIUpdateActionPhase.self, pointer.baseAddress)
        return (pointer.baseAddress.unsafelyUnwrapped.pointee, ivars!)
    }
    defer {
        ivars.deallocate()
    }
    
    let span = Span(_unsafeElements: UnsafeBufferPointer<Ivar>.init(start: ivars, count: Int(ivarsCount)))
    
    for i in span.indices {
        let ivar = span[i]
        
        if
            let cName = ivar_getName(ivar),
            String(cString: cName) == "_item"
        {
            let pointer = UnsafeMutableRawPointer(bitPattern: Int(bitPattern: ObjectIdentifier(phase)) + ivar_getOffset(ivar))!
            let casted = pointer.assumingMemoryBound(to: UnsafeMutableRawPointer.self)
            return casted.pointee
        }
    }
    
    return nil
}
