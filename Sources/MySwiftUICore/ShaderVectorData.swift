internal import RenderBox

struct ShaderVectorData : VectorArithmetic, Equatable {
    static func == (lhs: ShaderVectorData, rhs: ShaderVectorData) -> Bool {
        assertUnimplemented()
    }
    
    private var elements: [ShaderVectorData.Element] = []
    
    init(rbShader: RBShader?) {
        guard let rbShader else {
            return
        }
        
        let argumentCount = Int(rbShader.numberOfArguments)
        
        for index in 0..<argumentCount {
            let argument = unsafe rbShader.argument(at: UInt(bitPattern: index))
            
            if unsafe argument.unknown1 != 1 {
                // <+224>
                switch unsafe argument.type {
                case .unknown0:
                    // <+420>
                    self.elements.append(.zero)
                case .unknown1:
                    // <+264>
                    let count = unsafe Int(argument.unknown1)
                    var values: [Float] = []
                    values.reserveCapacity(count)
                    
                    for index in 0..<count {
                        let value = unsafe argument
                            .data
                            .assumingMemoryBound(to: Float.self)
                            .advanced(by: Int(index))
                            .pointee
                        
                        values.append(value)
                    }
                    
                    self.elements.append(.array(values))
                case .unknown2:
                    // <+420>
                    self.elements.append(.zero)
                case .unknown3:
                    // <+420>
                    self.elements.append(.zero)
                case .unknown4:
                    // <+420>
                    self.elements.append(.zero)
                case .unknown5:
                    // <+240>
                    let count = unsafe Int(argument.unknown1) * 4
                    var values: [Float] = []
                    values.reserveCapacity(count)
                    
                    for index in 0..<count {
                        let value = unsafe argument
                            .data
                            .assumingMemoryBound(to: Float.self)
                            .advanced(by: Int(index))
                            .pointee
                        
                        values.append(value)
                    }
                    
                    self.elements.append(.array(values))
                case .unknown6:
                    // <+420>
                    self.elements.append(.zero)
                case .unknown7:
                    // <+420>
                    self.elements.append(.zero)
                @unknown default:
                    // <+420>
                    self.elements.append(.zero)
                }
            } else {
                // <+164>
                switch unsafe argument.type {
                case .unknown0:
                    // <+504>
                    self.elements.append(.zero)
                case .unknown1:
                    // <+476>
                    let value = unsafe argument
                        .data
                        .assumingMemoryBound(to: Float.self)
                        .pointee
                    
                    self.elements.append(.float(value))
                case .unknown2:
                    // <+492>
                    let values = unsafe argument
                        .data
                        .assumingMemoryBound(to: (Float, Float).self)
                        .pointee
                    
                    self.elements.append(.float2(values.0, values.1))
                case .unknown3:
                    // <+208>
                    let values = unsafe argument
                        .data
                        .assumingMemoryBound(to: (Float, Float, Float).self)
                        .pointee
                    
                    self.elements.append(.float3(values.0, values.1, values.2))
                case .unknown4:
                    // <+408>
                    let values = unsafe argument
                        .data
                        .assumingMemoryBound(to: (Float, Float, Float, Float).self)
                        .pointee
                    
                    self.elements.append(.float4(values.0, values.1, values.2, values.3))
                case .unknown5:
                    // <+408>
                    let values = unsafe argument
                        .data
                        .assumingMemoryBound(to: (Float, Float, Float, Float).self)
                        .pointee
                    
                    self.elements.append(.float4(values.0, values.1, values.2, values.3))
                case .unknown6:
                    // <+504>
                    self.elements.append(.zero)
                case .unknown7:
                    // <+504>
                    self.elements.append(.zero)
                @unknown default:
                    // <+504>
                    self.elements.append(.zero)
                }
            }
        }
    }
    
    static func + (lhs: ShaderVectorData, rhs: ShaderVectorData) -> ShaderVectorData {
        assertUnimplemented()
    }
    
    static func - (lhs: ShaderVectorData, rhs: ShaderVectorData) -> ShaderVectorData {
        assertUnimplemented()
    }
    
    static func += (lhs: inout ShaderVectorData, rhs: ShaderVectorData) {
        assertUnimplemented()
    }
    
    static func -= (lhs: inout ShaderVectorData, rhs: ShaderVectorData) {
        assertUnimplemented()
    }
    
    static var zero: ShaderVectorData {
        assertUnimplemented()
    }
    
    var magnitudeSquared: Double {
        assertUnimplemented()
    }
    
    mutating func scale(by rhs: Double) {
        assertUnimplemented()
    }
    
    func updating(rbShader: RBShader?) -> RBShader? {
        assertUnimplemented()
    }
}

extension ShaderVectorData {
    enum Element : VectorArithmetic, Equatable {
        static func + (lhs: ShaderVectorData.Element, rhs: ShaderVectorData.Element) -> ShaderVectorData.Element {
            assertUnimplemented()
        }
        
        static func - (lhs: ShaderVectorData.Element, rhs: ShaderVectorData.Element) -> ShaderVectorData.Element {
            assertUnimplemented()
        }
        
        static func += (lhs: inout ShaderVectorData.Element, rhs: ShaderVectorData.Element) {
            assertUnimplemented()
        }
        
        static func -= (lhs: inout ShaderVectorData.Element, rhs: ShaderVectorData.Element) {
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
