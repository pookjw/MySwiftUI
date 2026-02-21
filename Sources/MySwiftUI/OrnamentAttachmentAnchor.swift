public import MySwiftUICore

@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
public struct OrnamentAttachmentAnchor: Sendable {
    public static func scene(_ anchor: UnitPoint) -> OrnamentAttachmentAnchor {
        fatalError("TODO")
    }
    
    // TODO
}

extension View {
    @available(visionOS 1.0, *)
    @available(iOS, unavailable)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    @_disfavoredOverload public nonisolated func ornament<Content>(visibility: Visibility = .automatic, attachmentAnchor: OrnamentAttachmentAnchor, contentAlignment: Alignment = .center, @ViewBuilder ornament: () -> Content) -> some View where Content : View {
        fatalError("TODO")
    }
}

extension OrnamentAttachmentAnchor {
    enum Storage {
        case scene(UnitPoint3D)
        case parent(UnitPoint3D)
    }
}
