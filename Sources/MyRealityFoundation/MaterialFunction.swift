public import Metal

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public protocol MaterialFunction {
    var name: String { get set }
    var library: any MTLLibrary { get set }
    @available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, *)
    var constantValues: MTLFunctionConstantValues { get set }
    var __linkSPI: Bool { get }
}
