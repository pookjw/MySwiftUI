public import Metal
public import simd

@_hasMissingDesignatedInitializers @available(macOS 26.0, iOS 26.0, visionOS 26.0, tvOS 26.0, macCatalyst 26.0, *)
final public class LowLevelInstanceData {
    final public var instanceCapacity: Int {
        get {
            assertUnimplemented()
        }
    }
    
    final public var instanceCount: Int {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    convenience public init(instanceCount: Int) throws {
        assertUnimplemented()
    }
    
    public init(instanceCount: Int, instanceCapacity: Int) throws {
        assertUnimplemented()
    }
    
    final public func read(using commandBuffer: any MTLCommandBuffer) -> any MTLBuffer {
        assertUnimplemented()
    }
    
    final public func replace(using commandBuffer: any MTLCommandBuffer) -> any MTLBuffer {
        assertUnimplemented()
    }
    
    final public func withTransforms(_ callback: (UnsafeBufferPointer<float4x4>) -> Void) {
        assertUnimplemented()
    }
    
    final public func withMutableTransforms(_ callback: (UnsafeMutableBufferPointer<float4x4>) -> Void) {
        assertUnimplemented()
    }
    
    final public func replaceMutableTransforms(_ callback: (UnsafeMutableBufferPointer<float4x4>) -> Void) {
        assertUnimplemented()
    }
    }
