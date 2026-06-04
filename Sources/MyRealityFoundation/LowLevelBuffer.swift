public import Metal

@_hasMissingDesignatedInitializers @available(macOS 26.0, iOS 26.0, visionOS 26.0, tvOS 26.0, macCatalyst 26.0, *)
final public class LowLevelBuffer {
    public struct Descriptor {
        public var capacity: Int
        
        public var sizeMultiple: Int
        
        public init(capacity: Int, sizeMultiple: Int = 1) {
            assertUnimplemented()
        }
    }
    
    @safe final public nonisolated(unsafe) let descriptor: LowLevelBuffer.Descriptor = {
        assertUnimplemented()
    }()
    
    final public var bytesUsed: Int {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public init(descriptor: LowLevelBuffer.Descriptor) throws {
        assertUnimplemented()
    }
    
    final public func withUnsafeBytes(_ callback: (UnsafeRawBufferPointer) -> Void) {
        assertUnimplemented()
    }
    
    final public func withUnsafeMutableBytes(_ callback: (UnsafeMutableRawBufferPointer) -> Void) {
        assertUnimplemented()
    }
    
    final public func replaceUnsafeMutableBytes(_ callback: (UnsafeMutableRawBufferPointer) -> Void) {
        assertUnimplemented()
    }
    
    final public func read(using commandBuffer: any MTLCommandBuffer) -> any MTLBuffer {
        assertUnimplemented()
    }
    
    final public func replace(using commandBuffer: any MTLCommandBuffer) -> any MTLBuffer {
        assertUnimplemented()
    }
    }
