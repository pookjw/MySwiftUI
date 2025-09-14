internal import UIKit
internal import ObjectiveC
internal import _UIKitPrivate

extension Notification.Name {
    static let applicationWillBeginSnapshotSessionNotification = Notification.Name(rawValue: "_UIApplicationWillBeginSnapshotSessionNotification")
    static let applicationDidEndSnapshotSessionNotification = Notification.Name(rawValue: "_UIApplicationDidEndSnapshotSessionNotification")
    static let sceneDidUpdateSystemSceneDisplacementNotification = Notification.Name(rawValue: "_MRUISceneDidUpdateSystemSceneDisplacementNotification")
    static let sceneDidChangeRelativeTransformNotification = Notification.Name(rawValue: "_MRUISceneDidChangeRelativeTransformNotification")
    static let windowSceneWorldTrackingCapabilitiesDidChange = Notification.Name(rawValue: "_MRUIWindowSceneWorldTrackingCapabilitiesDidChange")
    static let windowSceneDidBeginSnapToSurfaceNotification = Notification.Name(rawValue: "MRUIWindowSceneDidBeginSnapToSurfaceNotification")
    static let windowSceneDidChangeSnappingSurfaceClassificationNotification = Notification.Name(rawValue: "MRUIWindowSceneDidChangeSnappingSurfaceClassificationNotification")
    static let windowDidMoveToSceneNotification = Notification.Name(rawValue: "_UIWindowDidMoveToSceneNotification")
}

func _UICoreKeyboardTrackingClass() -> AnyClass {
    return objc_lookUpClass("_UICoreKeyboardTracking")!
}

@MainActor var _UIUpdateSequenceScheduledItemInternal: UnsafeMutablePointer<_UIUpdateSequenceItemInternal> {
    return item(from: .afterUpdateScheduled)!
}

@MainActor var _UIUpdateSequenceBeginItemInternal: UnsafeMutablePointer<_UIUpdateSequenceItemInternal> {
    return item(from: .afterEventDispatch)!
}

@MainActor var _UIUpdateSequenceCADisplayLinksItemInternal: UnsafeMutablePointer<_UIUpdateSequenceItemInternal> {
    return item(from: .afterCADisplayLinkDispatch)!
}

@MainActor var _UIUpdateSequenceCATransactionCommitItemInternal: UnsafeMutablePointer<_UIUpdateSequenceItemInternal> {
    return item(from: .afterCATransactionCommit)!
}

@MainActor var _UIUpdateSequenceLowLatencyHIDEventsItemInternal: UnsafeMutablePointer<_UIUpdateSequenceItemInternal> {
    return item(from: .afterLowLatencyEventDispatch)!
}

@MainActor var _UIUpdateSequenceLowLatencyCATransactionCommitItemInternal: UnsafeMutablePointer<_UIUpdateSequenceItemInternal> {
    return item(from: .afterLowLatencyCATransactionCommit)!
}

@MainActor var _UIUpdateSequenceDoneItemInternal: UnsafeMutablePointer<_UIUpdateSequenceItemInternal> {
    return item(from: .afterUpdateComplete)!
}

fileprivate func item(from phase: UIUpdateActionPhase) -> UnsafeMutablePointer<_UIUpdateSequenceItemInternal>? {
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
            let casted = pointer.assumingMemoryBound(to: UnsafeMutablePointer<_UIUpdateSequenceItemInternal>.self)
            return casted.pointee
        }
    }
    
    return nil
}
