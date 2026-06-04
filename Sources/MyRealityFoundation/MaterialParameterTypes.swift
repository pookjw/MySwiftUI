@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public struct MaterialParameterTypes {
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public enum FaceCulling {
        case none
        case front
        case back
        
        public static func == (a: MaterialParameterTypes.FaceCulling, b: MaterialParameterTypes.FaceCulling) -> Bool {
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
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public struct TextureCoordinateTransform {
        public var offset: SIMD2<Float>
        
        public var scale: SIMD2<Float>
        
        public var rotation: Float
        
        public init(offset: SIMD2<Float> = .init(), scale: SIMD2<Float> = .init(1, 1), rotation: Float = 0.0) {
            assertUnimplemented()
        }
    }
    
    @available(visionOS 1.0, macCatalyst 18.0, macOS 15.0, iOS 18.0, *)
    public enum TriangleFillMode {
        case fill
        case lines
        
        public static func == (a: MaterialParameterTypes.TriangleFillMode, b: MaterialParameterTypes.TriangleFillMode) -> Bool {
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
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension MaterialParameterTypes {
    public enum BlendMode : Equatable, Hashable, Sendable {
        case alpha
        case add
        
        public static func == (a: MaterialParameterTypes.BlendMode, b: MaterialParameterTypes.BlendMode) -> Bool {
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
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension MaterialParameterTypes.FaceCulling : Equatable {}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension MaterialParameterTypes.FaceCulling : Hashable {}

@available(tvOS 26.0, visionOS 1.0, macCatalyst 18.0, macOS 15.0, iOS 18.0, *)
extension MaterialParameterTypes.TriangleFillMode : Equatable {}

@available(tvOS 26.0, visionOS 1.0, macCatalyst 18.0, macOS 15.0, iOS 18.0, *)
extension MaterialParameterTypes.TriangleFillMode : Hashable {}
