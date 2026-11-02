internal import CoreGraphics
private import simd
#if SwiftUICompatibility
package import _SwiftUICorePrivate
#endif

package struct SDFShape : Equatable, ProtobufEncodableMessage, ProtobufDecodableMessage {
    private(set) var origin: CGPoint // 0x0
    private(set) var path: PathSet // 0x10
    private(set) var style: SDFStyle // 0x20
    private(set) var ovalization: Float // 0x28
    private(set) var options: Material.Layer.SDFLayer.Options // 0x2c
    private(set) var backdropObserver: SDFShape.BackdropObserver? // 0x30
    
    @inline(always) // 원래 없음
    init(
        origin: CGPoint,
        path: PathSet,
        style: SDFStyle,
        ovalization: Float,
        options: Material.Layer.SDFLayer.Options,
        backdropObserver: SDFShape.BackdropObserver?
    ) {
        self.origin = origin
        self.path = path
        self.style = style
        self.ovalization = ovalization
        self.options = options
        self.backdropObserver = backdropObserver
    }
    
    package static func == (a: SDFShape, b: SDFShape) -> Bool {
        assertUnimplemented()
    }
    
    package func encode(to encoder: inout ProtobufEncoder) throws {
        assertUnimplemented()
    }
    
    package init(from decoder: inout ProtobufDecoder) throws {
        assertUnimplemented()
    }
}

extension SDFShape {
#if SwiftUICompatibility
    final class BackdropObserver : _SwiftUICorePrivate::MaterialBackdropObserver {
        func luminanceDidChange(_ luminance: Float?) {
            assertUnimplemented()
        }
    }
#else
    final class BackdropObserver : MySwiftUICore::MaterialBackdropObserver {
        func luminanceDidChange(_ luminance: Float?) {
            assertUnimplemented()
        }
    }
#endif
}

indirect enum SDFStyle : ProtobufEncodableMessage, ProtobufDecodableMessage {
    case fill(SDFStyle.Fill)
    case stroke(SDFStyle.Stroke)
    case gradient(SDFStyle.Gradient)
    case shadow(SDFStyle.Shadow)
    case customFill(SDFStyle.CustomFill)
    case glassDisplacement(SDFStyle.GlassDisplacement)
    case glassHighlight(SDFStyle.GlassHighlight)
    case glassKeyFillHighlight(Material.Layer.SDFLayer.Contents.GlassKeyFillHighlight)
    case group(SDFStyle.Group)
    case mask(SDFStyle.Mask)
    case outputSDF(SDFStyle.OutputSDF)
    
    func encode(to encoder: inout ProtobufEncoder) throws {
        assertUnimplemented()
    }
    
    init(from decoder: inout ProtobufDecoder) throws {
        assertUnimplemented()
    }
}

extension SDFStyle {
    var distanceRange: ClosedRange<CGFloat>? {
        assertUnimplemented()
    }
    
    var needsDistanceGradient: Bool {
        assertUnimplemented()
    }
    
    struct OutputSDF : ProtobufEncodableMessage, ProtobufDecodableMessage {
        private var inset: CGFloat
        private var range: ClosedRange<CGFloat>
        
        func encode(to encoder: inout ProtobufEncoder) throws {
            assertUnimplemented()
        }
        
        init(from decoder: inout ProtobufDecoder) throws {
            assertUnimplemented()
        }
    }
    
    struct Mask : ProtobufEncodableMessage, ProtobufDecodableMessage {
        private var content: SDFStyle
        private var mask: SDFStyle
        
        func encode(to encoder: inout ProtobufEncoder) throws {
            assertUnimplemented()
        }
        
        init(from decoder: inout ProtobufDecoder) throws {
            assertUnimplemented()
        }
    }
    
    struct Group : ProtobufEncodableMessage, ProtobufDecodableMessage {
        var margin: CGFloat
        
        func encode(to encoder: inout ProtobufEncoder) throws {
            assertUnimplemented()
        }
        
        init(from decoder: inout ProtobufDecoder) throws {
            assertUnimplemented()
        }
        
        // TODO
    }
    
    struct GlassHighlight : ProtobufEncodableMessage, ProtobufDecodableMessage {
        private var inset: CGFloat
        private var color: Color.ResolvedHDR
        private var height: CGFloat
        private var angle: Angle
        private var curvature: CGFloat
        private var spread: Angle
        private var amount: CGFloat
        private var appliesDisplayAngle: Bool
        
        func encode(to encoder: inout ProtobufEncoder) throws {
            assertUnimplemented()
        }
        
        init(from decoder: inout ProtobufDecoder) throws {
            assertUnimplemented()
        }
    }
    
    struct GlassDisplacement : ProtobufEncodableMessage, ProtobufDecodableMessage {
        private var inset: CGFloat
        private var height: CGFloat
        private var curvature: CGFloat
        private var angle: Angle
        private var maskInset: CGFloat
        
        func encode(to encoder: inout ProtobufEncoder) throws {
            assertUnimplemented()
        }
        
        init(from decoder: inout ProtobufDecoder) throws {
            assertUnimplemented()
        }
    }
    
    struct CustomFill {
        // TODO
    }
    
    struct Shadow : ProtobufEncodableMessage, ProtobufDecodableMessage {
        private var inset: CGFloat
        private var color: Color.ResolvedHDR
        private var radius: CGFloat
        private var offset: CGSize
        private var knockout: Bool
        private var inverted: Bool
        
        func encode(to encoder: inout ProtobufEncoder) throws {
            assertUnimplemented()
        }
        
        init(from decoder: inout ProtobufDecoder) throws {
            assertUnimplemented()
        }
    }
    
    struct Gradient : ProtobufEncodableMessage, ProtobufDecodableMessage {
        private var colors: [Color.ResolvedHDR]
        private var distances: [CGFloat]
        private var interpolations: [SIMD4<Float>]
        
        func encode(to encoder: inout ProtobufEncoder) throws {
            assertUnimplemented()
        }
        
        init(from decoder: inout ProtobufDecoder) throws {
            assertUnimplemented()
        }
    }
    
    struct Stroke : ProtobufEncodableMessage, ProtobufDecodableMessage {
        private var inset: CGFloat
        private var lineWidth: CGFloat
        private var color: Color.ResolvedHDR
        
        func encode(to encoder: inout ProtobufEncoder) throws {
            assertUnimplemented()
        }
        
        init(from decoder: inout ProtobufDecoder) throws {
            assertUnimplemented()
        }
    }
    
    struct Fill : ProtobufEncodableMessage, ProtobufDecodableMessage {
        private var inset: CGFloat
        private var color: Color.ResolvedHDR
        
        @inline(always) // 원래 없음
        init(inset: CGFloat, color: Color.ResolvedHDR) {
            self.inset = inset
            self.color = color
        }
        
        func encode(to encoder: inout ProtobufEncoder) throws {
            assertUnimplemented()
        }
        
        init(from decoder: inout ProtobufDecoder) throws {
            assertUnimplemented()
        }
    }
}
