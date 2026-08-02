// E37E9A4A00F7A4D3DDD061C85B1FFBD5
public import Foundation
private import _DarwinFoundation3._stdlib

@_hasMissingDesignatedInitializers @available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public class __RealityFileURLResolver {
    private(set) var assetService: any __REAssetService // 0x10
    private var resolvedURLByAssetPathPrefixQueue = DispatchQueue(label: "__RealityFileURLResolver.resolvedURLByAssetPathPrefix") // 0x38
    private var resolvedURLByAssetPathPrefix: [String : String] = [:] // 0x40
    private var extraUrlsToDeleteDuringUnregistration: [URL] = [] // 0x48
    
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
    
    static let instances = AssetServiceScopedRegistry<__RealityFileURLResolver>()
    fileprivate nonisolated(unsafe) static var weakInstances: [OpaquePointer : __RealityFileURLResolver.Weak<__RealityFileURLResolver>] = unsafe [:]
    
    @available(*, deprecated, message: "use the \"init(_ assetService: __REAssetService)\" instead")
    public init() {
        assertUnimplemented()
    }
    
    init(_ assetService: any __REAssetService) {
        /*
         self -> x20 -> x19
         assetService -> x0 -> x21
         */
        // <+436>
        self.assetService = assetService
        
        let handle = unsafe assetService.__handle
        unsafe __RealityFileURLResolver.weakInstances[handle] = __RealityFileURLResolver.Weak(pointee: self)
        
        atexit {
            // $s10RealityKit02__A15FileURLResolverCyAcA16__REAssetService_pcfcyycfU_To
            for unsafe weakInstance in unsafe __RealityFileURLResolver.weakInstances {
                guard let instance = unsafe weakInstance.value.pointee else {
                    continue
                }
                
                instance.unregisterRealityFileResolver()
            }
        }
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

extension __RealityFileURLResolver {
    fileprivate struct Weak<T : AnyObject> {
        private(set) weak var pointee: T?
    }
}
