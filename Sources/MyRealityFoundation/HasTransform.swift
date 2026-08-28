public import Foundation
public import simd
private import CoreRE

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@preconcurrency @MainActor public protocol HasTransform : Entity {
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension HasTransform {
    @MainActor @preconcurrency public var transform: Transform {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public var scale: SIMD3<Float> {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
        _modify {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public func scale(relativeTo referenceEntity: Entity?) -> SIMD3<Float> {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func setScale(_ scale: SIMD3<Float>, relativeTo referenceEntity: Entity?) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public var position: SIMD3<Float> {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
        _modify {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public func position(relativeTo referenceEntity: Entity?) -> SIMD3<Float> {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func setPosition(_ position: SIMD3<Float>, relativeTo referenceEntity: Entity?) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public var orientation: simd_quatf {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
        _modify {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public func orientation(relativeTo referenceEntity: Entity?) -> simd_quatf {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func setOrientation(_ orientation: simd_quatf, relativeTo referenceEntity: Entity?) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func transformMatrix(relativeTo referenceEntity: Entity?) -> float4x4 {
        return MyRealityFoundation::Entity.conversionMatrix(from: self, to: referenceEntity)
    }
    
    @MainActor @preconcurrency public func setTransformMatrix(_ transform: float4x4, relativeTo referenceEntity: Entity?) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func convert(position: SIMD3<Float>, from referenceEntity: Entity?) -> SIMD3<Float> {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func convert(direction: SIMD3<Float>, from referenceEntity: Entity?) -> SIMD3<Float> {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func convert(normal: SIMD3<Float>, from referenceEntity: Entity?) -> SIMD3<Float> {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func convert(transform: Transform, from referenceEntity: Entity?) -> Transform {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func convert(position: SIMD3<Float>, to referenceEntity: Entity?) -> SIMD3<Float> {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func convert(direction: SIMD3<Float>, to referenceEntity: Entity?) -> SIMD3<Float> {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func convert(normal: SIMD3<Float>, to referenceEntity: Entity?) -> SIMD3<Float> {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func convert(transform: Transform, to referenceEntity: Entity?) -> Transform {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func look(at target: SIMD3<Float>, from position: SIMD3<Float>, upVector: SIMD3<Float> = SIMD3<Float>(0, 1, 0), relativeTo referenceEntity: Entity?) {
        assertUnimplemented()
    }
    
    @available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
    @MainActor @preconcurrency public func look(at target: SIMD3<Float>, from position: SIMD3<Float>, upVector: SIMD3<Float> = SIMD3<Float>(0, 1, 0), relativeTo referenceEntity: Entity?, forward: Entity.ForwardDirection = .negativeZ) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func move(to transform: Transform, relativeTo referenceEntity: Entity?) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func move(to transform: float4x4, relativeTo referenceEntity: Entity?) {
        assertUnimplemented()
    }
    
    @discardableResult
    @MainActor @preconcurrency public func move(to target: Transform, relativeTo referenceEntity: Entity?, duration: TimeInterval, timingFunction: AnimationTimingFunction = .default) -> AnimationPlaybackController {
        assertUnimplemented()
    }
    
    @discardableResult
    @MainActor @preconcurrency public func move(to target: float4x4, relativeTo referenceEntity: Entity?, duration: TimeInterval, timingFunction: AnimationTimingFunction = .default) -> AnimationPlaybackController {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func visualBounds(recursive: Bool = true, relativeTo referenceEntity: Entity?, excludeInactive: Bool = false) -> BoundingBox {
        assertUnimplemented()
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension HasTransform {
    @discardableResult
    @MainActor @preconcurrency public func align(_ originPin: GeometricPin, to targetPin: GeometricPin) -> float4x4? {
        assertUnimplemented()
    }
}

extension HasTransform {
    static func conversionMatrix<T : MyRealityFoundation::Entity, U : MyRealityFoundation::Entity>(from: T?, to: U?) -> simd_float4x4 {
        /*
         from -> x0 -> x21
         to -> x1 -> x19
         */
        // sp + 0x80
        var matrix_1: simd_float4x4
        // sp + 0x40
        var matrix_2: simd_float4x4
        
        if let from {
            if from === to {
                return .identity
            } else {
                // <+124>
                let fromTransformService = unsafe unsafeBitCast(from.coreEntity, to: CoreRE::Entity.self).transformService
                let fromREEntity = unsafe unsafeBitCast(from.coreEntity, to: CoreRE::Entity.self)
                
                if let fromTransformService {
                    matrix_1 = fromTransformService.worldMatrix4x4F(
                        entity: fromREEntity
                    )
                } else {
                    // <+168>
                    if let component = fromREEntity.getComponent(ofType: .transform) {
                        matrix_1 = component.transform_worldMatrix4x4F
                    } else {
                        // <+752>
                        if let fromParent = from.parent {
                            // <+776>
                            matrix_1 = MyRealityFoundation::Entity.conversionMatrix(from: fromParent, to: nil)
                        } else {
                            // <+872>
                            matrix_1 = .identity
                        }
                    }
                }
            }
        } else if to != nil {
            matrix_1 = .identity
        } else {
            return .identity
        }
        
        if let to {
            // <+212>
            let toTransformService = unsafe unsafeBitCast(to.coreEntity, to: CoreRE::Entity.self).transformService
            let toREEntity = unsafe unsafeBitCast(to.coreEntity, to: CoreRE::Entity.self)
            
            if let toTransformService {
                // <+272>
                matrix_2 = toTransformService.worldMatrix4x4F(
                    entity: toREEntity
                )
                
                // <+292>
            } else {
                // <+252>
                if let toComponent = toREEntity.getComponent(ofType: .transform) {
                    matrix_2 = toComponent.transform_worldMatrix4x4F
                } else {
                    // <+692>
                    if let toParent = to.parent {
                        // <+716>
                        matrix_2 = MyRealityFoundation::Entity.conversionMatrix(from: toParent, to: nil)
                        // <+292>
                    } else {
                        // <+812>
                        matrix_2 = .identity
                    }
                }
            }
            
            if let from {
                // <+296>
                // x22
                let fromScene = from.scene
                let toScene = to.scene
                let flag: Bool // true -> <+460> / false -> <+948>
                
                if let fromScene {
                    if let toScene {
                        // <+372>
                        // x22
                        let fromREScene = unsafe unsafeBitCast(fromScene.coreScene, to: CoreRE::Scene.self)
                        // x24
                        let toREScene = unsafe unsafeBitCast(toScene.coreScene, to: CoreRE::Scene.self)
                        
                        if fromREScene != toREScene {
                            // <+460>
                            flag = true
                        } else {
                            // <+444>
                            // <+652>
                            // <+948>
                            flag = false
                        }
                    } else {
                        // <+452>
                        // <+460>
                        flag = true
                    }
                } else {
                    // <+440>
                    if toScene != nil {
                        // <+456>
                        // <+460>
                        flag = true
                    } else {
                        // <+444>
                        // <+652>
                        // <+948>
                        flag = false
                    }
                }
                
                if flag {
                    // <+460>
                    if let fromScene = from.scene {
                        let fromREScene = unsafe unsafeBitCast(fromScene.coreScene, to: CoreRE::Scene.self)
                        let fromComponents = unsafe fromREScene.componentsOfClass(.sceneSpaceRoot)
                        
                        if unsafe fromComponents.count == 0 {
                            // <+652>
                            // <+948>
                        } else {
                            // <+508>
                            // x22
                            let fromComponent = unsafe fromComponents.components.pointee
                            
                            if let toScene = to.scene {
                                // <+544>
                                let toREScene = unsafe unsafeBitCast(toScene.coreScene, to: CoreRE::Scene.self)
                                let toComponents = unsafe toREScene.componentsOfClass(.sceneSpaceRoot)
                                
                                if unsafe toComponents.count == 0 {
                                    // <+860>
                                    // <+948>
                                } else {
                                    // <+568>
                                    // x20
                                    let toComponent = unsafe toComponents.components.pointee
                                    
                                    if fromComponent == toComponent {
                                        // <+1148>
                                        // <+948>
                                    } else {
                                        // <+588>
                                        // w23
                                        let fromIsSelfInImmersiveSpace = fromComponent.sceneSpaceRoot_isSelfInImmersiveSpace
                                        let fromIsImmersiveSpaceOpen = fromComponent.sceneSpaceRoot_isImmersiveSpaceOpen
                                        
                                        if fromIsImmersiveSpaceOpen {
                                            // sp
                                            let matrix_3: simd_float4x4
                                            
                                            if !fromIsSelfInImmersiveSpace {
                                                // <+1084>
                                                matrix_3 = fromComponent.sceneSpaceRoot_sceneToImmersiveTransform
                                            } else {
                                                matrix_3 = .identity
                                            }
                                            
                                            // <+1100>
                                            let toIsSelfInImmersiveSpace = toComponent.sceneSpaceRoot_isSelfInImmersiveSpace
                                            let toIsImmersiveSpaceOpen = toComponent.sceneSpaceRoot_isImmersiveSpaceOpen
                                            
                                            if toIsImmersiveSpaceOpen {
                                                let matrix_4: simd_float4x4
                                                if toIsSelfInImmersiveSpace {
                                                    // <+1128>
                                                    matrix_4 = .identity
                                                } else {
                                                    // <+1156>
                                                    matrix_4 = toComponent.sceneSpaceRoot_sceneToImmersiveTransform
                                                }
                                                
                                                // <+1164>
                                                assertUnimplemented()
                                            } else {
                                                // <+1148>
                                                // <+948>
                                            }
                                        } else {
                                            // <+1148>
                                            // <+948>
                                        }
                                    }
                                }
                            } else {
                                // <+1148>
                                // <+948>
                            }
                        }
                    } else {
                        // <+660>
                        // <+948>
                    }
                }
            } else {
                // <+948>
            }
        } else {
            // <+916>
            matrix_2 = .identity
            // <+948>
        }
        
        // <+948>
        assertUnimplemented()
    }
}
