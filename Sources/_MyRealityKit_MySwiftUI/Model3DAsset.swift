public import Foundation
public import Observation

@available(visionOS 26.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
public class Model3DAsset {
    public struct EntityAnimation : Identifiable, Hashable {
        public let id: ObjectIdentifier = {
            assertUnimplemented()
        }()
        
        public var path: String {
            get {
                assertUnimplemented()
            }
        }
        
        public static func == (a: Model3DAsset.EntityAnimation, b: Model3DAsset.EntityAnimation) -> Bool {
            assertUnimplemented()
        }
        
        @available(visionOS 26.0, *)
        @available(iOS, unavailable)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        @available(macOS, unavailable)
        @available(macCatalyst, unavailable)
        public typealias ID = ObjectIdentifier
        
        public func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
        
        public var hashValue: Int {
            get {
                assertUnimplemented()
            }
        }
    }
    
    public var animationPlaybackController: AnimationPlaybackController? {
        get {
            assertUnimplemented()
        }
    }
    
    public var availableAnimations: [Model3DAsset.EntityAnimation] {
        get {
            assertUnimplemented()
        }
    }
    
    public var selectedAnimation: Model3DAsset.EntityAnimation? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public init(named name: String, in bundle: Bundle? = nil) async throws {
        assertUnimplemented()
    }
    
    public init(url: URL) async throws {
        assertUnimplemented()
    }
    }

@available(visionOS 26.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension Model3DAsset : nonisolated Observable {
}
