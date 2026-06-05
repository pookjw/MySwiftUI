@_exported public import MySwiftUICore
@_exported public import _MySwiftUIUtils
public import _UIKitShims

public typealias UITraitBridgedEnvironmentKey = _UIKitShims::UITraitBridgedEnvironmentKey

#if UseMyRealityKit
internal import MyRealityKit

typealias RE_Component = MyRealityKit::Component
typealias RE_Entity = MyRealityKit::Entity
typealias RE___EntityRef = MyRealityKit::__EntityRef
typealias RE_Scene = MyRealityKit::Scene
typealias RE___SceneRef = MyRealityKit::__SceneRef
typealias RE_ComponentEvents = MyRealityFoundation::ComponentEvents
#else
internal import RealityKit

typealias RE_Component = RealityKit::Component
typealias RE_Entity = RealityKit::Entity
typealias RE___EntityRef = RealityKit::__EntityRef
typealias RE_Scene = RealityKit::Scene
typealias RE___SceneRef = RealityKit::__SceneRef
typealias RE_ComponentEvents = RealityFoundation::ComponentEvents
#endif
