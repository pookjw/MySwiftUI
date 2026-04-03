// 8A277925612D2191C60D4EC55A8223CA
private import MySwiftUICore
public import CoreGraphics
public import Spatial
private import UIKit

struct WindowLayoutProvider {
    var makeLayout: () -> AnyWindowLayout
}

struct DefaultPlacementWindowLayoutProvider {
    private var makePlacement: MakePlacement
}

fileprivate enum MakePlacement {
    case v1((WindowLayoutRootView, WindowPlacementContext) -> WindowPlacement)
    case v2((WindowLayoutRoot, WindowPlacementContext) -> WindowPlacement)
}

struct WindowLayoutRootView {
    private var proxy: WindowLayoutRootView.Proxy
    private var windowLayoutValues: PreferenceValues
}

extension WindowLayoutRootView {
    enum Proxy {
        case layout(LayoutProxy)
        case host(WindowLayoutRootView.WeakHost)
    }
    
    struct WeakHost {
        private weak var host: (UIView & ViewRendererHost)?
    }
}

@available(macOS 15.0, visionOS 2.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct WindowPlacement : Equatable {
    @available(macOS, unavailable)
    public struct Position : Equatable {
        public static var utilityPanel: WindowPlacement.Position {
            assertUnimplemented()
        }
        
        public static func leading(_ relativeWindow: WindowProxy) -> WindowPlacement.Position {
            assertUnimplemented()
        }
        
        public static func trailing(_ relativeWindow: WindowProxy) -> WindowPlacement.Position {
            assertUnimplemented()
        }
        
        public static func above(_ relativeWindow: WindowProxy) -> WindowPlacement.Position {
            assertUnimplemented()
        }
        
        public static func below(_ relativeWindow: WindowProxy) -> WindowPlacement.Position {
            assertUnimplemented()
        }
        
        @available(visionOS, introduced: 2.0, deprecated: 2.0, message: "Use PushWindowAction instead.")
        public static func replacing(_ relativeWindow: WindowProxy) -> WindowPlacement.Position {
            assertUnimplemented()
        }
        
        public static func == (a: WindowPlacement.Position, b: WindowPlacement.Position) -> Bool {
            assertUnimplemented()
        }
    }
    
    @available(visionOS, unavailable)
    public init(_ position: CGPoint? = nil, size: CGSize? = nil) {
        assertUnimplemented()
    }
    
    @available(visionOS, unavailable)
    public init(x: CGFloat? = nil, y: CGFloat? = nil, width: CGFloat? = nil, height: CGFloat? = nil) {
        assertUnimplemented()
    }
    
    @available(visionOS, unavailable)
    public init(_ position: UnitPoint, size: CGSize? = nil) {
        assertUnimplemented()
    }
    
    @available(visionOS, unavailable)
    public init(_ position: UnitPoint, width: CGFloat? = nil, height: CGFloat? = nil) {
        assertUnimplemented()
    }
    
    @available(macOS, unavailable)
    public init(_ position: WindowPlacement.Position? = nil) {
        assertUnimplemented()
    }
    
    @available(macOS, unavailable)
    public init(_ position: WindowPlacement.Position? = nil, size: CGSize? = nil) {
        assertUnimplemented()
    }
    
    @available(macOS, unavailable)
    public init(_ position: WindowPlacement.Position? = nil, size3D: Size3D? = nil) {
        assertUnimplemented()
    }
    
    @available(macOS, unavailable)
    public init(_ position: WindowPlacement.Position? = nil, width: CGFloat? = nil, height: CGFloat? = nil, depth: CGFloat? = nil) {
        assertUnimplemented()
    }
    
    public static func == (a: WindowPlacement, b: WindowPlacement) -> Bool {
        assertUnimplemented()
    }
    
}

@available(*, unavailable)
extension WindowPlacement : Sendable {
}
@available(*, unavailable)
extension WindowPlacement.Position : Sendable {
}

@available(macOS 15.0, visionOS 2.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct WindowPlacementContext {
    @available(visionOS, unavailable)
    public var defaultDisplay: DisplayProxy {
        assertUnimplemented()
    }
    
    @available(macOS, unavailable)
    public var windows: [WindowProxy] {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension WindowPlacementContext : Sendable {
}

@available(macOS 15.0, visionOS 2.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension Scene {
    nonisolated public func defaultWindowPlacement(_ makePlacement: @escaping (_ content: WindowLayoutRoot, _ context: WindowPlacementContext) -> WindowPlacement) -> some Scene {
        assertUnimplemented()
    }
}

@available(macOS 15.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
extension Scene {
    nonisolated public func windowIdealPlacement(_ makePlacement: @escaping (_ content: WindowLayoutRoot, _ context: WindowPlacementContext) -> WindowPlacement) -> some Scene {
        assertUnimplemented()
    }
    
    nonisolated public func windowIdealSize(_ idealSize: WindowIdealSize) -> some Scene {
        assertUnimplemented()
    }
}

@available(macOS 15.0, visionOS 2.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct WindowLayoutRoot {
    public func sizeThatFits(_ proposal: ProposedViewSize) -> CGSize {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension WindowLayoutRoot : Sendable {
}

@available(macOS 15.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@available(visionOS, unavailable)
public struct DisplayProxy : Equatable {
    public let bounds: CGRect
    public let safeAreaInsets: EdgeInsets
    public let visibleRect: CGRect
    
    public static func == (a: DisplayProxy, b: DisplayProxy) -> Bool {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension DisplayProxy : Sendable {
}

@available(macOS 15.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
public struct WindowIdealSize : Sendable {
    public static let automatic: WindowIdealSize = {
        assertUnimplemented()
    }()
    
    public static let fitToContent: WindowIdealSize = {
        assertUnimplemented()
    }()
    
    public static let maximum: WindowIdealSize = {
        assertUnimplemented()
    }()
    
}

struct IdealWindowPlacementLayout : WindowLayout {
    private var makePlacement: MakePlacement
    
    static var windowLayoutProperties: WindowLayoutProperties {
        return WindowLayoutProperties()
    }
    
    typealias Cache = Void
    
    func windowPlacement(content: WindowLayoutRootView, context: WindowPlacementContext, cache: inout Void) -> WindowPlacement {
        assertUnimplemented()
    }
}
