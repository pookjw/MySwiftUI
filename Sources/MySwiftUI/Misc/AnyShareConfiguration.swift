internal import Foundation
private import MySwiftUICore

struct AnyShareConfiguration {
    private var storage: AnyShareConfiguration.Storage
    private var subject: Text?
    private var message: Text?
}

extension AnyShareConfiguration {
    enum Storage {
        case direct([Any])
        case unresolvedItemProviders(() -> [NSItemProvider], (Int) -> AnySharePreview?)
        case resolvedItemProviders([NSItemProvider], (Int) -> AnySharePreview?)
    }
}

extension AnyShareConfiguration {
    struct Key: HostPreferenceKey {
        static func reduce(value: inout AnyShareConfiguration?, nextValue: () -> AnyShareConfiguration?) {
            fatalError("TODO")
        }
    }
}

struct AnySharePreview {
    private var title: Text?
    private var image: () -> NSItemProvider?
    private var icon: () -> NSItemProvider?
    private var metadata: Any?
}
