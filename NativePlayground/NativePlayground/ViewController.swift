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
//        swizzle()
        
        print(_typeByName("7SwiftUI11DisplayListVAAE12ViewRendererC")!)
        _forEachField(of: _typeByName("7SwiftUI11DisplayListVAAE12ViewRendererC")!, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }
        //        
        print("===")
        
        print(_typeByName("7SwiftUI11DisplayListV11ViewUpdaterC")!)
        _forEachField(of: _typeByName("7SwiftUI11DisplayListV11ViewUpdaterC")!, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }
        //        
        print("===")
        
        print(_typeByName("7SwiftUI11DisplayListV11ViewUpdaterC0E5CacheV")!)
        _forEachField(of: _typeByName("7SwiftUI11DisplayListV11ViewUpdaterC0E5CacheV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }
        //        
        print("===")
        
        print(_typeByName("7SwiftUI11DisplayListV11ViewUpdaterC0E4InfoV")!)
        _forEachField(of: _typeByName("7SwiftUI11DisplayListV11ViewUpdaterC0E4InfoV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }
        //        
        print("===")
        
        print(_typeByName("7SwiftUI11DisplayListV11ViewUpdaterC8PlatformV")!)
        _forEachField(of: _typeByName("7SwiftUI11DisplayListV11ViewUpdaterC8PlatformV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }
        //        
        print("===")
        
        print(_typeByName("7SwiftUI19ResolvedShadowStyleV")!)
        _forEachField(of: _typeByName("7SwiftUI19ResolvedShadowStyleV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }
        //        
        print("===")
        
        print(_typeByName("7SwiftUI11DisplayListV11ViewUpdaterC5ModelO5StateV")!)
        _forEachField(of: _typeByName("7SwiftUI11DisplayListV11ViewUpdaterC5ModelO5StateV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }
        //        
        print("===")
        
        print(_typeByName("7SwiftUI11DisplayListV11ViewUpdaterC8PlatformV5StateV")!)
        _forEachField(of: _typeByName("7SwiftUI11DisplayListV11ViewUpdaterC8PlatformV5StateV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }   
        print("===")
        
        print(_typeByName("7SwiftUI11DisplayListV11ViewUpdaterC0E4InfoV5SeedsV")!)
        _forEachField(of: _typeByName("7SwiftUI11DisplayListV11ViewUpdaterC0E4InfoV5SeedsV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }
        print("===")
        
        print(_typeByName("7SwiftUI25PlatformItemListViewGraphV")!)
        _forEachField(of: _typeByName("7SwiftUI25PlatformItemListViewGraphV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }
        //        
        print("===")
        
        print(_typeByName("7SwiftUI17CachedEnvironmentV13AnimatedFrameV")!)
        _forEachField(of: _typeByName("7SwiftUI17CachedEnvironmentV13AnimatedFrameV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }
        //        
        print("===")
        
        print(_typeByName("7SwiftUI24AnimatableFrameAttributeV")!)
        _forEachField(of: _typeByName("7SwiftUI24AnimatableFrameAttributeV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }
        //        
        print("===")
        
        print(_GraphInputs.self)
        _forEachField(of: _GraphInputs.self, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }
        print("===")
        
        print(_ViewInputs.self)
        _forEachField(of: _ViewInputs.self, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }
        //        
        print("===")
        
        print(_ViewOutputs.self)
        _forEachField(of: _ViewOutputs.self, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }
        //        
        print("===")
        
        print(_RendererConfiguration.RasterizationOptions.self)
        _forEachField(of: _RendererConfiguration.RasterizationOptions.self, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }
        //        
        print("===")
        
        print(_typeByName("7SwiftUI11DisplayListV11ViewUpdaterC")!)
        _forEachField(of: _typeByName("7SwiftUI11DisplayListV11ViewUpdaterC")!, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }
        //        
        print("===")
        
        print(_typeByName("7SwiftUI28AccessibilityGeometryUpdaterV")!)
        _forEachField(of: _typeByName("7SwiftUI28AccessibilityGeometryUpdaterV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }
        //        
        print("===")
        
        print(PreferenceValues.self)
        _forEachField(of: PreferenceValues.self, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }
        //        
        print("===")
        
        // expr -l swift -O -- _mangledTypeName(type(of: unsafeBitCast(0x106a5ee80, to: AnyObject.self)))
        
        print(_typeByName("7SwiftUI23ImmersiveSpaceAuthorityC")!)
        _forEachField(of: _typeByName("7SwiftUI23ImmersiveSpaceAuthorityC")!, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }
        
        //     
        print("===")
        
        print(_typeByName("7SwiftUI24HostingControllerBridgesV")!)
        _forEachField(of: _typeByName("7SwiftUI24HostingControllerBridgesV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }
        
        //     
        print("===")
        
        print(_typeByName("7SwiftUI17CachedEnvironmentV")!)
        _forEachField(of: _typeByName("7SwiftUI17CachedEnvironmentV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }  
        print("===")
        
        print(_typeByName("7SwiftUI14FocusViewGraphV")!)
        _forEachField(of: _typeByName("7SwiftUI14FocusViewGraphV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }
        print("===")
        
        print(_typeByName("7SwiftUI11ViewGraph3DV")!)
        _forEachField(of: _typeByName("7SwiftUI11ViewGraph3DV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }
        print("===")
        
        print(_typeByName("7SwiftUI22AccessibilityViewGraphV")!)
        _forEachField(of: _typeByName("7SwiftUI22AccessibilityViewGraphV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }   
        print("===")
        
        print(_typeByName("7SwiftUI23AccessibilityAttachmentV")!)
        _forEachField(of: _typeByName("7SwiftUI23AccessibilityAttachmentV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }         
        print("===")
        
        print(_typeByName("7SwiftUI28AccessibilityAttachmentTokenO")!)
        _forEachField(of: _typeByName("7SwiftUI28AccessibilityAttachmentTokenO")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }         
        print("===")
        
        print(_typeByName("7SwiftUI27AnimatableFrameAttributeVFDV")!)
        _forEachField(of: _typeByName("7SwiftUI27AnimatableFrameAttributeVFDV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            
            if String(cString: name) == "velocityFilter" {
                print("FrameVelocityFilter")
                _forEachField(of: type, options: []) { name, offset, type, kind in
                    print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
                    return true
                }    
            }
            return true
        }      
        print("===")
        
        print(_typeByName("7SwiftUI33AccessibilityViewResponderUpdaterV")!)
        _forEachField(of: _typeByName("7SwiftUI33AccessibilityViewResponderUpdaterV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }      
        print("===")
        
        print(_typeByName("7SwiftUI13ViewResponderC")!)
        _forEachField(of: _typeByName("7SwiftUI13ViewResponderC")!, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }      
        print("===")
        
        print(_typeByName("7SwiftUI26DefaultLayoutViewResponderC")!)
        _forEachField(of: _typeByName("7SwiftUI26DefaultLayoutViewResponderC")!, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }      
        print("===")
        
        print(_typeByName("7SwiftUI12RootGeometryV")!)
        _forEachField(of: _typeByName("7SwiftUI12RootGeometryV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }      
        print("===")
        
        print(_typeByName("7SwiftUI32_DisplayList_StableIdentityScopeV")!)
        _forEachField(of: _typeByName("7SwiftUI32_DisplayList_StableIdentityScopeV")!, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }      
        print("===")
        
        print(_typeByName("7SwiftUI12PropertyListV7ElementC")!)
        _forEachField(of: _typeByName("7SwiftUI12PropertyListV7ElementC")!, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }      
        print("===")
        
        
        print(ViewTransform.self)
        _forEachField(of: ViewTransform.self, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }
        
        print("===")
        
        
        print(ViewDepth.self, "\(MemoryLayout<ViewDepth>.size)")
        _forEachField(of: ViewDepth.self, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }
        
        print("===")
        
        
        print(AnimatableAttributeHelper<Double>.self)
        _forEachField(of: AnimatableAttributeHelper<Double>.self, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }
        
        //        
        print("===")
        
        print(EnvironmentValues.self)
        _forEachField(of: EnvironmentValues.self, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }
        
        //        
        print("===")
        
        print(DisplayList.self)
        _forEachField(of: DisplayList.self, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }
        //        
        print("===")
        
        
        print(_UIHostingView<EmptyView>.self)
        _forEachField(of: _UIHostingView<EmptyView>.self, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }
        //        
        print("===")
        
        print(GraphHost.self)
        _forEachField(of: GraphHost.self, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }
        //        
        print("===")
        
        print(GraphHost.Data.self)
        _forEachField(of: GraphHost.Data.self, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }
        
        print("===")
        
        print(ViewGraphDisplayLink.self)
        _forEachField(of: ViewGraphDisplayLink.self, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }
        
        print("===")
        
//        let viewDefinition = (UIView.self as AnyClass)._swiftUI_platformViewDefinition() as! PlatformViewDefinition.Type
//        let viewGraphHost = ViewGraphHost.init(rootViewType: EmptyView.self, outputs: .init(rawValue: 0), viewDefinition: viewDefinition)
//        print(viewGraphHost)
//        viewGraphHost.startDisplayLink(delay: 0.002) { object, selector in
//            CADisplayLink(target: object, selector: selector)
//        }
        
        print(UIHostingViewBase.self)
        _forEachField(of: UIHostingViewBase.self, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }
        
        print("===")
        
        print(ViewGraphHost.self)
        _forEachField(of: ViewGraphHost.self, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }
        
        print("===")
        
        print(ViewGraph.self)
        _forEachField(of: ViewGraph.self, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }
        
        print("===")
//        
//        print(ViewGraph.Data.self)
//        _forEachField(of: ViewGraph.Data.self, options: []) { name, offset, type, kind in
//            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
//            return true
//        }
//        
//        print("===")
//        
//        print(ViewGraph.self)
//        _forEachField(of: ViewGraph.self, options: [.classType]) { name, offset, type, kind in
//            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
//            return true
//        }
//        
//        print("===")
//        
//        print(GraphHost.self)
//        _forEachField(of: GraphHost.self, options: [.classType]) { name, offset, type, kind in
//            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
//            return true
//        }
//        
//        print("===")
//        
//        print(RepresentableContextValues.self)
//        _forEachField(of: RepresentableContextValues.self, options: []) { name, offset, type, kind in
//            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
//            return true
//        }
//        
        print("===")
        
        print(Update.Action.self)
        _forEachField(of: Update.Action.self, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }
        //        
        print("===")
        
        print(CustomEventTrace.Recorder.self)
        _forEachField(of: CustomEventTrace.Recorder.self, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
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
        
        
        //        let rootView = EmptyView()
//        let rootView = AnyView(EmptyView())
//        let rootView = Color.black
        let rootView = MyEnvView()
        let hostingView = _UIHostingView(rootView: rootView)
        self.view = hostingView
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

struct MyLeafView: RendererLeafView, Animatable {
    var animatableData: Double = 3
    
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
