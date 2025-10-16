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


func swizzle_1() {
    let method = class_getInstanceMethod(_UIHostingView<EmptyView>.self, #selector(setter:UIView.frame))
    let empty: (@convention(c) (AnyObject, Selector) -> Void) = { _, _ in }
    method_setImplementation(method!, unsafeBitCast(empty, to: IMP.self))
}
func swizzle_2() {
    let method = class_getInstanceMethod(_UIHostingView<EmptyView>.self, #selector(setter:UIView.bounds))
    let empty: (@convention(c) (AnyObject, Selector) -> Void) = { _, _ in }
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

class ViewController: UIViewController {
    override func loadView() {
//        swizzle_1()
//        swizzle_2()
        
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
        
        
        print(_UIHostingView<Color>.self)
        _forEachField(of: _UIHostingView<Color>.self, options: [.classType]) { name, offset, type, kind in
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
        
        struct MyView: UIViewRepresentable {
            class CustomView: UIView {
                override class var layerClass: AnyClass {
                    CustomLayer.self
                }
                override func draw(_ rect: CGRect) {
                    super.draw(rect)
                }
                override func didMoveToSuperview() {
                    super.didMoveToSuperview()
                }
            }
            class CustomLayer: CALayer {
                override init() {
                    super.init()
                }
                
                required init?(coder: NSCoder) {
                    fatalError("init(coder:) has not been implemented")
                }
                override func draw(in ctx: CGContext) {
                    fatalError()
                }
            }
            
            func makeUIView(context: Context) -> some UIView {
                let view = CustomView()
                view.backgroundColor = .green
                return view
            }
            
            func updateUIView(_ uiView: UIViewType, context: Context) {
                
            }
        }
        
        let hostingView = _UIHostingView(rootView: Color.orange)
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
}

@_weakLinked
class MyVTable: _UnsafeHeterogeneousBuffer_VTable {
    
}

struct MyClass_1 {
    var num = (3, 3, 3,3,3,3,3,3)
}

struct MyClass_2 {
    
}
