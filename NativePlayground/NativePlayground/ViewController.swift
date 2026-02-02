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
@_spi(SwiftUI) import _SwiftUICorePrivate
import AttributeGraph
import Spatial
import Darwin.POSIX.dlfcn

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

struct GeometryMeasurer: ViewGraphGeometryMeasurer {
    typealias Proposal = CGPoint
    typealias Size = CGSize
}

extension ViewController: ContentResponder {}

struct Box: DynamicPropertyBox {
    func update(property: inout State<Bool>, phase: _GraphInputs.Phase) -> Bool {
        fatalError()
    }
    
    typealias Property = State<Bool>
}

@Observable
final class FooModel {
    var number = 0
}

struct MyItem: DynamicContainerItem {
    var count: Int {
        return 3
    }
    
    var number = 3
    func matchesIdentity(of item: Self) -> Bool {
        return false
    }
    
    var needsTransitions: Bool {
        false
    }
    
    static var supportsReuse: Bool {
        return true
    }
}

struct MyAdapter: DynamicContainerAdaptor {
    func updatedItems() -> MyItem? {
        return MyItem()
//        return nil
    }
    
    func makeItemLayout(item: MyItem, uniqueId: UInt32, inputs: _ViewInputs, containerInfo: AttributeGraph.Attribute<_SwiftUICorePrivate.DynamicContainer.Info>, containerInputs: (inout _ViewInputs) -> Void) -> (_ViewOutputs, Void) {
        let outputs = _ViewOutputs.init()
        return (outputs, ())
    }
    
    func removeItemLayout(uniqueId: UInt32, itemLayout: Void) {
        fatalError("TODO")
    }
    
    typealias Item = MyItem
    
    typealias Items = MyItem
    
    typealias ItemLayout = Void
    
    
}

struct MyAlignmentID: AlignmentID {
    static func defaultValue(in context: ViewDimensions) -> CGFloat {
        fatalError("TODO")
    }
}

