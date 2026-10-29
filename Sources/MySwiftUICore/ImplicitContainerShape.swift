internal import CoreGraphics

struct ImplicitContainerShape {
    init() {}
}

extension ImplicitContainerShape : Shape {
    nonisolated func path(in rect: CGRect) -> Path {
        if let proxy = GeometryProxy.current {
            // <+44>
            let containerShape = proxy.environment.containerShape
            
            if containerShape.isSystemShape {
                return Path(rect)
            } else {
                return containerShape.type.path(
                    in: rect,
                    proxy: proxy,
                    shape: containerShape.shape,
                    context: containerShape.context
                )
            }
        } else {
            // <+148>
            return Path(rect)
        }
    }
}
