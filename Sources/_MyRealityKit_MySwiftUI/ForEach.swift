public import MySwiftUICore

@available(visionOS 1.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension ForEach : AttachmentContent where Content : AttachmentContent {
    @MainActor @preconcurrency public var body: Never {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public static func _makeAttachmentList(content: ForEach<Data, ID, Content>, inputs: _AttachmentListInputs) -> _AttachmentListOutputs {
        assertUnimplemented()
    }
    
    @available(visionOS 1.0, *)
    @available(iOS, unavailable, introduced: 13.0)
    @available(tvOS, unavailable, introduced: 13.0)
    @available(watchOS, unavailable, introduced: 6.0)
    @available(macOS, unavailable, introduced: 10.15)
    @available(macCatalyst, unavailable)
    public typealias Body = Never
}

@available(visionOS 1.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension ForEach where ID == Data.Element.ID, Content : AttachmentContent, Data.Element : Identifiable {
    public init(_ data: Data, @AttachmentContentBuilder content: @escaping (Data.Element) -> Content) {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension ForEach where Content : AttachmentContent {
    public init(_ data: Data, id: KeyPath<Data.Element, ID>, @AttachmentContentBuilder content: @escaping (Data.Element) -> Content) {
        assertUnimplemented()
    }
}
