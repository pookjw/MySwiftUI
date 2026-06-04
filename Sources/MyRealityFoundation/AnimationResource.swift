public import Foundation

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@preconcurrency @MainActor public class AnimationResource : Resource {
    @MainActor @preconcurrency public var __coreAsset: __AssetRef {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency final public let name: String? = {
        assertUnimplemented()
    }()
    }

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension AnimationResource {
    @MainActor @preconcurrency public func `repeat`(duration: TimeInterval = .infinity) -> AnimationResource {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func `repeat`(count: Int) -> AnimationResource {
        assertUnimplemented()
    }
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension AnimationResource {
    @MainActor @preconcurrency public static func group(with resources: [AnimationResource]) throws -> AnimationResource {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func sequence(with resources: [AnimationResource]) throws -> AnimationResource {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func generate(with definition: any AnimationDefinition) throws -> AnimationResource {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func store(in: Entity) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public var definition: any AnimationDefinition {
        get {
            assertUnimplemented()
        }
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension AnimationResource {
    @MainActor @preconcurrency public static func makeActionAnimation<T>(for action: T, duration: TimeInterval = 1.0, name: String = "", bindTarget: BindTarget? = nil, blendLayer: Int32 = 0, repeatMode: AnimationRepeatMode = .none, fillMode: AnimationFillMode = [], trimStart: TimeInterval? = nil, trimEnd: TimeInterval? = nil, trimDuration: TimeInterval? = nil, offset: TimeInterval = 0, delay: TimeInterval = 0, speed: Float = 1.0) throws -> AnimationResource where T : EntityAction {
        assertUnimplemented()
    }
}
