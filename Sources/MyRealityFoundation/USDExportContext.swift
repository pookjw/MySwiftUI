public import Foundation

@available(macOS 10.15.4, iOS 13.4, macCatalyst 13.4, tvOS 26.0, *)
public struct __USDExportContext {
    public typealias AssetResolverCallback = (_ url: URL) throws -> URL?
    
    @_hasMissingDesignatedInitializers public class InstanceMapper {
        public func addMapping(from: UUID?, to: __USKObjectPathWrapper) {
            assertUnimplemented()
        }
        
        public func getMapping(_ from: UUID) -> __USKObjectPathWrapper? {
            assertUnimplemented()
        }
        }
    
    public var instanceMapper: __USDExportContext.InstanceMapper
    
    @available(*, deprecated, message: "Use init(with:resolver:)")
    public init?(with scene: __USKSceneWrapper) {
        assertUnimplemented()
    }
    
    public init?(with scene: __USKSceneWrapper, resolver: __USDExportContext.AssetResolverCallback?) {
        assertUnimplemented()
    }
}
