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
        private(set) var ax: Double
        private(set) var bx: Double
        private(set) var cx: Double
        private(set) var ay: Double
        private(set) var by: Double
        private(set) var cy: Double
    }
}
