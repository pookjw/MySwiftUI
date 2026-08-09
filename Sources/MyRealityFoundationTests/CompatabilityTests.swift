#if RealityKitCompataibility
@testable @_spi(Testing) private import MyRealityFoundation
private import RealityKit
private import CoreRE
internal import Testing

struct CompatabilityTests {
    @Test @MainActor func test() {
        do {
            let entity = RealityKit::Entity()
            
            #expect(entity.reEntity.rawRealityKitEntity === entity)
            #expect(entity.reEntity.rawMyRealityKitEntity == nil)
            
            #expect(entity.reEntity.realityKitRef === entity)
            #expect(entity.reEntity.myRealityKitRef == nil)
            #expect(entity.reEntity.realityKitRef === entity)
            
            #expect(entity.reEntity.rawRealityKitEntity === entity)
            #expect(entity.reEntity.rawMyRealityKitEntity == nil)
            
            let myEntity = unsafe MyRealityFoundation::Entity(
                _coreEntity: MyRealityFoundation::__EntityRef(
                    core: entity.coreEntity
                )
            )
            
            #expect(entity.reEntity.rawRealityKitEntity === entity)
            #expect(entity.reEntity.rawMyRealityKitEntity == nil)
            
            #expect(entity.reEntity.realityKitRef === entity)
            #expect(entity.reEntity.myRealityKitRef === myEntity)
            #expect(entity.reEntity.realityKitRef === entity)
            
            #expect(entity.reEntity.rawRealityKitEntity === entity)
            #expect(entity.reEntity.rawMyRealityKitEntity == nil)
            
            entity.reEntity.myRealityKitRef = nil
            
            #expect(entity.reEntity.rawRealityKitEntity === entity)
            #expect(entity.reEntity.rawMyRealityKitEntity == nil)
            
            #expect(entity.reEntity.realityKitRef === entity)
            #expect(entity.reEntity.myRealityKitRef == nil)
            #expect(entity.reEntity.realityKitRef === entity)
            
            #expect(entity.reEntity.rawRealityKitEntity === entity)
            #expect(entity.reEntity.rawMyRealityKitEntity == nil)
        }
        
        do {
            let myEntity = MyRealityFoundation::Entity()
            
            #expect(myEntity.reEntity.rawRealityKitEntity == nil)
            #expect(myEntity.reEntity.rawMyRealityKitEntity === myEntity)
            #expect(myEntity.reEntity._realityKitRef == nil)
            #expect(myEntity.reEntity.myRealityKitRef === myEntity)
            
            let entity = myEntity.reEntity.realityKitRef
            
            #expect(myEntity.reEntity.rawRealityKitEntity === entity)
            #expect(myEntity.reEntity.rawMyRealityKitEntity == nil)
            #expect(myEntity.reEntity._realityKitRef === entity)
            #expect(myEntity.reEntity.myRealityKitRef === myEntity)
        }
    }
}

extension RealityKit::Entity {
    fileprivate var reEntity: CoreRE::Entity {
        return unsafe unsafeBitCast(self.coreEntity, to: CoreRE::Entity.self)
    }
}

extension MyRealityFoundation::Entity {
    fileprivate var reEntity: CoreRE::Entity {
        return unsafe unsafeBitCast(self.coreEntity, to: CoreRE::Entity.self)
    }
}

extension CoreRE::Entity {
    fileprivate var rawRealityKitEntity: RealityKit::Entity? {
        guard let swiftObject = unsafe self.swiftObject else {
            return nil
        }
        
        return unsafe unsafeBitCast(swiftObject, to: AnyObject.self) as? RealityKit::Entity
    }
    
    fileprivate var rawMyRealityKitEntity: MyRealityFoundation::Entity? {
        guard let swiftObject = unsafe self.swiftObject else {
            return nil
        }
        
        return unsafe unsafeBitCast(swiftObject, to: AnyObject.self) as? MyRealityFoundation::Entity
    }
}

#endif
