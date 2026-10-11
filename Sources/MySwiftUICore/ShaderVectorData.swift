struct ShaderVectorData : VectorArithmetic {
    static func + (lhs: ShaderVectorData, rhs: ShaderVectorData) -> ShaderVectorData {
        assertUnimplemented()
    }
    
    static func - (lhs: ShaderVectorData, rhs: ShaderVectorData) -> ShaderVectorData {
        assertUnimplemented()
    }
    
    static var zero: ShaderVectorData {
        assertUnimplemented()
    }
    
    private var elements: [ShaderVectorData.Element]
    
    var magnitudeSquared: Double {
        assertUnimplemented()
    }
    
    mutating func scale(by rhs: Double) {
        assertUnimplemented()
    }
}

extension ShaderVectorData {
    enum Element : VectorArithmetic {
        static func + (lhs: ShaderVectorData.Element, rhs: ShaderVectorData.Element) -> ShaderVectorData.Element {
            assertUnimplemented()
        }
        
        static func - (lhs: ShaderVectorData.Element, rhs: ShaderVectorData.Element) -> ShaderVectorData.Element {
            assertUnimplemented()
        }
        
        case float(Float)
        case float2(Float, Float)
        case float3(Float, Float, Float)
        case float4(Float, Float, Float, Float)
        case array([Float])
        case zero
        
        var magnitudeSquared: Double {
            assertUnimplemented()
        }
        
        mutating func scale(by rhs: Double) {
            assertUnimplemented()
        }
    }
}
