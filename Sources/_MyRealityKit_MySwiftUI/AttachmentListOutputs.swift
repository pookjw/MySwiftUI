// E8F69B151E7FF7603B12DB8BB9C18C89
internal import MySwiftUICore

@available(visionOS 1.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
public struct _AttachmentListOutputs : @unchecked Sendable {
    fileprivate nonisolated(unsafe) static var currentSeed = 0
    
    private let seed: Int
    var attachments: [AnyHashable : ResolvedAttachment]
    
    @inline(always) // 원래 없음
    init() {
        self.seed = unsafe _AttachmentListOutputs.currentSeed
        self.attachments = [:]
        unsafe _AttachmentListOutputs.currentSeed &+= 1
    }
}

struct ResolvedAttachment {
    private(set) var view: AnyView
}
