private import UIKit
@_spi(Internal) private import MySwiftUICore
private import AttributeGraph

@MainActor final class SharingActivityPickerBridge {
    weak var host: ViewRendererHost? = nil // 0x10
    private var overrideArrowDirections: UIPopoverArrowDirection? = nil // 0x20
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
        guard activePresentation != nil else {
            return
        }
        
        onNextMainRunLoop {
            self.reset()
        }
    }
    
    func preferencesDidChange(_ preferenceValues: PreferenceValues) {
        /*
         self -> x20 -> x28
         preferenceValues -> x0 -> x20
         */
        // <+184>
        // x22
        let presentationPreference = preferenceValues[SharingActivityPickerPresentation.Key.self]
        // x29 - 0x100
        let presentationValue = presentationPreference.value
        
        if presentationValue.count > 1 {
            return
        } 
        
        // x19 + 0x8
        let uiPresenterViewController: UIViewController?
        if (presenterOverride == nil) {
            guard let viewController = host!.uiPresenterViewController else {
                return
            }
            
            uiPresenterViewController = viewController
        } else {
            uiPresenterViewController = nil
        }
        
        // <+332>
        // x26
        let newSeed = presentationPreference.seed
        // x27
        let oldSeed = lastPresentationSeed
        guard !newSeed.matches(oldSeed) else {
            return
        }
        
        // <+540>
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
    
    fileprivate func reset() {
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
