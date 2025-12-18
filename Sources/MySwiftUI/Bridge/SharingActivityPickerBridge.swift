private import UIKit
private import MySwiftUICore
private import AttributeGraph

final class SharingActivityPickerBridge {
    private weak var host: ViewRendererHost?
    private var overrideArrowDirections: UIPopoverArrowDirection?
    private weak var presenterOverride: UIViewController?
    private weak var barItemAnchor: UIBarButtonItem?
    private var activePresentation: SharingActivityPickerPresentation?
    private var presented: UIActivityViewController?
    private var lastPresentationSeed: VersionSeed
    private lazy var popoverPresentationDelegate = PopoverPresentationDelegate() // TODO
    private var hasPendingAnchorUpdate: Bool
    
    init() {
        fatalError("TODO")
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
