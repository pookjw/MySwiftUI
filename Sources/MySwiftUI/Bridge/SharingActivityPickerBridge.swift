private import UIKit
@_spi(Internal) private import MySwiftUICore
private import AttributeGraph

final class SharingActivityPickerBridge {
    weak var host: ViewRendererHost? = nil // 0x10
    private var overrideArrowDirections: UIPopoverArrowDirection? = nil // 0x18
    private weak var presenterOverride: UIViewController? = nil // 0x30
    private weak var barItemAnchor: UIBarButtonItem? = nil // 0x38
    private var activePresentation: SharingActivityPickerPresentation? = nil // 0x40
    private var presented: UIActivityViewController? = nil // 0xd8
    private var lastPresentationSeed: VersionSeed = .empty // 0x938
    private lazy var popoverPresentationDelegate: PopoverPresentationDelegate = {
        fatalError("TODO")
    }() // 0x940 (storage)
    private var hasPendingAnchorUpdate: Bool = false // 0x7a8
    
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
        guard !hasPendingAnchorUpdate else {
            return
        }
        
        // sp + 0x140
        let copy_1 = activePresentation
        // sp + 0x1e0
        let copy_2 = activePresentation
        
        guard let copy_2 else {
            return
        } 
        
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
