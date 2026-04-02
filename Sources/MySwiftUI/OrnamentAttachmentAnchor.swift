public import MySwiftUICore

@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
public struct OrnamentAttachmentAnchor : Sendable {
    public static func scene(_ anchor: UnitPoint) -> OrnamentAttachmentAnchor {
        assertUnimplemented()
    }
    
    // TODO
}

extension View {
    @available(visionOS 1.0, *)
    @available(iOS, unavailable)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    @_disfavoredOverload nonisolated public func ornament<Content>(visibility: Visibility = .automatic, attachmentAnchor: OrnamentAttachmentAnchor, contentAlignment: Alignment = .center, @ViewBuilder ornament: () -> Content) -> some View where Content : View {
        assertUnimplemented()
    }
}

extension OrnamentAttachmentAnchor {
    enum Storage {
        case scene(UnitPoint3D)
        case parent(UnitPoint3D)
    }
}
