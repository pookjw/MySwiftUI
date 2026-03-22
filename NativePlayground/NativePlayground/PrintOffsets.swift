//
//  PrintOffsets.swift
//  NativePlayground
//
//  Created by Jinwoo Kim on 11/3/26.
//

import _SwiftPrivate
import _SwiftUIPrivate
@_spi(SwiftUI) import _SwiftUICorePrivate
import _UIKitPrivate
import Foundation
import SwiftUI

// expr -l swift -O -- _mangledTypeName(type(of: unsafeBitCast(0x106a5ee80, to: AnyObject.self)))
// expr -l swift -O -- _mangledTypeName(unsafeBitCast(0x0000000238fede90, to: Any.Type.self))

// $s7SwiftUI12PropertyListVy5ValueQzxmcAA0C3KeyRzluigAEyXEfU_

private func dumpFieldOffsets(of type: Any.Type, options: _EachFieldOptions) {
    _forEachField(of: type, options: options) { name, offset, fieldType, _ in
        print(String(format: "%s (%@) (0x%lx)", name, _typeName(fieldType, qualified: true), offset))
        return true
    }
}

private func printFields(_ type: Any.Type, isClassType: Bool) {
    let options: _EachFieldOptions = isClassType ? [.classType] : []
    print(_typeName(type, qualified: true))
    dumpFieldOffsets(of: type, options: options)
    print("===")
}

private func printFields(_ mangledName: String, isClassType: Bool) {
    printFields(_typeByName(mangledName)!, isClassType: isClassType)
}

