//
//  ViewController.swift
//  NativePlayground
//
//  Created by Jinwoo Kim on 8/13/25.
//

import UIKit
import SwiftUI
import _SwiftPrivate
import _SwiftUIPrivate
import _UIKitPrivate
import ObjectiveC.runtime
import ObjectiveC.message
import DesignLibrary
import _SwiftUICorePrivate
import AttributeGraph

struct MyDynamicView: DynamicView {
    static func makeID() -> _SwiftUICorePrivate.UniqueID {
        .init()
    }
    
    func childInfo(metadata: Void) -> (any Any.Type, _SwiftUICorePrivate.UniqueID?) {
        (EmptyView.self, nil)
    }
    
    func makeChildView(metadata: Void, view: AttributeGraph.Attribute<MyDynamicView>, inputs: _ViewInputs) -> _ViewOutputs {
        .init()
    }
    
    func makeChildViewList(metadata: Void, view: AttributeGraph.Attribute<MyDynamicView>, inputs: _ViewListInputs) -> _ViewListOutputs {
        fatalError()
    }
    
    typealias Metadata = Void
    typealias ID = UniqueID
    
    static var canTransition: Bool {
        return true
    }
    
    static var traitKeysDependOnView: Bool {
        return false
    }
}


func swizzle() {
    let method = class_getInstanceMethod(_UIHostingView<EmptyView>.self, #selector(UIView.traitCollectionDidChange(_:)))
    let empty: (@convention(c) (AnyObject, Selector, AnyObject?) -> Void) = { _, _, _ in }
    method_setImplementation(method!, unsafeBitCast(empty, to: IMP.self))
}

final class PrivateSelectors: NSObject {
    @objc(_swiftUI_platformViewDefinition) class func _swiftUI_platformViewDefinition() -> AnyClass {
        fatalError("TODO")
    }
}

struct Foo_1: _SwiftUICorePrivate.PreferenceKey {
    public static var defaultValue: Bool { return false }
}
struct Foo_2: _SwiftUICorePrivate.PreferenceKey {
    public static var defaultValue: Bool { return false }
}

final class EmptyClass {}

@_silgen_name("_swift_setClassMetadata")
internal func _swift_setClassMetadata<T>(_ x: T.Type, onObject: AnyObject) -> Bool

fileprivate struct Type1 {}
fileprivate struct Type2 {}

struct AnimatableFoo: Animatable {
    var animatableData: Double
}

class ViewController: UIViewController {
    override func loadView() {
        _ = Animation(MyAnimation())
//        dlopen("/System/Library/PrivateFrameworks/UIAccessibility.framework/UIAccessibility", RTLD_NOW)
//        swizzle()
        
        print(_typeName(_typeByName("7SwiftUI11DisplayListVAAE12ViewRendererC")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI11DisplayListVAAE12ViewRendererC")!, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        //        
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI11DisplayListV11ViewUpdaterC")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI11DisplayListV11ViewUpdaterC")!, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        //        
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI11DisplayListV11ViewUpdaterC0E5CacheV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI11DisplayListV11ViewUpdaterC0E5CacheV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        //        
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI11DisplayListV11ViewUpdaterC0E4InfoV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI11DisplayListV11ViewUpdaterC0E4InfoV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        //        
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI11DisplayListV11ViewUpdaterC8PlatformV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI11DisplayListV11ViewUpdaterC8PlatformV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        //        
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI19ResolvedShadowStyleV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI19ResolvedShadowStyleV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        //        
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI11DisplayListV11ViewUpdaterC5ModelO5StateV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI11DisplayListV11ViewUpdaterC5ModelO5StateV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        //        
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI11DisplayListV11ViewUpdaterC8PlatformV5StateV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI11DisplayListV11ViewUpdaterC8PlatformV5StateV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }   
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI11DisplayListV11ViewUpdaterC0E4InfoV5SeedsV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI11DisplayListV11ViewUpdaterC0E4InfoV5SeedsV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI25PlatformItemListViewGraphV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI25PlatformItemListViewGraphV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        //        
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI17CachedEnvironmentV13AnimatedFrameV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI17CachedEnvironmentV13AnimatedFrameV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        //        
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI24AnimatableFrameAttributeV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI24AnimatableFrameAttributeV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        //        
        print("===")
        
        print(_GraphInputs.self)
        _forEachField(of: _GraphInputs.self, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        print("===")
        
        print(_ViewInputs.self)
        _forEachField(of: _ViewInputs.self, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        //        
        print("===")
        
        print(_ViewOutputs.self)
        _forEachField(of: _ViewOutputs.self, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        //        
        print("===")
        
        print(_RendererConfiguration.RasterizationOptions.self)
        _forEachField(of: _RendererConfiguration.RasterizationOptions.self, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        //        
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI11DisplayListV11ViewUpdaterC")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI11DisplayListV11ViewUpdaterC")!, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        //        
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI28AccessibilityGeometryUpdaterV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI28AccessibilityGeometryUpdaterV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        //        
        print("===")
        
        print(PreferenceValues.self)
        _forEachField(of: PreferenceValues.self, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        //        
        print("===")
        
        // expr -l swift -O -- _mangledTypeName(type(of: unsafeBitCast(0x106a5ee80, to: AnyObject.self)))
        
        print(_typeName(_typeByName("7SwiftUI23ImmersiveSpaceAuthorityC")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI23ImmersiveSpaceAuthorityC")!, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        
        //     
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI24HostingControllerBridgesV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI24HostingControllerBridgesV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        
        //     
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI17CachedEnvironmentV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI17CachedEnvironmentV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }  
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI14FocusViewGraphV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI14FocusViewGraphV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI11ViewGraph3DV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI11ViewGraph3DV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI22AccessibilityViewGraphV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI22AccessibilityViewGraphV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }   
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI23AccessibilityAttachmentV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI23AccessibilityAttachmentV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }         
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI28AccessibilityAttachmentTokenO")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI28AccessibilityAttachmentTokenO")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }         
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI27AnimatableFrameAttributeVFDV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI27AnimatableFrameAttributeVFDV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            
            if String(cString: name) == "velocityFilter" {
                print("FrameVelocityFilter")
                _forEachField(of: type, options: []) { name, offset, type, kind in
                    print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
                    return true
                }    
            }
            return true
        }      
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI33AccessibilityViewResponderUpdaterV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI33AccessibilityViewResponderUpdaterV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }      
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI13ViewResponderC")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI13ViewResponderC")!, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }      
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI26DefaultLayoutViewResponderC")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI26DefaultLayoutViewResponderC")!, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }      
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI12RootGeometryV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI12RootGeometryV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }      
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI32_DisplayList_StableIdentityScopeV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI32_DisplayList_StableIdentityScopeV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }      
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI12PropertyListV7ElementC")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI12PropertyListV7ElementC")!, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }      
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI5ColorVAAE11ResolvedHDRV11_AnimatableV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI5ColorVAAE11ResolvedHDRV11_AnimatableV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }      
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI11FocusBridgeC")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI11FocusBridgeC")!, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }      
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI11DisplayListV11ViewUpdaterC5ModelO13PlatformStateV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI11DisplayListV11ViewUpdaterC5ModelO13PlatformStateV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }      
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI11DisplayListV11ViewUpdaterC5ModelO13PlatformStateV8VersionsV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI11DisplayListV11ViewUpdaterC5ModelO13PlatformStateV8VersionsV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }      
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI11DisplayListV11ViewUpdaterC5ModelO5StateV8VersionsV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI11DisplayListV11ViewUpdaterC5ModelO5StateV8VersionsV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }      
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI11DisplayListV11ViewUpdaterC0E5CacheV6ResultV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI11DisplayListV11ViewUpdaterC0E5CacheV6ResultV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }      
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI16FixedRoundedRectV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI16FixedRoundedRectV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }      
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI11DisplayListV11ViewUpdaterC5ModelO5StateV7GlobalsV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI11DisplayListV11ViewUpdaterC5ModelO5StateV7GlobalsV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }      
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI11DisplayListV11ViewUpdaterC08PlatformE4InfoV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI11DisplayListV11ViewUpdaterC08PlatformE4InfoV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }      
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI11DisplayListV11ViewUpdaterC8PlatformV5StateV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI11DisplayListV11ViewUpdaterC8PlatformV5StateV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }      
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI11DisplayListV11ViewUpdaterC08PlatformE4InfoV5SeedsV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI11DisplayListV11ViewUpdaterC08PlatformE4InfoV5SeedsV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }      
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI11DisplayListV5IndexV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI11DisplayListV5IndexV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }      
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI11DisplayListV11ViewUpdaterC0E5CacheV3KeyV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI11DisplayListV11ViewUpdaterC0E5CacheV3KeyV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }      
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI12PropertyListV7TrackerC")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI12PropertyListV7TrackerC")!, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }      
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI11DisplayListV11ViewUpdaterC8PlatformV0G5StateV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI11DisplayListV11ViewUpdaterC8PlatformV0G5StateV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }      
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI23_SafeAreaInsetsModifierV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI23_SafeAreaInsetsModifierV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }      
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI14SafeAreaInsetsV7ElementV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI14SafeAreaInsetsV7ElementV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }      
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI27DepthStashingLayoutComputerV6EngineV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI27DepthStashingLayoutComputerV6EngineV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }      
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI27DepthStashingLayoutComputerV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI27DepthStashingLayoutComputerV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }      
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI18RootDepthTransformV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI18RootDepthTransformV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }      
        print("===")

        
        
        print(_typeName(ViewTransform.self, qualified: true))
        _forEachField(of: ViewTransform.self, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        
        print("===")
        
        
        print(_typeName(ViewTransform.self, qualified: true))
        _forEachField(of: ViewTransform.self, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        
        print("===")
        
        
        print(_typeName(ViewDepth.self, qualified: true), "\(MemoryLayout<ViewDepth>.size)")
        _forEachField(of: ViewDepth.self, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        
        print("===")
        
        
        print(_typeName(AnimatableAttributeHelper<Double>.self, qualified: true))
        _forEachField(of: AnimatableAttributeHelper<Double>.self, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        
        //        
        print("===")
        
        print(_typeName(EnvironmentValues.self, qualified: true))
        _forEachField(of: EnvironmentValues.self, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        
        //        
        print("===")
        
        print(_typeName(DisplayList.self, qualified: true))
        _forEachField(of: DisplayList.self, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        //        
        print("===")
        
        
        print(_typeName(_UIHostingView<Color>.self, qualified: true))
        _forEachField(of: _UIHostingView<Color>.self, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        //        
        print("===")
        
        print(_typeName(GraphHost.self, qualified: true))
        _forEachField(of: GraphHost.self, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        //        
        print("===")
        
        print(_typeName(GraphHost.Data.self, qualified: true))
        _forEachField(of: GraphHost.Data.self, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        
        print("===")
        
        print(_typeName(ViewGraphDisplayLink.self, qualified: true))
        _forEachField(of: ViewGraphDisplayLink.self, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        
        print("===")
        
//        let viewDefinition = (UIView.self as AnyClass)._swiftUI_platformViewDefinition() as! PlatformViewDefinition.Type
//        let viewGraphHost = ViewGraphHost.init(rootViewType: EmptyView.self, outputs: .init(rawValue: 0), viewDefinition: viewDefinition)
//        print(viewGraphHost)
//        viewGraphHost.startDisplayLink(delay: 0.002) { object, selector in
//            CADisplayLink(target: object, selector: selector)
//        }
        
        print(_typeName(UIHostingViewBase.self, qualified: true))
        _forEachField(of: UIHostingViewBase.self, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        
        print("===")
        
        print(_typeName(ViewGraphHost.self, qualified: true))
        _forEachField(of: ViewGraphHost.self, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        
        print("===")
        
        print(_typeName(ViewGraph.self, qualified: true))
        _forEachField(of: ViewGraph.self, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        
        print("===")
//        
//        print(ViewGraph.Data.self)
//        _forEachField(of: ViewGraph.Data.self, options: []) { name, offset, type, kind in
//            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
//            return true
//        }
//        
//        print("===")
//        
//        print(ViewGraph.self)
//        _forEachField(of: ViewGraph.self, options: [.classType]) { name, offset, type, kind in
//            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
//            return true
//        }
//        
//        print("===")
//        
//        print(GraphHost.self)
//        _forEachField(of: GraphHost.self, options: [.classType]) { name, offset, type, kind in
//            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
//            return true
//        }
//        
//        print("===")
//        
//        print(RepresentableContextValues.self)
//        _forEachField(of: RepresentableContextValues.self, options: []) { name, offset, type, kind in
//            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
//            return true
//        }
//        
        print("===")
        
        print(_typeName(Update.Action.self, qualified: true))
        _forEachField(of: Update.Action.self, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        //        
        print("===")
        
        print(_typeName(CustomEventTrace.Recorder.self, qualified: true))
        _forEachField(of: CustomEventTrace.Recorder.self, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        //        
        print("===")
        
        print(_typeName(ColorView.self, qualified: true))
        _forEachField(of: ColorView.self, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        //        
        print("===")
        
        print(_typeName(DisplayList.Item.self, qualified: true))
        _forEachField(of: DisplayList.Item.self, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        //        
        print("===")
        
        print(_typeName(Image.DynamicRange.self, qualified: true))
        _forEachField(of: Image.DynamicRange.self, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        
        print("===")
        
        print(_typeName(ObjectCache<Int, Int>.self, qualified: true))
        _forEachField(of: ObjectCache<Int, Int>.self, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
//        var graphValue = _GraphValue<AnimatableFoo>(.init(identifier: .empty))
//        AnimatableFoo._makeAnimatable(value: &graphValue, inputs: .init(time: .init(identifier: .empty), phase: .init(identifier: .empty), environment: .init(identifier: .empty), transaction: .init(identifier: .empty)))
        
       
        
//        let graph = Graph()
//        let subgraph = Subgraph(graph: graph)
//        Subgraph.current = subgraph
////        let attribute = Attribute(value: MyDynamicView())
////        _ = MyDynamicView.makeDynamicView(
////            metadata: (),
////            view: .init(attribute),
////            inputs: .init(
////                .init(time: .init(identifier: .empty), phase: .init(identifier: .empty), environment: .init(identifier: .empty), transaction: .init(identifier: .empty)), position: .init(identifier: .empty), size: .init(identifier: .empty), transform: .init(identifier: .empty), containerPosition: .init(identifier: .empty), hostPreferenceKeys: .init(identifier: .empty))
////        )
//        
//        let attribute = Attribute(value: MyLeafView())
//        let base = _GraphInputs(
//            time: Attribute(value: Time(seconds: 0)),
//            phase: Attribute(value: _GraphInputs.Phase(value: 0)),
//            environment: Attribute(value: EnvironmentValues()),
//            transaction: Attribute(value: Transaction())
//        )
//        MyLeafView.makeLeafView(
//            view: .init(attribute),
//            inputs: _ViewInputs(
//                base,
//                position: Attribute(value: CGPoint.zero),
//                size: Attribute(value: ViewSize(.zero, proposal: _ProposedSize.init(.zero))),
//                transform: Attribute(value: ViewTransform()),
//                containerPosition: Attribute(value: .zero),
//                hostPreferenceKeys: Attribute(value: PreferenceKeys())
//            )
//        )
//        
//        Subgraph.current = nil
//        graph.setNeedsUpdate()
//        subgraph.update(1)
//        _ = consume graph
        
//        let item = DisplayList.Item.init(.empty, frame: .zero, identity: .init(), version: .init())
//        let displayList = DisplayList(item)
        
        let cache = ObjectCache<Int, Int>.init { _ in
            return 3
        }
        print(cache[4])
        print(cache[4])
        print(cache[5])
        
        do {
            var insets = EdgeInsets(
                top: 10, leading: 20, bottom: 30, trailing: 40
            )
//            insets.xFlipIfRightToLeft(layoutDirection: .rightToLeft)
            
            print(insets.originOffset)
            print(insets.negatedInsets)
            
            var other = EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
            print(insets.subtracting(other))
        }
        
        do {
            let insets = RectangleCornerInsets(topLeading: CGSize(width: 10, height: 10), topTrailing: CGSize(width: 20, height: 20), bottomLeading: CGSize(width: 30, height: 30), bottomTrailing: CGSize(width: 40, height: 40))
            print(AbsoluteRectangleCornerInsets(insets, layoutDirection: .leftToRight))
            print(AbsoluteRectangleCornerInsets(insets, layoutDirection: .rightToLeft))
        }
        
        do {
            let edgeInsets = EdgeInsets(top: 30, leading: 40, bottom: 50, trailing: 60)
            let result = edgeInsets.inset(
                by: RectangleCornerInsets(
                    topLeading: CGSize(width: 5, height: 5),
                    topTrailing: CGSize(width: 5, height: 5),
                    bottomLeading: CGSize(width: 5, height: 5),
                    bottomTrailing: CGSize(width: 5, height: 5)
                ),
                edges: .top
            )
            print(result)
        }
        
        
        //        let rootView = EmptyView()
        let rootView = AnyView(Color.black)
//        let rootView = Color.black
//        let rootView = MyLeafView()
//        let rootView = MyEnvView()
//        let rootView = MyView()
        let hostingView = MyHostingView(rootView: rootView)
//        let hostingView = MyHostingView(rootView: rootView)
        self.view = hostingView
        
        Task { [hostingView] in
            var flags = 0
            
            while true {
                do {
                    try await Task.sleep(for: .seconds(1))
                    let value = flags % 3
                    
                    if value == 0 {
                        hostingView.rootView = AnyView(Color.white)
                    } else if value == 1 {
                        hostingView.rootView = AnyView(EmptyView())
                    } else if value == 2 {
                        hostingView.rootView = AnyView(Color.black)
                    }
                    
                    flags &+= 1
                } catch {
                    return
                }
            }
        }
        
//        Task {
//            try! await Task.sleep(for: .seconds(1))
//            hostingView.rootView = AnyView(EmptyView())
//        }
        
//        Task {
//            var flag = true
//            while true {
//                try! await Task.sleep(for: .seconds(1))
//                
//                if flag {
////                    hostingView.rootView = AnyView(EmptyView())
//                    hostingView.rootView = AnyView(Color.black)
//                } else {
//                    hostingView.rootView = AnyView(EmptyView())
////                    hostingView.rootView = AnyView(Color.white)
//                }
//                
//                flag.toggle()
//            }
//        }
        
        print(NSStringFromClass(object_getClass(hostingView)!))
        print(hostingView)
    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        let hostingController = UIHostingController(rootView: EmptyView())
//        addChild(hostingController)
//        view.addSubview(hostingController.view)
//        hostingController.view.frame = view.bounds
//        hostingController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        hostingController.didMove(toParent: self)
//    }
    
//    MyEnvView
}

final class MyHostingView<Content: View>: _UIHostingView<Content> {
    override var preferredFocusEnvironments: [any UIFocusEnvironment] {
        return []
    }
    
    override func focusItems(in rect: CGRect) -> [any UIFocusItem] {
        return []
    }
}

struct MyLeafView: RendererLeafView, Animatable {
    var animatableData: Double {
        get {
            3
        }
        set {
            
        }
    }
    
    static var requiresMainThread: Bool {
        true
    }
    
    func content() -> _SwiftUICorePrivate.DisplayList.Content.Value {
        return .placeholder(id: .init())
    }
    
    static nonisolated func _makeView(view: _GraphValue<Self>, inputs: _ViewInputs) -> _ViewOutputs {
        var view = view
        _makeAnimatable(value: &view, inputs: inputs.base)
        return makeLeafView(view: view, inputs: inputs)
    }
}

struct MyEnvView: EnvironmentalView {
    func body(environment: EnvironmentValues) -> MyLeafView {
        MyLeafView()
    }
}

@_weakLinked
class MyVTable: _UnsafeHeterogeneousBuffer_VTable {
    
}

struct MyClass_1 {
    var num = (3, 3, 3,3,3,3,3,3)
}

struct MyClass_2 {
    
}

struct MyAnimation: CustomAnimation {
    func animate<V>(value: V, time: TimeInterval, context: inout AnimationContext<V>) -> V? where V : VectorArithmetic {
        fatalError()
    }
}

struct MyView: View {
    var body: some View {
        Color.black
    }
}
