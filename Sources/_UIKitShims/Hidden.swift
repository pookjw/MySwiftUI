private import UIKit
private import ObjectiveC.runtime
private import ObjectiveC.message
internal import _UIKitPrivate
#if SwiftUICompataibility
private import SwiftUI
internal import _SwiftUIPrivate
#endif

final class PrivateSelectors {
    @objc(_swiftTypeName) var _swiftTypeName: NSString {
        fatalError()
    }
    
    @objc(_swiftValue) var _swiftValue: UnsafeRawPointer {
        fatalError()
    }
}

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

func UICoreKeyboardTrackingClass() -> AnyClass {
    return unsafe objc_lookUpClass("UICoreKeyboardTracking")!
}

func MaterialBackdropContextTraitToken() -> Any? {
#if SwiftUICompataibility
    /*
     ___lldb_unnamed_symbol311478은 내부적으로
     1. Shared Lock (_TtCV5UIKitP33_2B7F8531C57DD9B1FF22BDF345CB17E114_UISwiftTraits10UnfairLock) 생성 및 Lock/Unlock
     2. +[UITraitCollection _defineObjectTraitWithName:identifier:defaultValue:affectsColorAppearance:defaultValueRepresentsUnspecified:isPrivate:placeholderToken:]을 통해 Trait를 정의
     3. 그러면 Token이 한 번만 생성됨
     
     나는 1번 및 3번을 가져올 방법이 없어, 1~3을 처리하고 UITraitCollection으로 Token을 가져온다.
     */
    _ = UITraitCollection().private_coreResolvedBaseEnvironment(base: SwiftUI.EnvironmentValues())
    let token = UITraitCollection._existingTraitTokenReservingPlaceholderIfNecessary(withName: "MaterialBackdropContext", identifier: "UIMaterialBackdropContext")!
    return token
#else
#error("TODO")
#endif
}

func ResolvedProviderTraitToken() -> Any? {
#if SwiftUICompataibility
    /*
     ___lldb_unnamed_symbol311478은 내부적으로
     1. Shared Lock (_TtCV5UIKitP33_2B7F8531C57DD9B1FF22BDF345CB17E114_UISwiftTraits10UnfairLock) 생성 및 Lock/Unlock
     2. +[UITraitCollection _defineObjectTraitWithName:identifier:defaultValue:affectsColorAppearance:defaultValueRepresentsUnspecified:isPrivate:placeholderToken:]을 통해 Trait를 정의
     3. 그러면 Token이 한 번만 생성됨
     
     나는 1번 및 3번을 가져올 방법이 없어, 1~3을 처리하고 UITraitCollection으로 Token을 가져온다.
     */
    _ = UITraitCollection().private_coreResolvedBaseEnvironment(base: SwiftUI.EnvironmentValues())
    let token = UITraitCollection._existingTraitTokenReservingPlaceholderIfNecessary(withName: "ResolvedProvider", identifier: "UIResolvedProviderTrait")!
    return token
#else
#error("TODO")
#endif
}

// ___lldb_unnamed_symbol324225
func ColorMaterialRenderingMode() -> Any? {
#if SwiftUICompataibility
    _ = UITraitCollection().private_coreResolvedGlassMaterialEnvironment(base: SwiftUI.EnvironmentValues())
    
    let token = UITraitCollection._existingTraitTokenReservingPlaceholderIfNecessary(withName: "UIColor.materialRenderingMode", identifier: "UITraitColorMaterialRenderingMode")!
    
    return token
#else
#error("TODO")
#endif
}

func materialBackdropProxy(materialBackdropContext context: AnyObject) -> _SwiftUIPrivate.MaterialBackdropProxy? {
    return Mirror(reflecting: context).descendant("proxy") as? _SwiftUIPrivate.MaterialBackdropProxy
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
    let (ivarsCount, ivars) = unsafe withUnsafeTemporaryAllocation(of: UInt32.self, capacity: 1) { pointer in
        let ivars = unsafe class_copyIvarList(UIUpdateActionPhase.self, pointer.baseAddress)
        return unsafe (pointer.baseAddress.unsafelyUnwrapped.pointee, ivars!)
    }
    defer {
        unsafe ivars.deallocate()
    }
    
    let span = unsafe Span(_unsafeElements: UnsafeBufferPointer<Ivar>(start: ivars, count: Int(ivarsCount)))
    
    for i in unsafe span.indices {
        let ivar = unsafe span[i]
        
        if
            let cName = unsafe ivar_getName(ivar),
            unsafe String(cString: cName) == "_item"
        {
            let pointer = unsafe UnsafeMutableRawPointer(bitPattern: Int(bitPattern: ObjectIdentifier(phase)) + ivar_getOffset(ivar))!
            let casted = unsafe pointer.assumingMemoryBound(to: UnsafeMutablePointer<_UIUpdateSequenceItemInternal>.self)
            return unsafe casted.pointee
        }
    }
    
    return nil
}

extension UIView {
    var typedStorage: AnyObject {
        let (ivarsCount, ivars) = unsafe withUnsafeTemporaryAllocation(of: UInt32.self, capacity: 1) { pointer in
            let ivars = unsafe class_copyIvarList(UIView.self, pointer.baseAddress)
            return unsafe (pointer.baseAddress.unsafelyUnwrapped.pointee, ivars!)
        }
        defer {
            unsafe ivars.deallocate()
        }
        
        let span = unsafe Span(_unsafeElements: UnsafeBufferPointer<Ivar>(start: ivars, count: Int(ivarsCount)))
        
        for i in unsafe span.indices {
            let ivar = unsafe span[i]
            
            if
                let cName = unsafe ivar_getName(ivar),
                unsafe String(cString: cName) == "_typedStorage"
            {
                let pointer = unsafe UnsafeMutableRawPointer(bitPattern: Int(bitPattern: ObjectIdentifier(self)) + ivar_getOffset(ivar))!
                let casted = unsafe pointer.assumingMemoryBound(to: AnyObject?.self)
                
                if let typedStorage = unsafe casted.pointee {
                    return typedStorage
                }
                
                let typedStorage = unsafe (objc_lookUpClass("_UITypedStorage") as! AnyObject).perform(Selector(("new")))!.takeUnretainedValue()
                unsafe casted.initialize(to: typedStorage)
                return typedStorage
            }
        }
        
        fatalError()
    }
}