func printOffsets() {
    printFields("7SwiftUI11DisplayListVAAE12ViewRendererC", isClassType: true)
    printFields("7SwiftUI11DisplayListV11ViewUpdaterC", isClassType: true)
    printFields("7SwiftUI11DisplayListV11ViewUpdaterC0E5CacheV", isClassType: false)
    printFields("7SwiftUI11DisplayListV11ViewUpdaterC0E4InfoV", isClassType: false)
    printFields("7SwiftUI11DisplayListV11ViewUpdaterC8PlatformV", isClassType: false)
    printFields("7SwiftUI19ResolvedShadowStyleV", isClassType: false)
    printFields("7SwiftUI11DisplayListV11ViewUpdaterC5ModelO5StateV", isClassType: false)
    printFields("7SwiftUI11DisplayListV11ViewUpdaterC8PlatformV5StateV", isClassType: false)
    printFields("7SwiftUI11DisplayListV11ViewUpdaterC0E4InfoV5SeedsV", isClassType: false)
    printFields("7SwiftUI25PlatformItemListViewGraphV", isClassType: false)
    printFields("7SwiftUI17CachedEnvironmentV13AnimatedFrameV", isClassType: false)
    printFields("7SwiftUI24AnimatableFrameAttributeV", isClassType: false)
    printFields(_GraphInputs.self, isClassType: false)
    printFields(_ViewInputs.self, isClassType: false)
    printFields(_ViewOutputs.self, isClassType: false)
    printFields(_RendererConfiguration.RasterizationOptions.self, isClassType: false)
    printFields(ContentSizedSceneFeature<GeometryMeasurer>.self, isClassType: false)
    printFields(ViewGraphGeometryObservers<GeometryMeasurer>.self, isClassType: false)
    printFields("7SwiftUI11DisplayListV11ViewUpdaterC", isClassType: true)
    printFields("7SwiftUI28AccessibilityGeometryUpdaterV", isClassType: false)
    printFields(PreferenceValues.self, isClassType: false)
    printFields(_ViewListOutputs.self, isClassType: false)
    printFields(ViewDimensions3D.self, isClassType: false)
    printFields("So15_UITypedStorageC", isClassType: true)
    printFields("7SwiftUI15UIViewResponderC", isClassType: true)
    printFields("5UIKit21_GlassBackgroundStyleO", isClassType: false)
    printFields("7SwiftUI22ModernNavigationBridgeC", isClassType: true)
    printFields("7SwiftUI17UIKitDialogBridgeC", isClassType: true)
    printFields("7SwiftUI22FileImportExportBridgeC", isClassType: true)
    printFields("7SwiftUI23ImmersiveSpaceAuthorityC", isClassType: true)
    printFields("7SwiftUI18UIKitPopoverBridgeC", isClassType: true)
    printFields("7SwiftUI27SharingActivityPickerBridgeC", isClassType: true)
    printFields("7SwiftUI24HostingControllerBridgesV", isClassType: false)
    printFields("7SwiftUI17CachedEnvironmentV", isClassType: false)
    printFields("7SwiftUI14FocusViewGraphV", isClassType: false)
    printFields("7SwiftUI11ViewGraph3DV", isClassType: false)
    printFields("7SwiftUI22AccessibilityViewGraphV", isClassType: false)
    printFields("7SwiftUI23AccessibilityAttachmentV", isClassType: false)
    printFields("7SwiftUI28AccessibilityAttachmentTokenO", isClassType: false)
    printFields("7SwiftUI27AnimatableFrameAttributeVFDV", isClassType: false)
    printFields("7SwiftUI33AccessibilityViewResponderUpdaterV", isClassType: false)
    printFields("7SwiftUI13ViewResponderC", isClassType: true)
    printFields("7SwiftUI26DefaultLayoutViewResponderC", isClassType: true)
    printFields("7SwiftUI12RootGeometryV", isClassType: false)
    printFields("7SwiftUI32_DisplayList_StableIdentityScopeV", isClassType: false)
    printFields("7SwiftUI12PropertyListV7ElementC", isClassType: true)
    printFields("7SwiftUI5ColorVAAE11ResolvedHDRV11_AnimatableV", isClassType: false)
    printFields("7SwiftUI11FocusBridgeC", isClassType: true)
    printFields("7SwiftUI11DisplayListV11ViewUpdaterC5ModelO13PlatformStateV", isClassType: false)
    printFields("7SwiftUI11DisplayListV11ViewUpdaterC5ModelO13PlatformStateV8VersionsV", isClassType: false)
    printFields("7SwiftUI11DisplayListV11ViewUpdaterC5ModelO5StateV8VersionsV", isClassType: false)
    printFields("7SwiftUI11DisplayListV11ViewUpdaterC0E5CacheV6ResultV", isClassType: false)
    printFields("7SwiftUI16FixedRoundedRectV", isClassType: false)
    printFields("7SwiftUI11DisplayListV11ViewUpdaterC5ModelO5StateV7GlobalsV", isClassType: false)
    printFields("7SwiftUI11DisplayListV11ViewUpdaterC08PlatformE4InfoV", isClassType: false)
    printFields("7SwiftUI11DisplayListV11ViewUpdaterC8PlatformV5StateV", isClassType: false)
    printFields("7SwiftUI11DisplayListV11ViewUpdaterC08PlatformE4InfoV5SeedsV", isClassType: false)
    printFields("7SwiftUI11DisplayListV5IndexV", isClassType: false)
    printFields("7SwiftUI11DisplayListV11ViewUpdaterC0E5CacheV3KeyV", isClassType: false)
    printFields("7SwiftUI12PropertyListV7TrackerC", isClassType: true)
    printFields("7SwiftUI11DisplayListV11ViewUpdaterC8PlatformV0G5StateV", isClassType: false)
    printFields("7SwiftUI23_SafeAreaInsetsModifierV", isClassType: false)
    printFields("7SwiftUI14SafeAreaInsetsV7ElementV", isClassType: false)
    printFields("7SwiftUI27DepthStashingLayoutComputerV6EngineV", isClassType: false)
    printFields("7SwiftUI27DepthStashingLayoutComputerV", isClassType: false)
    printFields("7SwiftUI18RootDepthTransformV", isClassType: false)
    printFields("7SwiftUI15_ProposedSize3DV", isClassType: false)
    printFields("7SwiftUI13_ProposedSizeV", isClassType: false)
    printFields("7SwiftUI24ObservationGraphMutationV", isClassType: false)
    printFields("7SwiftUI20IndirectAttributeMapC", isClassType: true)
    printFields("7SwiftUI24DynamicLayoutViewAdaptorV", isClassType: false)
    printFields("7SwiftUI18DynamicContainerIDV", isClassType: false)
    printFields("7SwiftUI16DynamicContainerV8ItemInfoC", isClassType: true)
    printFields("7SwiftUI17_ViewList_SublistV", isClassType: false)
    printFields("7SwiftUI12ViewGeometryV", isClassType: false)
    printFields("7SwiftUI14ViewDimensionsV", isClassType: false)
    printFields("7SwiftUI8ViewSizeV", isClassType: false)
    printFields("7SwiftUI16DynamicLayoutMapV", isClassType: false)
    printFields("7SwiftUI19DynamicViewListItemV", isClassType: false)
    printFields("7SwiftUI16DynamicContainerV8ItemInfoC", isClassType: true)
    printFields("7SwiftUI10ViewSize3DV", isClassType: false)
    printFields("7SwiftUI33PairwisePreferenceCombinerVisitorV", isClassType: false)
    printFields("7SwiftUI16AppearanceEffectV", isClassType: false)
    printFields("7SwiftUI16PreferenceBridgeC", isClassType: true)
    printFields("7SwiftUI13ToolbarBridgeCyAA05UIKitC8StrategyVG", isClassType: true)
    printFields("7SwiftUI11SheetBridgeCyAA0C10PreferenceV3KeyVG", isClassType: true)
    printFields("7SwiftUI19BarAppearanceBridgeC", isClassType: true)
    printFields("7SwiftUI14OrnamentBridgeCyAA5ColorVG", isClassType: true)
    printFields("7SwiftUI22KeyboardShortcutBridgeC", isClassType: true)
    printFields("7SwiftUI22MRUIPreferenceExporterC", isClassType: true)
    printFields("7SwiftUI18PencilEventsBridgeC", isClassType: true)
    printFields("7SwiftUI8AppGraphC", isClassType: true)
    printFields("7SwiftUI11AppDelegateC", isClassType: true)
    printFields("7SwiftUI23UIKitMainMenuControllerC", isClassType: true)
    printFields("7SwiftUI16AppSceneDelegateC", isClassType: true)
    printFields("7SwiftUI11SceneBridgeC", isClassType: true)
    printFields("7SwiftUI9SceneListV4ItemV", isClassType: false)
    printFields("7SwiftUI23ImmersiveSpaceAuthorityC", isClassType: true)
    printFields("7SwiftUI37ImmersiveSpaceConfigurationAttributesV", isClassType: false)
    printFields("7SwiftUI19UIHostingControllerCyAA15ModifiedContentVyAA7AnyViewVAA12RootModifierVGG", isClassType: true)
    printFields("7SwiftUI14_UIHostingViewCyAA15ModifiedContentVyAA03AnyD0VAA12RootModifierVGG", isClassType: true)
    printFields("7SwiftUI13FocusedValuesV", isClassType: false)
    printFields(ViewTransform.self, isClassType: false)
    printFields(AnimatableAttributeHelper<Double>.self, isClassType: false)
    printFields(EnvironmentValues.self, isClassType: false)
    printFields(DisplayList.self, isClassType: false)
    printFields(_UIHostingView<AnyView>.self, isClassType: true)
    printFields(UIHostingController<AnyView>.self, isClassType: true)
    printFields(GraphHost.self, isClassType: true)
    printFields(GraphHost.Data.self, isClassType: false)
    printFields(ViewGraphDisplayLink.self, isClassType: true)
    printFields(UIHostingViewBase.self, isClassType: true)
    printFields(ViewGraphHost.self, isClassType: true)
    printFields(ViewGraph.self, isClassType: true)
    printFields(ServerHitTest.self, isClassType: false)
    printFields(Update.Action.self, isClassType: false)
    printFields(CustomEventTrace.Recorder.self, isClassType: true)
    printFields(ColorView.self, isClassType: false)
    printFields(DisplayList.Item.self, isClassType: false)
    printFields(Image.DynamicRange.self, isClassType: false)
    printFields(ObjectCache<Int, Int>.self, isClassType: true)
    printFields(MultiViewResponder.self, isClassType: true)
    printFields(DynamicPropertyCache.Fields.self, isClassType: false)
    printFields(ObservationCenter.self, isClassType: true)
    printFields(ViewDimensions.self, isClassType: false)
    printFields(_ViewListInputs.self, isClassType: false)
    printFields(DynamicContainer.Info.self, isClassType: false)
    printFields(DynamicContainer.ItemInfo.self, isClassType: true)
    printFields(PlatformAccessibilitySettingsDefinition.self, isClassType: true)
    printFields(LayoutSubviews.self, isClassType: false)
    printFields(GeometryProxy.self, isClassType: false)
    printFields(_ViewList_Subgraph.self, isClassType: true)
    printFields(_ViewList_Group.self, isClassType: false)
    printFields(LayoutTrace.Recorder.self, isClassType: true)
    printFields(ResponderNode.self, isClassType: true)
    printFields(ViewResponder.self, isClassType: true)
    printFields(MultiViewResponder.self, isClassType: true)
    printFields(Text.Style.self, isClassType: false)
    printFields(_SceneInputs.self, isClassType: false)
    printFields(SizingPreferences.self, isClassType: false)
    
    print(_mangledTypeName(UIHostingController<AnyView>.self)!)
    print(NSStringFromClass(UIHostingController<AnyView>.self))
//    debugTextResolveExample()
}

