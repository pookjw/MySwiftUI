@_exported public import MySwiftUICore
@_exported public import _MySwiftUIUtils
public import _UIKitShims

public typealias UITraitBridgedEnvironmentKey = _UIKitShims::UITraitBridgedEnvironmentKey

#if UseMyRealityKit
public import MyRealityKit

@_spi(Reality) public typealias RE_Component = MyRealityKit::Component
@_spi(Reality) public typealias RE_Entity = MyRealityKit::Entity
@_spi(Reality) public typealias RE___EntityRef = MyRealityKit::__EntityRef
@_spi(Reality) public typealias RE_Scene = MyRealityKit::Scene
@_spi(Reality) public typealias RE___SceneRef = MyRealityKit::__SceneRef
@_spi(Reality) public typealias RE_ComponentEvents = MyRealityFoundation::ComponentEvents
#else
public import RealityKit

@_spi(Reality) public typealias RE_Component = RealityKit::Component
@_spi(Reality) public typealias RE_Entity = RealityKit::Entity
@_spi(Reality) public typealias RE___EntityRef = RealityKit::__EntityRef
@_spi(Reality) public typealias RE_Scene = RealityKit::Scene
@_spi(Reality) public typealias RE___SceneRef = RealityKit::__SceneRef
@_spi(Reality) public typealias RE_ComponentEvents = RealityFoundation::ComponentEvents
#endif

#if UseMyRealityKitOnExportedSymbols
public import MyRealityKit

@_spi(Reality) public typealias RE_Entity_Exported = MyRealityKit::Entity
#else
public import RealityKit

@_spi(Reality) public typealias RE_Entity_Exported = RealityKit::Entity
#endif
