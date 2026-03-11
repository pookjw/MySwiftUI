public import MySwiftUICore

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, visionOS 1.0, *)
@_functionBuilder public struct SceneBuilder {
    @_alwaysEmitIntoClient public static func buildExpression<Content>(_ content: Content) -> Content where Content : Scene {
        content
    }
    
    @available(*, unavailable, message: "Provide at leas one scene")
    public static func buildBlock() -> some Scene {
        fatalError("TODO")
    }
    
    public static func buildBlock<Content>(_ content: Content) -> Content where Content : Scene {
        fatalError("TODO")
    }
    
    @MainActor // 원래 없음
    @_disfavoredOverload @_alwaysEmitIntoClient public static func buildBlock<each Content>(_ content: repeat each Content) -> some Scene where repeat each Content : Scene {
        _TupleScene((repeat each content))
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, visionOS 1.0, *)
extension SceneBuilder {
    @_alwaysEmitIntoClient public static func buildOptional(_ scene: (any Scene & _LimitedAvailabilitySceneMarker)?) -> some Scene {
        if #unavailable(iOS 16.1, macOS 13.0, watchOS 9.1, tvOS 16.1) {
            return _EmptyScene()
        } else {
            return if let scene {
                scene as! LimitedAvailabilityScene
            } else {
                LimitedAvailabilityScene(_EmptyScene())
            }
        }
    }
    
    @available(*, unavailable, message: "if statements in a SceneBuilder can only be used with #available clauses")
    public static func buildOptional<S>(_ scene: S?) where S : Scene {
        fatalError("TODO")
    }
    
    @available(iOS 16.1, macOS 13.0, watchOS 9.1, tvOS 16.1, visionOS 1.0, *)
    @MainActor // 원래 없음
    @_alwaysEmitIntoClient public static func buildLimitedAvailability(_ scene: some Scene) -> any Scene & _LimitedAvailabilitySceneMarker {
        return LimitedAvailabilityScene(scene)
    }
    
    @available(iOS, deprecated: 14.0, obsoleted: 16.1, message: "this code may crash on earlier versions of the OS; specify '#available(iOS 16.1, *)' or newer instead")
    @available(macOS, deprecated: 11.0, obsoleted: 13.0, message: "this code may crash on earlier versions of the OS; specify '#available(macOS 13.0, *)' or newer instead")
    @available(watchOS, deprecated: 7.0, obsoleted: 9.1, message: "this code may crash on earlier versions of the OS; specify '#available(watchOS 9.1, *)' or newer instead")
    @available(tvOS, deprecated: 14.0, obsoleted: 16.1, message: "this code may crash on earlier versions of the OS; specify '#available(tvOS 16.1, *)' or newer instead")
    @available(visionOS, unavailable)
    @_disfavoredOverload @_alwaysEmitIntoClient public static func buildLimitedAvailability(_ scene: any Scene) -> any Scene & _LimitedAvailabilitySceneMarker {
        fatalError("Unavailable")
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, visionOS 1.0, *)
@_marker public protocol _LimitedAvailabilitySceneMarker {
}
