// ACC2C5639A7D76F611E170E831FCA491
public import MySwiftUICore
private import AttributeGraph
private import UIKit
private import _DarwinFoundation3._stdlib
private import _UIKitPrivate

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
@preconcurrency @MainActor public protocol App {
    associatedtype Body : Scene
    @SceneBuilder @MainActor @preconcurrency var body: Self.Body { get }
    @MainActor @preconcurrency init()
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension App {
    @MainActor @preconcurrency public static func main() {
        precondition(
            (isLinkedOnOrAfter(.v6) ? TypeID(self).isValueType : true),
            "apps must be value types; \(self)"
        )
        
        runApp(Self())
    }
}

func runApp<T: App>(_ app: T) -> Never {
    Update.dispatchImmediately(reason: nil) { 
        // $s7SwiftUI6runAppys5NeverOxAA0D0RzlFyyXEfU_TA
        AppGraph.shared = AppGraph(app: app)
    }
    
    KitRendererCommon(AppDelegate.self)
}

fileprivate func KitRendererCommon(_ type: AnyObject.Type) -> Never {
    let block: (UnsafeMutablePointer<UnsafeMutablePointer<Int8>?>) -> Never = { argv in
        // $s7SwiftUI17KitRendererCommon33_ACC2C5639A7D76F611E170E831FCA491LLys5NeverOyXlXpFAESpySpys4Int8VGSgGXEfU_
        /*
         argv -> x0 -> x19
         type -> x1 -> x23
         */
        // x20
        let result = UIApplicationMain(CommandLine.argc, argv, NSStringFromClass(SwiftUIApplication.self), NSStringFromClass(type))
        exit(result)
    }
    
    block(CommandLine.unsafeArgv)
}

// _TtC7SwiftUIP33_ACC2C5639A7D76F611E170E831FCA49118SwiftUIApplication
fileprivate final class SwiftUIApplication: UIApplication {
    override func _extendLaunchTest() -> Any? {
        fatalError("TODO")
    }
    
    override init() {
        super.init()
    }
    
    // TODO
}

func currentAppName() -> String {
    fatalError("TODO")
}
