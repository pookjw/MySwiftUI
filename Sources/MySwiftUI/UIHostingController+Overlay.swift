// 6ABC303D5DCFFEFD4C711D02B9F178CC
private import MySwiftUICore

extension UIHostingController {
    final var _persistentSystemOverlays: Visibility {
        if let result = persistentSystemOverlays.environment {
            return result
        }
        
        if let result = secondaryRootSystemOverlaysValue {
            return result
        }
        
        return persistentSystemOverlays.environment ?? .automatic
    }
    
    fileprivate final var secondaryRootSystemOverlaysValue: Visibility? {
        guard
            let window = host.window,
            let windowScene = window.windowScene
        else {
            return nil
        }
        
        for _window in windowScene.windows {
            guard let casted = _window as? ViewHostingWindow else {
                continue
            }
            
            guard casted.rootViewController != self else {
                continue
            }
            
            assertUnimplemented()
        }
        
        return nil
    }
    
    fileprivate final var persistentSystemOverlaysFromPreferences: Visibility? {
        get {
            assertUnimplemented()
        }
    }
}
