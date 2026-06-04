public import Foundation

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension ShaderGraphMaterial {
    public enum LoadError : LocalizedError {
        case invalidTypeFound
        case materialNameNotFound
        case invalidURL
        case resourceShareFailed
        
        public static func == (a: ShaderGraphMaterial.LoadError, b: ShaderGraphMaterial.LoadError) -> Bool {
            assertUnimplemented()
        }
        
        public func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
        
        public var hashValue: Int {
            get {
                assertUnimplemented()
            }
        }
    }
    
    public init(named name: String, from data: Data) async throws {
        assertUnimplemented()
    }
    
    public init(named name: String, from file: String, in bundle: Bundle? = nil) async throws {
        assertUnimplemented()
    }
    
    public init(named name: String, from url: URL) async throws {
        assertUnimplemented()
    }
    
    public init(materialXLabel: String, data: Data) async throws {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
public struct ShaderGraphMaterial : Material, @unchecked Sendable {
    public enum Error : LocalizedError {
        case incorrectTypeForParameterName
        case parameterNameNotFound
        
        public static func == (a: ShaderGraphMaterial.Error, b: ShaderGraphMaterial.Error) -> Bool {
            assertUnimplemented()
        }
        
        public func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
        
        public var hashValue: Int {
            get {
                assertUnimplemented()
            }
        }
    }
    
    public var __resource: __MaterialResource
    
    public var __parameterBlock: __RKMaterialParameterBlock
    
    public static func parameterHandle(name: String) -> MaterialParameters.Handle {
        assertUnimplemented()
    }
    
    public mutating func setParameter(handle: MaterialParameters.Handle, value newValue: MaterialParameters.Value) throws {
        assertUnimplemented()
    }
    
    public func getParameter(handle: MaterialParameters.Handle) -> MaterialParameters.Value? {
        assertUnimplemented()
    }
    
    public mutating func setParameter(name: String, value newValue: MaterialParameters.Value) throws {
        assertUnimplemented()
    }
    
    public func getParameter(name: String) -> MaterialParameters.Value? {
        assertUnimplemented()
    }
    
    public var parameterNames: [String] {
        get {
            assertUnimplemented()
        }
    }
    
    public typealias TriangleFillMode = MaterialParameterTypes.TriangleFillMode
    
    public var triangleFillMode: ShaderGraphMaterial.TriangleFillMode {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension ShaderGraphMaterial {
    public typealias FaceCulling = MaterialParameterTypes.FaceCulling
    
    public var faceCulling: ShaderGraphMaterial.FaceCulling {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var writesDepth: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var readsDepth: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension ShaderGraphMaterial.LoadError : Equatable {}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension ShaderGraphMaterial.LoadError : Hashable {}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension ShaderGraphMaterial.Error : Equatable {}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension ShaderGraphMaterial.Error : Hashable {}
