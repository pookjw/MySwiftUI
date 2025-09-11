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

struct Foo_1: _SwiftUIPrivate.PreferenceKey {
    public static var defaultValue: Bool { return false }
}
struct Foo_2: _SwiftUIPrivate.PreferenceKey {
    public static var defaultValue: Bool { return false }
}

class ViewController: UIViewController {
    override func loadView() {
        UserDefaults.standard.setValue(false, forKey: "com.apple.SwiftUI.GestureContainers")
//        UserDefaults.standard.set(true, forKey: "com.apple.SwiftUI.EnableSceneLogging")
        UserDefaults.standard.removeObject(forKey: "com.apple.SwiftUI.EnableSceneLogging")
//        _ = _SwiftUIPrivate.Log.runtimeIssuesLog
        _ = _SwiftUIPrivate.Log.eventDebuggingLog
        _ = _SwiftUIPrivate.Log.archiving
        _ = _SwiftUIPrivate.Log.archivedToggle
        _ = _SwiftUIPrivate.Log.archivedPlaybackButton
        _ = _SwiftUIPrivate.Log.events
        _ = _SwiftUIPrivate.Log.metadataExtraction
        _ = _SwiftUIPrivate.Log.unitTests
        _ = _SwiftUIPrivate.Log.timelineScheduleSequences
        _ = _SwiftUIPrivate.Log.archivedButton
        _ = _SwiftUIPrivate.Log.scenes!
        _ = _SwiftUIPrivate.Log.immersiveSpace
        

        UserDefaults.standard.set(true, forKey: "com.apple.SwiftUI.EnableFocusLogging")
        _ = getFocus()!

        UserDefaults.standard.set(true, forKey: "com.apple.SwiftUI.EnableNavigationLogging")
        _ = getNavigation()!

        UserDefaults.standard.set(true, forKey: "com.apple.SwiftUI.EnableListSelectionLogging")
        _ = getListSelection()!

        UserDefaults.standard.set(true, forKey: "com.apple.SwiftUI.EnableListDiffingLogging")
        _ = getListDiffing()!

        UserDefaults.standard.set(true, forKey: "com.apple.SwiftUI.EnableListPerfLogging")
        _ = getListPerf()!

        UserDefaults.standard.set(true, forKey: "com.apple.SwiftUI.EnableListMiscLogging")
        _ = getListMisc()!

        UserDefaults.standard.set(true, forKey: "com.apple.SwiftUI.EnableTableLogging")
        _ = getTable()!

        UserDefaults.standard.set(true, forKey: "com.apple.SwiftUI.EnablePresentationLogging")
        _ = getPresentation()!

        UserDefaults.standard.set(true, forKey: "com.apple.SwiftUI.EnableTabViewLogging")
        _ = getTabView()!

        UserDefaults.standard.set(true, forKey: "com.apple.SwiftUI.EnableURLHandlingLogging")
        _ = getURLHandling()!

        UserDefaults.standard.set(true, forKey: "com.apple.SwiftUI.EnableSplitViewVisibilityLogging")
        _ = getSplitViewVisibility()!

        UserDefaults.standard.set(true, forKey: "com.apple.SwiftUI.EnableDragAndDropLogging")
        _ = getDragAndDrop()!

        UserDefaults.standard.set(true, forKey: "com.apple.SwiftUI.EnableDocumentsLogging")
        _ = getDocuments()!

        UserDefaults.standard.set(true, forKey: "com.apple.SwiftUI.EnableResizeLogging")
        _ = getResize()!

        UserDefaults.standard.set(true, forKey: "com.apple.SwiftUI.EnableAttachmentLogging")
        _ = getAttachments()!

        UserDefaults.standard.set(true, forKey: "com.apple.SwiftUI.EnableToolbarLogging")
        _ = getToolbar()!

        UserDefaults.standard.set(true, forKey: "com.apple.SwiftUI.LazyStackLogging")
        _ = getLazyStack()!

        UserDefaults.standard.set(true, forKey: "com.apple.SwiftUI.LazyLayoutReuseLogging")
        _ = getLazyLayoutReuse()!

        UserDefaults.standard.set(true, forKey: "com.apple.SwiftUI.LazyLayoutPrefetchLogging")
        _ = getLazyLayoutPrefetch()!

        UserDefaults.standard.set(true, forKey: "com.apple.SwiftUI.GraphReuseLogging")
        _ = getGraphReuse()!

        UserDefaults.standard.set(true, forKey: "com.apple.SwiftUI.ScrollLogging")
        _ = getScroll()!

        UserDefaults.standard.set(true, forKey: "com.apple.SwiftUI.PrintingLogging")
        _ = getPrinting()!

        UserDefaults.standard.set(true, forKey: "com.apple.SwiftUI.RemoteScenesLogging")
        _ = getRemoteScenes()!

        UserDefaults.standard.set(true, forKey: "com.apple.SwiftUI.TextEditorLogging")
        _ = getTextEditor()!

        UserDefaults.standard.set(true, forKey: "com.apple.SwiftUI.TextFieldLogging")
        _ = getTextField()!

        UserDefaults.standard.set(true, forKey: "com.apple.SwiftUI.OpenSceneLogging")
        _ = getOpenScene()!


        
        var keys_1 = PreferenceKeys()
        keys_1.add(Foo_1.self)
        
        var keys_2 = PreferenceKeys()
        keys_2.add(Foo_2.self)
        
        _forEachField(of: type(of: _UIHostingView<EmptyView>.self).self, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }
        
        print("===")
        
        print(_UIHostingView<EmptyView>.self)
        _forEachField(of: _UIHostingView<EmptyView>.self, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }
        
        print("===")
        
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
        
        print(GraphHost.self)
        _forEachField(of: GraphHost.self, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }
        
        print("===")
        
        print(RepresentableContextValues.self)
        _forEachField(of: RepresentableContextValues.self, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }
//        
//        print("===")
//        
//        print(UnsafeHeterogeneousBuffer.self)
//        _forEachField(of: UnsafeHeterogeneousBuffer.self, options: []) { name, offset, type, kind in
//            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
//            return true
//        }
        
        do {
//            let emptyView = EmptyView()
//            let hostingView = _UIHostingView<EmptyView>(coder: NSCoder())
        }
        
        let emptyView = EmptyView()
        let hostingView = _UIHostingView(rootView: emptyView)
        self.view = hostingView
        
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
}

@_weakLinked
class MyVTable: _UnsafeHeterogeneousBuffer_VTable {
    
}

struct MyClass_1 {
    var num = (3, 3, 3,3,3,3,3,3)
}

struct MyClass_2 {
    
}
