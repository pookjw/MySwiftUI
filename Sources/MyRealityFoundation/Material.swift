@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public protocol Material {
    var __resource: __MaterialResource { get }
    var __parameterBlock: __RKMaterialParameterBlock { get set }
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension Material {
    public typealias Parameters = MaterialParameters
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension Material {
    public var name: String? {
        get {
            assertUnimplemented()
        }
    }
}
