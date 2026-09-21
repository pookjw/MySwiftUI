public import MySwiftUICore

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
public struct ScrollEdgeEffectStyle : Hashable, Sendable {
    private var role: ScrollEdgeEffectStyle.Role
    
    public static var automatic: ScrollEdgeEffectStyle {
        assertUnimplemented()
    }
    
    public static var hard: ScrollEdgeEffectStyle {
        assertUnimplemented()
    }
    
    public static var soft: ScrollEdgeEffectStyle {
        assertUnimplemented()
    }
    
    public static func == (a: ScrollEdgeEffectStyle, b: ScrollEdgeEffectStyle) -> Bool {
        assertUnimplemented()
    }
    
    public func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
}

extension ScrollEdgeEffectStyle {
    enum Role : Hashable {
        case automatic
        case hard
        case soft
    }
}

extension View {
    @available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, *)
    @available(visionOS, unavailable)
    nonisolated public func scrollEdgeEffectStyle(_ style: ScrollEdgeEffectStyle?, for edges: Edge.Set) -> some View {
        assertUnimplemented()
    }
    
    @available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, *)
    @available(visionOS, unavailable)
    nonisolated public func scrollEdgeEffectHidden(_ hidden: Bool = true, for edges: Edge.Set = .all) -> some View {
        assertUnimplemented()
    }
}