class ViewController: UIViewController {
    override func loadView() {
//        let object = NSObject()
//        let result = buffer.update(container: Unmanaged.passUnretained(object).toOpaque(), phase: .invalid)
//        print(buffer.count)
//        buffer.applyChanged { index in
//            print(index)
//        }
//        buffer.reset()
//        buffer.destroy()
//        var helper = ContentResponderHelper<ViewController>()
////        helper.data = self
//        
//        print(_typeName(ContentResponderHelper<ViewController>.self, qualified: true))
//        _forEachField(of: ContentResponderHelper<ViewController>.self, options: []) { name, offset, type, kind in
//            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
//            return true
//        }
//        print("===")
//        print(_typeName(ViewTransform.self, qualified: true))
//        _forEachField(of: ViewTransform.self, options: []) { name, offset, type, kind in
//            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
//            return true
//        }
//        
//        print("===")
//        
//        let viewGraph = ViewGraph(rootViewType: Color.self, requestedOutputs: ViewGraph.Outputs())
//        let graph = Graph()
//        let subgraph = Subgraph(graph: graph)
//        Subgraph.current = subgraph
//        AGGraphSetContext(graph, Unmanaged.passUnretained(viewGraph).toOpaque())
////        graph.context = Unmanaged.passUnretained(viewGraph).toOpaque()
//        
//        helper.update(
//            data: (value: self, changed: false),
//            size: (value: ViewSize(CGSize(width: 1, height: 2), proposal: _ProposedSize(CGSize(width: 3, height: 4))), changed: true),
//            position: (value: CGPoint(x: 5, y: 6), changed: true),
//            transform: (value: ViewTransform(), changed: true),
//            parent: ViewResponder()
//        )
        
        let transform3D = AffineTransform3D(CATransform3D(m11: 11, m12: 12, m13: 13, m14: 14, m21: 21, m22: 22, m23: 23, m24: 24, m31: 31, m32: 32, m33: 33, m34: 34, m41: 41, m42: 42, m43: 43, m44: 44))
        print(transform3D)
        print(CGAffineTransform(transform3D))
        
        let ptr = UnsafeMutablePointer<CoordinateSpace>.allocate(capacity: 1)
        ptr.initialize(to: .local)
        
        print(CoordinateSpace.root)
        
        print(UnsafeRawPointer(ptr)
            .advanced(by: 0x0)
            .assumingMemoryBound(to: UInt64.self)
            .pointee)
        
        print(UnsafeRawPointer(ptr)
            .advanced(by: 0x8)
            .assumingMemoryBound(to: UInt64.self)
            .pointee)
        
        print(UnsafeRawPointer(ptr)
            .advanced(by: 0x10)
            .assumingMemoryBound(to: UInt64.self)
            .pointee)
        
        print(UnsafeRawPointer(ptr)
            .advanced(by: 0x18)
            .assumingMemoryBound(to: UInt64.self)
            .pointee)
        
        print(UnsafeRawPointer(ptr)
            .advanced(by: 0x20)
            .assumingMemoryBound(to: UInt64.self)
            .pointee)
        
        print(UnsafeRawPointer(ptr)
            .advanced(by: 0x28)
            .assumingMemoryBound(to: UInt8.self)
            .pointee)
        
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
        
        print(ContentSizedSceneFeature<GeometryMeasurer>.self)
        _forEachField(of: ContentSizedSceneFeature<GeometryMeasurer>.self, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        //        
        print("===")
        
        print(ViewGraphGeometryObservers<GeometryMeasurer>.self)
        _forEachField(of: ViewGraphGeometryObservers<GeometryMeasurer>.self, options: []) { name, offset, type, kind in
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
        
        print(_ViewListOutputs.self)
        _forEachField(of: _ViewListOutputs.self, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        //        
        print("===")
        
        print(ViewDimensions3D.self)
        _forEachField(of: ViewDimensions3D.self, options: []) { name, offset, type, kind in
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
        
        print(_typeName(_typeByName("7SwiftUI15_ProposedSize3DV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI15_ProposedSize3DV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }      
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI13_ProposedSizeV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI13_ProposedSizeV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }      
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI24ObservationGraphMutationV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI24ObservationGraphMutationV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }      
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI20IndirectAttributeMapC")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI20IndirectAttributeMapC")!, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }      
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI24DynamicLayoutViewAdaptorV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI24DynamicLayoutViewAdaptorV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }      
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI18DynamicContainerIDV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI18DynamicContainerIDV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }      
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI16DynamicContainerV8ItemInfoC")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI16DynamicContainerV8ItemInfoC")!, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }      
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI17_ViewList_SublistV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI17_ViewList_SublistV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }      
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI12ViewGeometryV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI12ViewGeometryV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }      
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI14ViewDimensionsV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI14ViewDimensionsV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }      
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI8ViewSizeV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI8ViewSizeV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }      
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI16DynamicLayoutMapV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI16DynamicLayoutMapV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }      
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI19DynamicViewListItemV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI19DynamicViewListItemV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }      
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI16DynamicContainerV8ItemInfoC")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI16DynamicContainerV8ItemInfoC")!, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }      
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI10ViewSize3DV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI10ViewSize3DV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }      
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI33PairwisePreferenceCombinerVisitorV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI33PairwisePreferenceCombinerVisitorV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }      
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI16AppearanceEffectV")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI16AppearanceEffectV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }      
        print("===")
        
        
