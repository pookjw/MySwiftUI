public import MySwiftUICore
public import CoreGraphics
internal import UIKit

@available(iOS 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *)
public protocol PresentationSizing {
    func proposedSize(for root: PresentationSizingRoot, context: PresentationSizingContext) -> ProposedViewSize
}

@available(iOS 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *)
public struct PresentationSizingRoot {
    private(set) weak var host: (any ViewRendererHost)?
    
    public func sizeThatFits(_ proposal: ProposedViewSize) -> CGSize {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension PresentationSizingRoot : Sendable {
}

@available(iOS 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *)
public struct PresentationSizingContext {
    private(set) var presenter: UIView // 0x0
    private(set) var navigationColumnCount: Int // 0x8
    private(set) var currentSize: CGSize? // 0x10
    private(set) var sidebarColumnWidth: CGFloat? // 0x28
    private(set) var contentColumnWidth: CGFloat? // 0x38
    private(set) var interfaceIdiom: AnyInterfaceIdiom // 0x24 (offset field)
    private(set) var readableWidth: CGFloat // 0x28 (offset field)
}

extension PresentationSizing {
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *)
    public func sticky(horizontal: Bool = false, vertical: Bool = false) -> some PresentationSizing {
        assertUnimplemented()
        return .automatic
    }
}

extension PresentationSizing {
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *)
    public func fitted(horizontal: Bool, vertical: Bool) -> some PresentationSizing {
        assertUnimplemented()
        return .automatic
    }
}

@available(iOS 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *)
public struct FormPresentationSizing : PresentationSizing, Sendable {
    public func proposedSize(for root: PresentationSizingRoot, context: PresentationSizingContext) -> ProposedViewSize {
        assertUnimplemented()
    }
}

@available(iOS 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *)
extension PresentationSizing where Self == FormPresentationSizing {
    public static var form: FormPresentationSizing {
        assertUnimplemented()
    }
}

@available(iOS 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *)
public struct PagePresentationSizing : PresentationSizing, Sendable {
    public func proposedSize(for root: PresentationSizingRoot, context: PresentationSizingContext) -> ProposedViewSize {
        assertUnimplemented()
    }
}

@available(iOS 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *)
extension PresentationSizing where Self == PagePresentationSizing {
    public static var page: PagePresentationSizing {
        assertUnimplemented()
    }
}

@available(iOS 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *)
public struct FittedPresentationSizing : PresentationSizing, Sendable {
    public func proposedSize(for root: PresentationSizingRoot, context: PresentationSizingContext) -> ProposedViewSize {
        assertUnimplemented()
    }
}

@available(iOS 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *)
extension PresentationSizing where Self == FittedPresentationSizing {
    public static var fitted: FittedPresentationSizing {
        assertUnimplemented()
    }
}

@available(iOS 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *)
extension View {
    nonisolated public func presentationSizing(_ sizing: some PresentationSizing) -> some View {
        assertUnimplemented()
    }
}

@available(iOS 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *)
extension PresentationSizing where Self == AutomaticPresentationSizing {
    public static var automatic: AutomaticPresentationSizing {
        assertUnimplemented()
    }
}

@available(iOS 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *)
public struct AutomaticPresentationSizing : PresentationSizing, Sendable {
    public func proposedSize(for root: PresentationSizingRoot, context: PresentationSizingContext) -> ProposedViewSize {
        assertUnimplemented()
    }
}
