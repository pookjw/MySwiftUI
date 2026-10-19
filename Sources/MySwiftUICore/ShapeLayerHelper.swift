internal import QuartzCore

struct ShapeLayerHelper {
    static func layerType(_ path: Path, _ paint: AnyResolvedPaint, mayClip: Bool) -> CALayer.Type {
        struct Visitor : ResolvedPaintVisitor {
            private(set) var shapeType: ShapeType
            private(set) var mayClip: Bool
            private(set) var requiredType: CALayer.Type?
            
            mutating func visitPaint<T>(_ point: T) where T : ResolvedPaint {
                assertUnimplemented()
            }
        }
        
        var visitor = Visitor(
            shapeType: ShapeType(path),
            mayClip: mayClip,
            requiredType: nil
        )
        
        paint.visit(&visitor)
        return visitor.requiredType!
    }
    
    // TODO
}

extension ShapeLayerHelper : ResolvedPaintVisitor {
    func visitPaint<T>(_ point: T) where T : ResolvedPaint {
        assertUnimplemented()
    }
}
