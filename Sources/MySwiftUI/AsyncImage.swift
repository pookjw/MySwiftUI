public import MySwiftUICore
public import Foundation
public import CoreGraphics

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public struct AsyncImage<Content> : View where Content : View {
    public init(url: URL?, scale: CGFloat = 1) where Content == Image {
        assertUnimplemented()
    }

    @_alwaysEmitIntoClient public init<I, P>(url: URL?, scale: CGFloat = 1, @ViewBuilder content: @escaping (Image) -> I, @ViewBuilder placeholder: @escaping () -> P) where Content == _ConditionalContent<I, P>, I : View, P : View {
        self.init(url: url, scale: scale) { phase in
            if let image = phase.image {
                content(image)
            } else {
                placeholder()
            }
        }
    }

    public init(url: URL?, scale: CGFloat = 1, transaction: Transaction = Transaction(), @ViewBuilder content: @escaping (AsyncImagePhase) -> Content) {
        assertUnimplemented()
    }

    @MainActor @preconcurrency public var body: some View {
        __MSUI_UnimplementedView<Self>()
    }
}

@available(*, unavailable)
extension AsyncImage : Sendable {}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public enum AsyncImagePhase : Sendable {
    case empty
    case success(Image)
    case failure(any Error)

    public var image: Image? {
        assertUnimplemented()
    }

    public var error: (any Error)? {
        assertUnimplemented()
    }
}
