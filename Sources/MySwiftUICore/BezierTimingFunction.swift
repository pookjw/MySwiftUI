internal import QuartzCore

struct BezierTimingFunction<T : BinaryFloatingPoint> : Equatable {
    var p1x: T
    var p1y: T
    var p2x: T
    var p2y: T

    init<U : BinaryFloatingPoint>(p1: (U, U), p2: (U, U)) {
        assertUnimplemented()
    }

    var p1: (T, T) {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }

    var p2: (T, T) {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }

    static var linear: BezierTimingFunction<T> {
        get {
            assertUnimplemented()
        }
    }

    static func == (a: BezierTimingFunction<T>, b: BezierTimingFunction<T>) -> Bool {
        assertUnimplemented()
    }
}

extension BezierTimingFunction : @unchecked Sendable {
}

extension BezierTimingFunction : ProtobufEncodableMessage, ProtobufDecodableMessage where T == Float {
    init(from decoder: inout ProtobufDecoder) throws {
        assertUnimplemented()
    }
    
    func encode(to encoder: inout ProtobufEncoder) throws {
        assertUnimplemented()
    }
}

extension BezierTimingFunction where T == Float {
    var caTimingFunction: CAMediaTimingFunction {
        assertUnimplemented()
    }
}
