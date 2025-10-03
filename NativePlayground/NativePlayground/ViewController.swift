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


func swizzle() {
    let method = class_getInstanceMethod(_UIHostingView<EmptyView>.self, #selector(UIView.layoutSubviews))
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
        swizzle()
        
        print(EnvironmentValues().glassMaterialContainerStyle)
        
        for child in Mirror(reflecting: Color.blue).children {
            print(child)
        }
        
//        var hasher = Hasher()
//        print(Color.black.hash(into: &hasher))
//        print(EnvironmentValues().viewGraphRenderingRootView)
//        print(EnvironmentValues().isVibrantColorStyleEnabled)
//        set(isVibrantColorStyleEnabled: true)
        
//        do {
//            var env = EnvironmentValues()
//            print(env.accessibilitySettingsDefinition)
//            env.accessibilitySettingsDefinition = .uiKit
//            print(env.accessibilitySettingsDefinition)
//        }
        _ = Color.black
        print(PlatformAccessibilitySettingsDefinition.init().currentValue(for: .boldText))
        
        print(PlatformAccessibilitySettingsDefinition.self)
        _forEachField(of: PlatformAccessibilitySettingsDefinition.self, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }
        
//        print(type(of: objc_lookUpClass("_TtCV5UIKit23MaterialBackdropContextP33_B4E1891EFAA97781768AA47DAB5BDF997Storage")!))
        print(EnvironmentValues().backgroundMaterial)
        UserDefaults.standard.set(false, forKey: "com.apple.SwiftUI.ViewGraphBridgePropertiesAreInput")
        
        let filter = BloomFilter(type: Type1.self)
        print(filter.mayContain(BloomFilter(type: Type2.self)))
        
        print(_typeByName("7SwiftUI12PropertyListV7ElementC")!)
        _forEachField(of: _typeByName("7SwiftUI12PropertyListV7ElementC")!, options: [.classType]) { name, offset, type, kind in
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
        
        // expr -l swift -O -- _mangledTypeName(type(of: unsafeBitCast(0x105d57730, to: AnyObject.self)))
        
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
        
        let emptyView = EmptyView()
        let hostingView = _UIHostingView(rootView: EmptyView())
        self.view = hostingView
//        super.loadView()
        
//        Task {
//            try! await Task.sleep(for: .seconds(1))
//            self.view = UIView()
//        }
//        view.addSubview(hostingView)
//        hostingView.frame = view.bounds
//        hostingView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
//        Task {
//            try await Task.sleep(for: .seconds(1))
//            
//            _forEachField(of: type(of: hostingView), options: [.classType]) { name, offset, type, kind in
//                print(String(cString: name))
//                print(String(format: "%lx", offset))
//                return true
//            }
//        }
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
