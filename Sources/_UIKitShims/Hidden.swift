private import UIKit
private import ObjectiveC.runtime
private import ObjectiveC.message
internal import _UIKitPrivate
#if SwiftUICompataibility
private import SwiftUI
internal import _SwiftUIPrivate
private import _SwiftPrivate
private import _MySwiftUIShims
internal import MySwiftUICore
#endif
internal import DesignLibrary

final class PrivateSelectors {
    @objc(_swiftTypeName) var _swiftTypeName: NSString {
        fatalError()
    }
    
    @objc(_swiftValue) var _swiftValue: UnsafeRawPointer {
        fatalError()
    }
    
    @objc(alloc) func alloc() -> AnyObject {
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

func MaterialBackdropContextTraitToken() -> (any _UITraitTokenProtocol)? {
#if SwiftUICompataibility
    /*
     UIKit은 내부적으로
     1. Shared Lock (_TtCV5UIKitP33_2B7F8531C57DD9B1FF22BDF345CB17E114_UISwiftTraits10UnfairLock) 생성 및 Lock/Unlock
     2. +[UITraitCollection _defineObjectTraitWithName:identifier:defaultValue:affectsColorAppearance:defaultValueRepresentsUnspecified:isPrivate:placeholderToken:]을 통해 Trait를 정의
     3. 만약 내가 이 로직을 똑같이 구현하면 "Attempting to define a trait for a placeholder token that corresponds to a trait that was already defined: 30" Exception이 나오게 되기에 UIKit에서 등록을 시키고 그것을 가져와야함
     */
    _ = UITraitCollection().private_coreResolvedBaseEnvironment(base: SwiftUI::EnvironmentValues())
    let token = UITraitCollection._existingTraitTokenReservingPlaceholderIfNecessary(withName: "MaterialBackdropContext", identifier: "UIMaterialBackdropContext")!
    return unsafe unsafeBitCast(token, to: (any _UITraitTokenProtocol).self)
#else
#error("TODO")
#endif
}

func ResolvedProviderTraitToken() -> (any _UITraitTokenProtocol)? {
#if SwiftUICompataibility
    _ = UITraitCollection().private_coreResolvedBaseEnvironment(base: SwiftUI::EnvironmentValues())
    let token = UITraitCollection._existingTraitTokenReservingPlaceholderIfNecessary(withName: "ResolvedProvider", identifier: "UIResolvedProviderTrait")!
    return unsafe unsafeBitCast(token, to: (any _UITraitTokenProtocol).self)
#else
#error("TODO")
#endif
}

// ___lldb_unnamed_symbol324225
func ColorMaterialRenderingModeToken() -> (any _UITraitTokenProtocol)? {
#if SwiftUICompataibility
    _ = UITraitCollection().private_coreResolvedGlassMaterialEnvironment(base: SwiftUI::EnvironmentValues())
    
    let token = UITraitCollection._existingTraitTokenReservingPlaceholderIfNecessary(withName: "UIColor.materialRenderingMode", identifier: "UITraitColorMaterialRenderingMode")!
    
    return unsafe unsafeBitCast(token, to: (any _UITraitTokenProtocol).self)
#else
#error("TODO")
#endif
}

func DisplayScaleToken() -> (any _UITraitTokenProtocol)? {
#if SwiftUICompataibility
    _ = UITraitCollection().private_coreResolvedGlassMaterialEnvironment(base: SwiftUI::EnvironmentValues())
    
    let token = UITraitCollection._existingTraitTokenReservingPlaceholderIfNecessary(withName: "DisplayScale", identifier: "UITraitDisplayScale")!
    return unsafe unsafeBitCast(token, to: (any _UITraitTokenProtocol).self)
#else
#error("TODO")
#endif
}

func GlassElevationLevelToken() -> (any _UITraitTokenProtocol)? {
#if SwiftUICompataibility
    _ = UITraitCollection().private_coreResolvedGlassMaterialEnvironment(base: SwiftUI::EnvironmentValues())
    
    let token = UITraitCollection._existingTraitTokenReservingPlaceholderIfNecessary(withName: "GlassElevationLevel", identifier: "_UITraitGlassElevationLevel")!
    return unsafe unsafeBitCast(token, to: (any _UITraitTokenProtocol).self)
#else
#error("TODO")
#endif
}

func GlassBackgroundStyleToken() -> (any _UITraitTokenProtocol)? {
#if SwiftUICompataibility
    _ = UITraitCollection().private_coreResolvedGlassMaterialEnvironment(base: SwiftUI::EnvironmentValues())
    
    let token = UITraitCollection._existingTraitTokenReservingPlaceholderIfNecessary(withName: "GlassBackgroundStyle", identifier: "UIGlassBackgroundStyleTrait")!
    return unsafe unsafeBitCast(token, to: (any _UITraitTokenProtocol).self)
#else
#error("TODO")
#endif
}

func GlassFrostToken() -> (any _UITraitTokenProtocol)? {
#if SwiftUICompataibility
    _ = UITraitCollection().private_coreResolvedGlassMaterialEnvironment(base: SwiftUI::EnvironmentValues())
    
    let token = UITraitCollection._existingTraitTokenReservingPlaceholderIfNecessary(withName: "GlassFrost", identifier: "UIGlassFrost")!
    return unsafe unsafeBitCast(token, to: (any _UITraitTokenProtocol).self)
#else
#error("TODO")
#endif
}

func GlassPocketContainerToken() -> (any _UITraitTokenProtocol)? {
#if SwiftUICompataibility
    _ = UITraitCollection().private_coreResolvedGlassMaterialEnvironment(base: SwiftUI::EnvironmentValues())
    
    let token = UITraitCollection._existingTraitTokenReservingPlaceholderIfNecessary(withName: "GlassPocketContainer", identifier: "UIGlassPocketContainer")!
    return unsafe unsafeBitCast(token, to: (any _UITraitTokenProtocol).self)
#else
#error("TODO")
#endif
}

#if SwiftUICompataibility
func makeMaterialBackdropContext(flags: Int, proxy: _SwiftUIPrivate::MaterialBackdropProxy?) -> AnyObject {
    let contextClass = unsafe objc_lookUpClass("_TtC5UIKit23MaterialBackdropContext")!
    var object = (contextClass as AnyObject).alloc()
    
    var flagsOffset: Int!
    var proxyOffset: Int!
    
    unsafe _forEachField(of: _typeByName("5UIKit23MaterialBackdropContextC")!, options: [.classType]) { name, offset, type, kind in
        if unsafe String(cString: name) == "flags" {
            flagsOffset = offset
        } else if unsafe String(cString: name) == "proxy" {
            proxyOffset = offset
        }
        
        return (flagsOffset == nil) || (proxyOffset == nil)
    }
    
    let base = unsafe Unmanaged.passUnretained(object).toOpaque()
    
    unsafe base
        .advanced(by: flagsOffset)
        .assumingMemoryBound(to: Int.self)
        .initialize(to: flags)
    
    unsafe base
        .advanced(by: proxyOffset)
        .assumingMemoryBound(to: _SwiftUIPrivate::MaterialBackdropProxy?.self)
        .initialize(to: proxy)
    
    var superInfo = unsafe objc_super(receiver: Unmanaged.passUnretained(object), super_class: type(of: object))
    let casted = unsafe unsafeBitCast(msui_objc_msgSendSuper2(), to: (@convention(c) (UnsafePointer<objc_super>, Selector) -> AnyObject).self)
    object = unsafe casted(&superInfo, Selector(("init")))
    
    return object
}

func modifyMaterialBackdropContext<T>(_ context: AnyObject, mutation: (_ flags: inout Int, _ proxy: inout _SwiftUIPrivate::MaterialBackdropProxy?) -> T) -> T {
    assert(_typeByName("5UIKit23MaterialBackdropContextC")! == type(of: context))
    
    var flagsOffset: Int!
    var proxyOffset: Int!
    
    unsafe _forEachField(of: _typeByName("5UIKit23MaterialBackdropContextC")!, options: [.classType]) { name, offset, type, kind in
        if unsafe String(cString: name) == "flags" {
            flagsOffset = offset
        } else if unsafe String(cString: name) == "proxy" {
            proxyOffset = offset
        }
        
        return (flagsOffset == nil) || (proxyOffset == nil)
    }
    
    let base = unsafe Unmanaged.passUnretained(context).toOpaque()
    
    let flags = unsafe base
        .advanced(by: flagsOffset)
        .assumingMemoryBound(to: Int.self)
    
    let proxy = unsafe base
        .advanced(by: proxyOffset)
        .assumingMemoryBound(to: _SwiftUIPrivate::MaterialBackdropProxy?.self)
    
    return unsafe mutation(&flags.pointee, &proxy.pointee)
}
#endif

@MainActor var _UIUpdateSequenceScheduledItemInternal: UnsafeMutablePointer<_UIUpdateSequenceItemInternal> {
    return unsafe item(from: .afterUpdateScheduled)!
}

@MainActor var _UIUpdateSequenceBeginItemInternal: UnsafeMutablePointer<_UIUpdateSequenceItemInternal> {
    return unsafe item(from: .afterEventDispatch)!
}

@MainActor var _UIUpdateSequenceCADisplayLinksItemInternal: UnsafeMutablePointer<_UIUpdateSequenceItemInternal> {
    return unsafe item(from: .afterCADisplayLinkDispatch)!
}

@MainActor var _UIUpdateSequenceCATransactionCommitItemInternal: UnsafeMutablePointer<_UIUpdateSequenceItemInternal> {
    return unsafe item(from: .afterCATransactionCommit)!
}

@MainActor var _UIUpdateSequenceLowLatencyHIDEventsItemInternal: UnsafeMutablePointer<_UIUpdateSequenceItemInternal> {
    return unsafe item(from: .afterLowLatencyEventDispatch)!
}

@MainActor var _UIUpdateSequenceLowLatencyCATransactionCommitItemInternal: UnsafeMutablePointer<_UIUpdateSequenceItemInternal> {
    return unsafe item(from: .afterLowLatencyCATransactionCommit)!
}

@MainActor var _UIUpdateSequenceDoneItemInternal: UnsafeMutablePointer<_UIUpdateSequenceItemInternal> {
    return unsafe item(from: .afterUpdateComplete)!
}

fileprivate func iterateIvars(type: AnyClass, includeSuperclass: Bool, iteration: (_ ivar: Ivar) -> Bool) {
    var _classType: AnyClass? = type
    
    while let classType = _classType { 
        let (ivarsCount, ivars) = unsafe withUnsafeTemporaryAllocation(of: UInt32.self, capacity: 1) { pointer in
            let ivars = unsafe class_copyIvarList(classType, pointer.baseAddress)
            return unsafe (pointer.baseAddress.unsafelyUnwrapped.pointee, ivars!)
        }
        
        defer {
            unsafe ivars.deallocate()
            _classType = classType.superclass()
        }
        
        let span = unsafe Span(_unsafeElements: UnsafeBufferPointer<Ivar>(start: ivars, count: Int(ivarsCount)))
        
        for i in unsafe span.indices {
            let ivar = unsafe span[i]
            let shouldContinue = unsafe iteration(ivar)
            guard shouldContinue else {
                return
            }
        }
    }
}

fileprivate func iterateIvars(object: AnyObject, iteration: (_ ivar: Ivar, _ name: String, _ offset: Int, _ pointer: UnsafeMutableRawPointer) -> Bool) {
    unsafe iterateIvars(type: type(of: object), includeSuperclass: true) { ivar in
        let name = unsafe String(cString: ivar_getName(ivar)!)
        let offset = unsafe ivar_getOffset(ivar)
        let pointer = unsafe Unmanaged
            .passUnretained(object)
            .toOpaque()
            .advanced(by: offset)
        
        return unsafe iteration(ivar, name, offset, pointer)
    }
}

fileprivate func item(from phase: UIUpdateActionPhase) -> UnsafeMutablePointer<_UIUpdateSequenceItemInternal>? {
    var result: UnsafeMutablePointer<_UIUpdateSequenceItemInternal>?
    
    unsafe iterateIvars(object: phase) { ivar, name, offset, pointer in
        guard name == "_item" else {
            return true
        }
        
        unsafe result = unsafe pointer
            .assumingMemoryBound(to: UnsafeMutablePointer<_UIUpdateSequenceItemInternal>.self)
            .pointee
        
        return false
    }
    
    return unsafe result
}

extension UIView {
    var typedStorage: _UITypedStorage {
        var storage: _UITypedStorage!
        
        unsafe iterateIvars(object: self) { ivar, name, offset, pointer in
            guard name == "_typedStorage" else {
                return true
            }
            
            let casted = unsafe pointer.assumingMemoryBound(to: _UITypedStorage?.self)
            
            if let typedStorage = unsafe casted.pointee {
                storage = typedStorage
                return false
            }
            
            let typedStorage = _UITypedStorage()
            unsafe casted.initialize(to: typedStorage)
            storage = typedStorage
            
            return false
        }
        
        return storage
    }
}

/*
 [ObjectIdentifier: _UITypedStorage.BaseValue]
 _UITypedStorage.BaseValue
 -> (subclass) _UITypedStorage.(TypedValue in $186ef9d7c)<Swift.Optional<UIKit::_UICornerProvider>>
 */
fileprivate func modifyTypedStorage<T>(_ storage: AnyObject, mutation: (_ storage: inout [ObjectIdentifier: AnyObject]) -> T) -> T {
    var result: T!
    
    unsafe iterateIvars(object: storage) { ivar, name, offset, pointer in
        guard name == "storage" else {
            return true
        }
        
        let storagePointer = unsafe pointer
            .assumingMemoryBound(to: [ObjectIdentifier: AnyObject].self)
        
        result = unsafe mutation(&storagePointer.pointee)
        return false
    }
    
    return result
}

func glassBackgroundStyle(typedStorage: _UITypedStorage) -> AnyObject? {
    return modifyTypedStorage(typedStorage) { storage in
        for key in storage.keys {
            // UIKit::_UIIntelligenceLightSourceConfiguration._GlassBackgroundStyleKey
            if unsafe _mangledTypeName(unsafeBitCast(key, to: Any.Type.self)) == "So6UIViewC5UIKitE10$186ef90d8yXZ24_GlassBackgroundStyleKeyV" {
                return storage[key]
            }
        }
        
        return nil
    }
}

enum _GlassBackgroundStyle : Hashable {
    case glass(GlassMaterialProvider.ResolvedStyle?)
    case unspecified
    case solidColor
}

func castToGlassBackgroundStyle(_ style: Any) -> _GlassBackgroundStyle {
    if type(of: style) == _typeByName("5UIKit21_GlassBackgroundStyleO")! {
        return unsafe withUnsafePointer(to: style) { stylePointer in
            return unsafe withUnsafeTemporaryAllocation(of: _GlassBackgroundStyle.self, capacity: 1) { resultPointer in
                let success = unsafe swift_dynamicCast(
                    resultPointer.baseAddress.unsafelyUnwrapped,
                    stylePointer,
                    UnsafeRawPointer(bitPattern: UInt(bitPattern: ObjectIdentifier(Any.self)))!,
                    UnsafeRawPointer(bitPattern: UInt(bitPattern: ObjectIdentifier(_typeByName("5UIKit21_GlassBackgroundStyleO")!)))!,
                    0
                )
                assert(success)
                
                return unsafe resultPointer.baseAddress.unsafelyUnwrapped.pointee
            }
        }
    } else if let object = style as? NSObject {
        let value = Mirror(reflecting: object).descendant("value")!
        return castToGlassBackgroundStyle(value)
    } else {
        fatalError()
    }
}

@_silgen_name("swift_dynamicCast")
func swift_dynamicCast(
  _ dest: UnsafeRawPointer,
  _ src: UnsafeRawPointer,
  _ srcMetadata: UnsafeRawPointer,
  _ dstMetadata: UnsafeRawPointer,
  _ flags: UInt
) -> Bool

func getTraitsInternal(_ mutation: any UIMutableTraits) -> any UIMutableTraitsInternal {
    return unsafe unsafeBitCast(mutation, to: (any UIMutableTraitsInternal).self)
}
