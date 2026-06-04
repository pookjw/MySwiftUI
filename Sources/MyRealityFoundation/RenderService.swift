public import Metal

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public protocol __RenderService {
    var device: any MTLDevice { get }
    var commandQueue: (any MTLCommandQueue)? { get }
    var __coreRenderManager: OpaquePointer { get }
}
