// ACC2C5639A7D76F611E170E831FCA491
public import MySwiftUICore
private import AttributeGraph

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
    fatalError("TODO")
}
