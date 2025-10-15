#warning("TODO")
internal import MySwiftUICore

struct RemotePresentationDelayKey: HostPreferenceKey {
    typealias Value = Never? // TODO
    
    static func reduce(value: inout Never?, nextValue: () -> Never?) {
        fatalError("TODO")
    }
}
