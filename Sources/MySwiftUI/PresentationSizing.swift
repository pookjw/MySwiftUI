// 3ACFC10CCA4797038C65524AC1888A98
public import MySwiftUICore
public import CoreGraphics
internal import UIKit

@available(iOS 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *)
public protocol PresentationSizing {
    func proposedSize(for root: PresentationSizingRoot, context: PresentationSizingContext) -> ProposedViewSize
    @_spi(Internal) func proposedSize(for subview: PresentationSubview, context: PresentationSizingContext) -> ProposedViewSize
    @_spi(Internal) func sizingOptions(context: PresentationSizingContext) -> PresentationSizingOptions
}

@_spi(Internal) public struct PresentationSubview {
    private weak var host: (any ViewRendererHost)?
}

@_spi(Internal) public struct PresentationSizingOptions {
    fileprivate let options: PresentationSizingOptions.Options
    
    static var minimum: PresentationSizingOptions {
        return PresentationSizingOptions(
            options: PresentationSizingOptions.Options(rawValue: 1 << 1)
        )
    }
    
    static var unknown2: PresentationSizingOptions {
        return PresentationSizingOptions(
            options: PresentationSizingOptions.Options(rawValue: 1 << 2)
        )
    }
}

extension PresentationSizingOptions {
    fileprivate struct Options : OptionSet {
        let rawValue: Int
    }
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

extension PresentationSizing {
    @_spi(Internal) public func proposedSize(for subview: PresentationSubview, context: PresentationSizingContext) -> ProposedViewSize {
        assertUnimplemented()
    }
    
    @_spi(Internal) public func sizingOptions(context: PresentationSizingContext) -> PresentationSizingOptions {
        return PresentationSizingOptions(options: [])
    }
}

@available(iOS 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *)
public struct FormPresentationSizing : PresentationSizing, Sendable {
    public func proposedSize(for root: PresentationSizingRoot, context: PresentationSizingContext) -> ProposedViewSize {
        assertUnimplemented()
    }
    
    @_spi(Internal) public func proposedSize(for subview: PresentationSubview, context: PresentationSizingContext) -> ProposedViewSize {
        assertUnimplemented()
    }
    
    @_spi(Internal) public func sizingOptions(context: PresentationSizingContext) -> PresentationSizingOptions {
        return .unknown2
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
    
    @_spi(Internal) public func proposedSize(for subview: PresentationSubview, context: PresentationSizingContext) -> ProposedViewSize {
        assertUnimplemented()
    }
    
    @_spi(Internal) public func sizingOptions(context: PresentationSizingContext) -> PresentationSizingOptions {
        return .unknown2
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
    
    @_spi(Internal) public func proposedSize(for subview: PresentationSubview, context: PresentationSizingContext) -> ProposedViewSize {
        assertUnimplemented()
    }
    
    @_spi(Internal) public func sizingOptions(context: PresentationSizingContext) -> PresentationSizingOptions {
        return PresentationSizingOptions(options: [])
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
        return AutomaticPresentationSizing()
    }
}

@available(iOS 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *)
public struct AutomaticPresentationSizing : PresentationSizing, Sendable {
    public func proposedSize(for root: PresentationSizingRoot, context: PresentationSizingContext) -> ProposedViewSize {
        assertUnimplemented()
    }
    
    @_spi(Internal) public func proposedSize(for subview: PresentationSubview, context: PresentationSizingContext) -> ProposedViewSize {
        assertUnimplemented()
    }
    
    @_spi(Internal) public func sizingOptions(context: PresentationSizingContext) -> PresentationSizingOptions {
        return .unknown2
    }
}

struct SheetSizing {
    private(set) var presentationSizing: any PresentationSizing // 0x0
    private(set) var sizeContext: PresentationSizingContext // 0x28 (0x14 - offset field)
    
    func sheetSizeThatFits<T : View>(host: _UIHostingView<T>, subview: PresentationSizingRoot) -> CGSize {
        /*
         self -> x20 -> x19
         subview -> x0 -> x27
         */
        // <+100>
        let proposedSize = self
            .presentationSizing
            .proposedSize(for: subview, context: self.sizeContext)
        
        var fittingSize: CGSize
        if let host = subview.host {
            // <+192>
            let size = _ProposedSize(proposedSize)
            fittingSize = host.sizeThatFits(size)
            // <+320>
        } else {
            // <+284>
            fittingSize = proposedSize.replacingUnspecifiedDimensions(
                by: CGSize(width: 10, height: 10)
            )
        }
        
        // <+320>
        let options = self.presentationSizing.sizingOptions(context: self.sizeContext)
        
        if options.options.contains(PresentationSizingOptions.minimum.options) {
            // <+376>
            if let width = proposedSize.width {
                fittingSize.width = (fittingSize.width >= width) ? fittingSize.width : width
            }
            
            if let height = proposedSize.height {
                fittingSize.height = (fittingSize.height >= height) ? fittingSize.height : height
            }
        }
        
        // <+424>
        fittingSize.width = (fittingSize.width <= 272) ? 272 : fittingSize.width
        fittingSize.height = (fittingSize.height <= 136) ? 136 : fittingSize.height
        
        return fittingSize
    }
}
