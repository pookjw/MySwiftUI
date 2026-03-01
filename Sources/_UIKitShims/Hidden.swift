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
    _ = UITraitCollection().private_coreResolvedBaseEnvironment(base: SwiftUI.EnvironmentValues())
    let token = UITraitCollection._existingTraitTokenReservingPlaceholderIfNecessary(withName: "MaterialBackdropContext", identifier: "UIMaterialBackdropContext")!
    return unsafeBitCast(token, to: (any _UITraitTokenProtocol).self)
#else
#error("TODO")
#endif
}

func ResolvedProviderTraitToken() -> (any _UITraitTokenProtocol)? {
#if SwiftUICompataibility
    _ = UITraitCollection().private_coreResolvedBaseEnvironment(base: SwiftUI.EnvironmentValues())
    let token = UITraitCollection._existingTraitTokenReservingPlaceholderIfNecessary(withName: "ResolvedProvider", identifier: "UIResolvedProviderTrait")!
    return unsafeBitCast(token, to: (any _UITraitTokenProtocol).self)
#else
#error("TODO")
#endif
}

// ___lldb_unnamed_symbol324225
func ColorMaterialRenderingModeToken() -> (any _UITraitTokenProtocol)? {
#if SwiftUICompataibility
    _ = UITraitCollection().private_coreResolvedGlassMaterialEnvironment(base: SwiftUI.EnvironmentValues())
    
    let token = UITraitCollection._existingTraitTokenReservingPlaceholderIfNecessary(withName: "UIColor.materialRenderingMode", identifier: "UITraitColorMaterialRenderingMode")!
    
    return unsafeBitCast(token, to: (any _UITraitTokenProtocol).self)
#else
#error("TODO")
#endif
}

func DisplayScaleToken() -> (any _UITraitTokenProtocol)? {
#if SwiftUICompataibility
    _ = UITraitCollection().private_coreResolvedGlassMaterialEnvironment(base: SwiftUI.EnvironmentValues())
    
    let token = UITraitCollection._existingTraitTokenReservingPlaceholderIfNecessary(withName: "DisplayScale", identifier: "UITraitDisplayScale")!
    return unsafeBitCast(token, to: (any _UITraitTokenProtocol).self)
#else
#error("TODO")
#endif
}

func GlassElevationLevelToken() -> (any _UITraitTokenProtocol)? {
#if SwiftUICompataibility
    _ = UITraitCollection().private_coreResolvedGlassMaterialEnvironment(base: SwiftUI.EnvironmentValues())
    
    let token = UITraitCollection._existingTraitTokenReservingPlaceholderIfNecessary(withName: "GlassElevationLevel", identifier: "_UITraitGlassElevationLevel")!
    return unsafeBitCast(token, to: (any _UITraitTokenProtocol).self)
#else
#error("TODO")
#endif
}

func GlassBackgroundStyleToken() -> (any _UITraitTokenProtocol)? {
#if SwiftUICompataibility
    _ = UITraitCollection().private_coreResolvedGlassMaterialEnvironment(base: SwiftUI.EnvironmentValues())
    
    let token = UITraitCollection._existingTraitTokenReservingPlaceholderIfNecessary(withName: "GlassBackgroundStyle", identifier: "UIGlassBackgroundStyleTrait")!
    return unsafeBitCast(token, to: (any _UITraitTokenProtocol).self)
#else
#error("TODO")
#endif
}

func GlassFrostToken() -> (any _UITraitTokenProtocol)? {
#if SwiftUICompataibility
    _ = UITraitCollection().private_coreResolvedGlassMaterialEnvironment(base: SwiftUI.EnvironmentValues())
    
    let token = UITraitCollection._existingTraitTokenReservingPlaceholderIfNecessary(withName: "GlassFrost", identifier: "UIGlassFrost")!
    return unsafeBitCast(token, to: (any _UITraitTokenProtocol).self)
#else
#error("TODO")
#endif
}

func GlassPocketContainerToken() -> (any _UITraitTokenProtocol)? {
#if SwiftUICompataibility
    _ = UITraitCollection().private_coreResolvedGlassMaterialEnvironment(base: SwiftUI.EnvironmentValues())
    
    let token = UITraitCollection._existingTraitTokenReservingPlaceholderIfNecessary(withName: "GlassPocketContainer", identifier: "UIGlassPocketContainer")!
    return unsafeBitCast(token, to: (any _UITraitTokenProtocol).self)
#else
#error("TODO")
#endif
}

