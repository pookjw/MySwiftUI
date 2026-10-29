internal import CoreGraphics

struct ImplicitContainerShape {
    init() {}
}

extension ImplicitContainerShape : Shape {
    nonisolated func path(in rect: CGRect) -> Path {
        assertUnimplemented()
    }
    
    nonisolated static var role: ShapeRole {
        assertUnimplemented()
    }
    
    nonisolated var layoutDirectionBehavior: LayoutDirectionBehavior {
        assertUnimplemented()
    }
    
    nonisolated func sizeThatFits(_ proposal: ProposedViewSize) -> CGSize {
        assertUnimplemented()
    }
}
