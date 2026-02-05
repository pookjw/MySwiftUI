public import CoreGraphics
public import MySwiftUICore

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, *)
@available(macOS, unavailable)
public protocol _UIHostingViewable: AnyObject {
    var rootView: AnyView { get set }
    func _render(seconds: Double)
    func _forEachIdentifiedView(body: (_IdentifiedViewProxy) -> Void)
    func sizeThatFits(in size: CGSize) -> CGSize
    var _disableSafeArea: Bool { get set }
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    var _rendererConfiguration: _RendererConfiguration { get set }
    var _rendererObject: AnyObject? { get }
}