#if SwiftUICompataibility
func makeMaterialBackdropContext(flags: Int, proxy: _SwiftUIPrivate.MaterialBackdropProxy?) -> AnyObject {
    let contextClass = objc_lookUpClass("_TtC5UIKit23MaterialBackdropContext")!
    var object = (contextClass as AnyObject).alloc()
    
    var flagsOffset: Int!
    var proxyOffset: Int!
    
    _forEachField(of: _typeByName("5UIKit23MaterialBackdropContextC")!, options: [.classType]) { name, offset, type, kind in
        if String(cString: name) == "flags" {
            flagsOffset = offset
        } else if String(cString: name) == "proxy" {
            proxyOffset = offset
        }
        
        return (flagsOffset == nil) || (proxyOffset == nil)
    }
    
    let base = Unmanaged.passUnretained(object).toOpaque()
    
    base
        .advanced(by: flagsOffset)
        .assumingMemoryBound(to: Int.self)
        .initialize(to: flags)
    
    base
        .advanced(by: proxyOffset)
        .assumingMemoryBound(to: _SwiftUIPrivate.MaterialBackdropProxy?.self)
        .initialize(to: proxy)
    
    var superInfo = objc_super(receiver: Unmanaged.passUnretained(object), super_class: type(of: object))
    let casted = unsafe unsafeBitCast(msui_objc_msgSendSuper2(), to: (@convention(c) (UnsafePointer<objc_super>, Selector) -> AnyObject).self)
    object = casted(&superInfo, Selector(("init")))
    
    return object
}

func modifyMaterialBackdropContext<T>(_ context: AnyObject, mutation: (_ flags: inout Int, _ proxy: inout _SwiftUIPrivate.MaterialBackdropProxy?) -> T) -> T {
    assert(_typeByName("5UIKit23MaterialBackdropContextC")! == type(of: context))
    
    var flagsOffset: Int!
    var proxyOffset: Int!
    
    _forEachField(of: _typeByName("5UIKit23MaterialBackdropContextC")!, options: [.classType]) { name, offset, type, kind in
        if String(cString: name) == "flags" {
            flagsOffset = offset
        } else if String(cString: name) == "proxy" {
            proxyOffset = offset
        }
        
        return (flagsOffset == nil) || (proxyOffset == nil)
    }
    
    let base = Unmanaged.passUnretained(context).toOpaque()
    
    let flags = base
        .advanced(by: flagsOffset)
        .assumingMemoryBound(to: Int.self)
    
    let proxy = base
        .advanced(by: proxyOffset)
        .assumingMemoryBound(to: _SwiftUIPrivate.MaterialBackdropProxy?.self)
    
    return mutation(&flags.pointee, &proxy.pointee)
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
                
                let typedStorage = unsafe (objc_lookUpClass("_UITypedStorage") as! NSObject.Type).init()
                unsafe casted.initialize(to: typedStorage)
                return typedStorage
            }
        }
        
        fatalError()
    }
}

enum _GlassBackgroundStyle: Hashable {
    case glass(GlassMaterialProvider.ResolvedStyle?)
    case unspecified
    case solidColor
}

func castToGlassBackgroundStyle(_ style: Any) -> _GlassBackgroundStyle {
    if type(of: style) == _typeByName("5UIKit21_GlassBackgroundStyleO")! {
        return withUnsafePointer(to: style) { stylePointer in
            return withUnsafeTemporaryAllocation(of: _GlassBackgroundStyle.self, capacity: 1) { resultPointer in
                let success = swift_dynamicCast(
                    resultPointer.baseAddress.unsafelyUnwrapped,
                    stylePointer,
                    UnsafeRawPointer(bitPattern: UInt(bitPattern: ObjectIdentifier(Any.self)))!,
                    UnsafeRawPointer(bitPattern: UInt(bitPattern: ObjectIdentifier(_typeByName("5UIKit21_GlassBackgroundStyleO")!)))!,
                    0
                )
                assert(success)
                
                return resultPointer.baseAddress.unsafelyUnwrapped.pointee
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

//extension GlassMaterialProvider.ResolvedStyleProvider: MySwiftUICore.MaterialProvider {
//    package func resolveLayers(in context: MySwiftUICore.Material.Context) -> [MySwiftUICore.Material.Layer] {
//        <#code#>
//    }
//    
//    package func resolveForegroundStyle(level: Int, in context: MySwiftUICore.Material.Context) -> MySwiftUICore.Material.ForegroundStyle? {
//        <#code#>
//    }
//    
//    package func resolveAdaptiveColor(_ color: MySwiftUICore.Color.ResolvedHDR, in context: MySwiftUICore.Material.Context) -> MySwiftUICore.Material.ForegroundStyle {
//        <#code#>
//    }
//    
//    package func foregroundEnvironment(_ environment: inout MySwiftUICore.EnvironmentValues, for: MySwiftUICore.Material) {
//        <#code#>
//    }
//    
//    package func resolveBackgroundStyle(level: Int, in context: MySwiftUICore.Material.Context) -> MySwiftUICore.Material.ForegroundStyle? {
//        <#code#>
//    }
//    
//    
//}
