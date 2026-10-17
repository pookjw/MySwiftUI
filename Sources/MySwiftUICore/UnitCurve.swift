@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
public struct UnitCurve {
    public static func bezier(startControlPoint: UnitPoint, endControlPoint: UnitPoint) -> UnitCurve {
        assertUnimplemented()
    }
    
    public func value(at progress: Double) -> Double {
        assertUnimplemented()
    }
    
    public func velocity(at progress: Double) -> Double {
        assertUnimplemented()
    }
    
    public var inverse: UnitCurve {
        assertUnimplemented()
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension UnitCurve : Sendable {
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension UnitCurve : Hashable {
    public static func == (a: UnitCurve, b: UnitCurve) -> Bool{
        assertUnimplemented()
    }
}

extension UnitCurve {
    struct CubicSolver : Hashable, ProtobufEncodableMessage, ProtobufDecodableMessage {
        private var ax: Double
        private var bx: Double
        private var cx: Double
        private var ay: Double
        private var by: Double
        private var cy: Double
        
        init(startControlPoint: UnitPoint, endControlPoint: UnitPoint) {
            let startX = Double(startControlPoint.x)
            let startY = Double(startControlPoint.y)
            let endX = Double(endControlPoint.x)
            let endY = Double(endControlPoint.y)

            self.cx = startX * 3
            self.bx = (endX - startX) * 3 - self.cx
            self.ax = 1 - self.cx - self.bx
            self.cy = startY * 3
            self.by = (endY - startY) * 3 - self.cy
            self.ay = 1 - self.cy - self.by
        }
        
        func encode(to encoder: inout ProtobufEncoder) throws {
            assertUnimplemented()
        }
        
        init(from decoder: inout ProtobufDecoder) throws {
            assertUnimplemented()
        }
    }
}
