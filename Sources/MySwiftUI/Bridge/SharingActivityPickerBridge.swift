private import UIKit
@_spi(Internal) private import MySwiftUICore
private import AttributeGraph

final class SharingActivityPickerBridge {
    weak var host: ViewRendererHost? = nil
    private var overrideArrowDirections: UIPopoverArrowDirection? = nil
    private weak var presenterOverride: UIViewController? = nil
    private weak var barItemAnchor: UIBarButtonItem? = nil
    private var activePresentation: SharingActivityPickerPresentation? = nil
    private var presented: UIActivityViewController? = nil
    private var lastPresentationSeed: VersionSeed = .empty // 0x938
    private lazy var popoverPresentationDelegate: PopoverPresentationDelegate = {
        fatalError("TODO")
    }() // 0x940 (storage)
    private var hasPendingAnchorUpdate: Bool = false // 0x948
    
    init() {
    }
    
    // 원래 없음
    @inlinable
    @MainActor
    func hostRemovedFromWindow() {
        onNextMainRunLoop {
            self.reset()
        }
    }
    
    func preferencesDidChange(_ preferenceValues: PreferenceValues) {
        fatalError("TODO")
    }
    
    func transformDidChange() {
        fatalError("TODO")
    }
    
    private func reset() {
        fatalError("TODO")
    }
    
    @inline(__always)
    final func addPreferences(to viewGraph: ViewGraph) {
        viewGraph.addPreference(SharingActivityPickerPresentation.Key.self)
    }
}

fileprivate struct SharingActivityPickerPresentation: @unchecked Sendable {
    private var source: SharingPickerSource
    private var anchor: Anchor<CGRect?>
    private var environmentAttr: Attribute<EnvironmentValues>
}

extension SharingActivityPickerPresentation {
    struct Key: HostPreferenceKey {
        static let defaultValue: [SharingActivityPickerPresentation] = []
        
        static func reduce(value: inout [SharingActivityPickerPresentation], nextValue: () -> [SharingActivityPickerPresentation]) {
            fatalError("TODO")
        }
    }
}
