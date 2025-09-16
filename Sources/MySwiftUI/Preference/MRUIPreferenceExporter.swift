#warning("TODO")
internal import MRUIKit
private import MySwiftUICore
private import BaseBoard
private import UIKit

final class MRUIPreferenceExporter {
    // $s7SwiftUI25MRUIBridgedPreferenceKeysO03allE0_WZ
    static nonisolated(unsafe) let allKeys: [any MRUIBridgedPreferenceKey.Type] = [
        PreferredAnchoredPlaneKey.self,
//        VideoPassthroughBrightnessKey.self,
//        SystemDefinedSurroundingsEffectKey.self,
//        UpperLimbsVisibilityKey.self,
//        TintEffectKey.self,
//        VolumeBaseplateVisibilityKey.self,
//        DisplayContentModeKey.self,
//        SupportedVolumeViewpointsKey.self
    ]
    
    weak var host: MRUIPreferenceHost? = nil
    private var exportedPreferences: [any AnyExportedPreference]
    
    init() {
        self.host = nil
        self.exportedPreferences = MRUIPreferenceExporter
            .allKeys
            .compactMap { key in
                var visitor = ExportPreferenceVisitor()
                key.visitKey(&visitor)
                return visitor.exportedPreference
            }
    }
    
    // inlined from $s7SwiftUI14_UIHostingViewC04rootD0ACyxGx_tcfcTf4gn_n
    // 원래 없음
    @inlinable
    func addPreferences(to viewGraph: ViewGraph) {
        for preference in exportedPreferences {
            preference.addPreference(to: viewGraph)
        }
    }
}

fileprivate protocol AnyExportedPreference {
    func addPreference(to graph: ViewGraph)
    @MainActor mutating func apply(to host: MRUIPreferenceHost)
    mutating func preferencesDidChange(_ values: PreferenceValues)
}

protocol MRUIBridgedPreferenceKey: HostPreferenceKey {
    associatedtype Value
    associatedtype BridgedValue: AnyObject
    
    static var bridgedKey: MRUIPreferenceKey<BridgedValue>.Type { get }
    static func bridgedValue(from value: Value) -> BridgedValue?
    static func value(from bridgedValue: BridgedValue?) -> Value
    static func animation(from value: Value) -> Animation?
}

extension MRUIBridgedPreferenceKey {
    static func visitKey<T: MRUIBridgedPreferenceKeyVisitor>(_ visitor: inout T) {
        visitor.visit(key: self)
    }
}

fileprivate struct ExportPreferenceVisitor: MRUIBridgedPreferenceKeyVisitor {
    var exportedPreference: (any AnyExportedPreference)?
    
    mutating func visit<T: MRUIBridgedPreferenceKey>(key: T.Type) {
        exportedPreference = ExportedPreference(key: key)
    }
}

protocol MRUIBridgedPreferenceKeyVisitor {
    mutating func visit<T: MRUIBridgedPreferenceKey>(key: T.Type)
}

fileprivate struct ExportedPreference<T: MRUIBridgedPreferenceKey>: AnyExportedPreference {
    let key: T.Type
    var value: T.Value
    var seed: VersionSeed = .empty
    var lastSeed: VersionSeed = .empty
    
    init(key: T.Type) {
        self.key = key
        self.value = T.defaultValue
    }
    
    func addPreference(to graph: ViewGraph) {
        graph.addPreference(key)
    }
    
    mutating func preferencesDidChange(_ values: PreferenceValues) {
        let value = values[key]
        let seed = value.seed
        let matches = self.seed.matches(seed)
        
        guard !matches else {
            return
        }
        
        self.value = value.value
        self.seed = value.seed
    }
    
    // _UIHostingView가 들어옴
    mutating func apply(to host: MRUIPreferenceHost) {
        guard !lastSeed.matches(seed) else {
            return
        }
        
        lastSeed = seed
        
        let animationSettings = T.animation(from: value)?.function.animationSettings
        
        UIView._animate(with: animationSettings) { [self] in
            host.setValue(key.bridgedValue(from: value), forPreferenceKey: key.bridgedKey)
        } completion: { _ in }
    }
}
