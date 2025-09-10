#warning("TODO")
internal import MySwiftUICore

struct FeedbackRequest {
    // TODO
}

extension FeedbackRequest {
    struct Seed: Hashable {
        private let value: Int
    }
    
    struct PreferenceKey: HostPreferenceKey {
        typealias Value = Never? // TODO
    }
}
