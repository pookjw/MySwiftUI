public import Foundation

@_hasMissingDesignatedInitializers @available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public class __RealityFileURLResolver {
    @available(*, deprecated, message: "Don't use this variable")
    public static var weakShared: __RealityFileURLResolver? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(*, deprecated, message: "use the \"instance(for assetService: __REAssetService)\" instead")
    public static var shared: __RealityFileURLResolver {
        get {
            assertUnimplemented()
        }
    }
    
    public static func instance(for assetService: any __REAssetService) -> __RealityFileURLResolver {
        assertUnimplemented()
    }
    
    @available(*, deprecated, message: "use the \"init(_ assetService: __REAssetService)\" instead")
    public init() {
        assertUnimplemented()
    }
    
    public static let assetPathPrefix: String = {
        assertUnimplemented()
    }()
    
    public static let schemePrefix: String = {
        assertUnimplemented()
    }()
    
    public func registerRealityFileResolver(assetService: any __REAssetService) {
        assertUnimplemented()
    }
    
    public func registerRealityFileResolver() {
        assertUnimplemented()
    }
    
    public func unregisterRealityFileResolver() {
        assertUnimplemented()
    }
    
    public func resolvedURL(for subpath: String) -> URL? {
        assertUnimplemented()
    }
    
    public func resolvedURL(group: String, name: String) -> URL? {
        assertUnimplemented()
    }
    
    public func setResolvedURLPath(_ resolvedURLPath: String, for key: String) {
        assertUnimplemented()
    }
    
    public func createSchemePrefix(with realityFileName: String) -> String {
        assertUnimplemented()
    }
    
    public func createSubAssetPath(with assetName: String) -> String {
        assertUnimplemented()
    }
    
    @available(*, deprecated, message: "use the static version instead")
    public func createFullSchemePath(group: String, name: String) -> String {
        assertUnimplemented()
    }
    
    public static func createFullSchemePath(group: String, name: String) -> String {
        assertUnimplemented()
    }
}