fileprivate struct GeometryMeasurer: ViewGraphGeometryMeasurer {
    typealias Proposal = CGPoint
    typealias Size = CGSize
}

// Text.resolve example
private struct _DebugResolvedTextContainer: ResolvedTextContainer {
    var style: Text.Style {
        get { Text.Resolved().style }
        set {}
    }
    
    var properties: Text.ResolvedProperties {
        get { fatalError() }
        set { fatalError() }
    }
    
    var idiom: AnyInterfaceIdiom? { nil }
    
    mutating func append<S>(_ string: S, in environment: EnvironmentValues, with options: Text.ResolveOptions, isUniqueSizeVariant: Bool) where S : StringProtocol {
        fatalError()
    }
    
    mutating func append(_ attributedString: NSAttributedString, in environment: EnvironmentValues, with options: Text.ResolveOptions, isUniqueSizeVariant: Bool) {
        fatalError()
    }
    
    mutating func append(_ image: Image.Resolved, in environment: EnvironmentValues, with options: Text.ResolveOptions) {
        fatalError()
    }
    
    mutating func append<T>(resolvable: T, in environment: EnvironmentValues, with options: Text.ResolveOptions, transition: ContentTransition?) where T : ResolvableStringAttribute {
        fatalError()
    }
}

func debugTextResolveExample() {
    var container = _DebugResolvedTextContainer()
    Text("Hello Text.resolve").resolve(into: &container, in: .init(), with: [])
}

fileprivate struct DKey: DerivedEnvironmentKey {
    static func value(in environment: EnvironmentValues) -> Int {
        fatalError()
    }
}
