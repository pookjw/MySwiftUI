@available(visionOS 1.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@preconcurrency @MainActor public protocol AttachmentContent {
    associatedtype Body : AttachmentContent
    
    @AttachmentContentBuilder @MainActor @preconcurrency var body: Self.Body { get }
    @MainActor @preconcurrency static func _makeAttachmentList(content: Self, inputs: _AttachmentListInputs) -> _AttachmentListOutputs
}

protocol PrimitiveAttachmentContent : AttachmentContent {
}

extension PrimitiveAttachmentContent {
    public var body: Never {
        preconditionFailure()
    }
}

protocol AttachmentProtocol : Identifiable {
    associatedtype ViewType
    
    var view: Self.ViewType {
        get
    }
}