//        print(_typeName(_typeByName("7SwiftUI24ContentSizedSceneFeatureV")!, qualified: true))
//        _forEachField(of: _typeByName("7SwiftUI24ContentSizedSceneFeatureV")!, options: []) { name, offset, type, kind in
//            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
//            return true
//        }      
//        print("===")

        
        
        
        
        print(_typeName(ViewTransform.self, qualified: true))
        _forEachField(of: ViewTransform.self, options: []) { name, offset, type, kind in
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
        
        
        print(_typeName(_UIHostingView<AnyView>.self, qualified: true))
        _forEachField(of: _UIHostingView<AnyView>.self, options: [.classType]) { name, offset, type, kind in
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
        
        print("===")
        
        print(_typeName(MultiViewResponder.self, qualified: true))
        _forEachField(of: MultiViewResponder.self, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        
        print("===")
        
        print(_typeName(DynamicPropertyCache.Fields.self, qualified: true))
        _forEachField(of: DynamicPropertyCache.Fields.self, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        
        print("===")
        
        print(_typeName(ObservationCenter.self, qualified: true))
        _forEachField(of: ObservationCenter.self, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        
        print(_typeName(ViewDimensions.self, qualified: true))
        _forEachField(of: ViewDimensions.self, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        
        print("===")
        
        print(_typeName(_ViewListInputs.self, qualified: true))
        _forEachField(of: _ViewListInputs.self, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        
        print("===")
        
        print(_typeName(DynamicContainer.Info.self, qualified: true))
        _forEachField(of: DynamicContainer.Info.self, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        
        print("===")
        
        print(_typeName(DynamicContainer.ItemInfo.self, qualified: true))
        _forEachField(of: DynamicContainer.ItemInfo.self, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        
        print("===")
        
        print(_typeName(PlatformAccessibilitySettingsDefinition.self, qualified: true))
        _forEachField(of: PlatformAccessibilitySettingsDefinition.self, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        
        print("===")
        
        print(_typeName(LayoutSubviews.self, qualified: true))
        _forEachField(of: LayoutSubviews.self, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        
        print("===")
        
        print(_typeName(GeometryProxy.self, qualified: true))
        _forEachField(of: GeometryProxy.self, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        
        print("===")
        
        print(_typeName(_ViewList_Subgraph.self, qualified: true))
        _forEachField(of: _ViewList_Subgraph.self, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        
        print("===")
        
        print(_typeName(_ViewList_Group.self, qualified: true))
        _forEachField(of: _ViewList_Group.self, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        
        print("===")
         
        
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
        
//        var array = Array(0..<100).shuffled()
//        array.insertionSort { _, _ in .random() }
        
//        let item = DisplayList.Item.init(.empty, frame: .zero, identity: .init(), version: .init())
//        let displayList = DisplayList(item)
//        
//        let graph = Graph()
//        let subgraph = Subgraph(graph: graph)
//        Subgraph.current = subgraph
//        graph.context = UnsafeRawPointer(
//            Unmanaged
//                .passRetained(
//                    ViewGraph.init(rootViewType: EmptyView.self, requestedOutputs: .defaults)
//                )
//        .toOpaque())
//        let phase: Attribute<SwiftUI._GraphInputs.Phase> = .init(value: .init(value: 3))
//        var inputs = _ViewInputs.init(withoutGeometry: .init(time: .init(value: .zero), phase: phase, environment: .init(value: .init()), transaction: .init(value: .init())))
//        inputs.preferences.add(ViewRespondersKey.self)
//        let host = GraphHost.init(data: .init())
//        let (info, _) = DynamicContainer.makeContainer(adaptor: MyAdapter(), inputs: inputs)
//        _ = info.value
//        phase.value.merge(.init(value: 4))
//        print(info.value)
//        fatalError()
//        
//        
//        
//        print(_typeName(info.identifier._bodyType, qualified: true))
//        _forEachField(of: info.identifier._bodyType, options: []) { name, offset, type, kind in
//            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
//            return true
//        }
//        
//        print("===")
//        
//        print(info.value)
        
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
        
        var size3D = ViewSize3D.fixed(Size3D(width: 30, height: 10, depth: Double.nan))
        size3D.viewDepth.proposal = .infinity
        print(size3D)
        
        
        //        let rootView = EmptyView()
//        let rootView = AnyView(Color.black)
//        let rootView = Color.black
//        let rootView = MyLeafView()
//        let rootView = MyEnvView()
        
//        var collection = ViewTraitCollection()
//        collection[MyKey.self] = false
//        collection[MyKey.self] = true
//        
//        let model = ObsModel()
//        let rootView = MyObsView(model: model)
        
//        let rootView = MyLayoutView(model: model)
//        let rootView = MyTupleView()
        
//        let model = MyDynamicTupleView.Model.init()
//        let rootView = MyDynamicTupleView.init(model: model)
        
//        let model = MyAppearanceActionView.Model()
//        let rootView = MyAppearanceActionView(model: model) { 
//            print("onAppear")
//        } onDisappear: { 
//            print("onDisappear")
//        }

        let rootView = MyBindingView()
        
        let hostingView = _UIHostingView(rootView: rootView)
//        let hostingView = MyHostingView(rootView: rootView)
        self.view = hostingView
        
//        Task {
//            while true {
//                try await Task.sleep(for: .seconds(1))
//                model.flag.toggle()
//            }
//        }
        
//        Task {
//            while true {
//                try await Task.sleep(for: .seconds(1))
//                model.count &-= 1
//                break
//                if model.count == 6 {
//                    model.count = 0
//                }
//            }
//        }
        
//        Task { [hostingView] in
//            var flags = 0
//            
//            while true {
//                do {
//                    try await Task.sleep(for: .seconds(1))
//                    let value = flags % 3
//                    
//                    if value == 0 {
//                        hostingView.rootView = AnyView(Color.white)
//                    } else if value == 1 {
//                        hostingView.rootView = AnyView(EmptyView())
//                    } else if value == 2 {
//                        hostingView.rootView = AnyView(Color.black)
//                    }
//                    
//                    flags &+= 1
//                } catch {
//                    return
//                }
//            }
//        }
        
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
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        Task {
//            try! await Task.sleep(for: .seconds(1))
//            navigationController?.popViewController(animated: true)
//        }
//    }
}

struct MyKey: _ViewTraitKey {
    static var defaultValue: Bool {
        true
    }
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

@MainActor
@Observable
final class ObsModel {
    var flag = false
    var nullable: Int?
}

fileprivate struct MyObsView: View {
    let model: ObsModel
    
    var body: some View {
        MyLayout {
            if model.flag {
                Color.white
            } else {
                Color.black
            }
        }
    }
}

fileprivate struct MyAlignmentGuide: AlignmentGuide, Sendable {
    var key: AlignmentKey {
        return AlignmentKey(id: MyAlignmentID.self, axis: .horizontal)
    }
    
    nonisolated init() {}
}

fileprivate struct MyLayout: /*Layout*/HVStack, Sendable {
    var spacing: CGFloat? {
        return 3
    }
    
    var alignment: MyAlignmentGuide {
        return MyAlignmentGuide()
    }
    
    static var majorAxis: Axis {
        return .horizontal
    }
    
    static var resizeChildrenWithTrailingOverflow: Bool {
        return false
    }
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout _StackLayoutCache) -> CGSize {
//        fatalError("TODO")
        return CGSize(width: proposal.width!, height: proposal.height!)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout _StackLayoutCache) {
        for subview in subviews {
            subview.place(at: .zero, proposal: proposal)
        }
    }
}

fileprivate struct MyLayoutView: View {
    let model: ObsModel
    
    var body: some View {
        MyLayout2(model: model) {
            if model.flag {
                Color.white
            } else {
                Color.black
            }
        }
    }
}

fileprivate struct MyLayout2: Layout {
    let model: ObsModel
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        return CGSize(width: proposal.width!, height: proposal.height!)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        MainActor.assumeIsolated {
            for subview in subviews {
                subview.place(
                    at: CGPoint(
                        x: bounds.origin.x + (model.flag ? 60 : 90),
                        y: bounds.origin.y + (model.flag ? 60 : 90)
                    ),
                    anchor: .topLeading,
                    proposal: ProposedViewSize(
                        width: bounds.size.width * (model.flag ? 0.5 : 0.3),
                        height: bounds.size.height * (model.flag ? 0.3 : 0.5)
                    )
                )
            }
        }
    }
}

fileprivate struct MyTupleView: View {
    var body: some View {
        Color.black
        Color.white
        Color.black
    }
}

fileprivate struct MyDynamicTupleView: View {
    @MainActor
    @Observable
    fileprivate final class Model {
        var count = 1
    }
    
    let model: MyDynamicTupleView.Model
    
    var body: some View {
        if model.count >= 1 {
            Color.black
        }
        
        if model.count >= 2 {
            Color.white
        }
        
        if model.count >= 3 {
            Color.black
        }
        
        if model.count >= 4 {
            Color.white
        }
        
        if model.count >= 5 {
            Color.black
        }
    }
}

fileprivate struct MyAppearanceActionView: View {
    @MainActor
    @Observable
    fileprivate final class Model {
        var flag = true
    }
    
    let model: Model
    let onAppear: () -> Void
    let onDisappear: () -> Void
    
    var body: some View {
        if model.flag {
            Color.white
                .onAppear(perform: onAppear)
                .onDisappear(perform: onDisappear)
            
//            Color.white
//            
//            Color.white
        } else {
            Color.black
                .onAppear(perform: onAppear)
                .onDisappear(perform: onDisappear)
        }
    }
}

fileprivate struct MyStateView: View {
    @State private var flag = false
    
    var body: some View {
        if flag {
            Color.black
                .onAppear { 
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        flag.toggle()
                    }
                }
        } else {
            Color.white
                .onAppear { 
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        flag.toggle()
                    }
                }
        }
    }
}


fileprivate struct MyBindingView: View {
    @State private var flag = false
    
    var body: some View {
        if flag {
            Color.black
            
            MyChildView(flag: $flag)
        } else {
            Color.white
            
            Color.white
            
            MyChildView(flag: $flag)
        }
        
        MyConstantView(flag: .constant(true))
    }
    
    struct MyChildView: View {
        @Binding var flag: Bool
        
        var body: some View {
            Color.white
                .onAppear { 
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        flag.toggle()
                    }
                }
        }
    }
    
    fileprivate struct MyConstantView: View {
        @Binding var flag: Bool
        
        var body: some View {
            if flag {
                Color.black
            } else {
                Color.white
            }
        }
    }
}
