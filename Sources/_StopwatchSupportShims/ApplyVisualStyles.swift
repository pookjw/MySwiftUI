private import MySwiftUICore
private import _MySwiftUI

@safe private nonisolated(unsafe) var didAppliedVisualStyles = false

func applyVisualStyles() {
    guard !didAppliedVisualStyles else {
        return
    }
    
    _applyVisualStyles()
    didAppliedVisualStyles = true
}

private func _applyVisualStyles() {
    var overrides = ViewStyleOverrides()
    
    overrides.registerDefaultToggleStyleType(_StopwatchSupportShims.ToggleStyle.self)
    assertUnimplemented()
    /*
     // <+236>
     SwiftUI.ViewStyleOverrides.init()
     SwiftUI.ViewStyleOverrides.registerDefaultToggleStyleType<τ_0_0 where τ_0_0: SwiftUI.AnyDefaultStyle, τ_0_0: SwiftUI.ToggleStyle>(τ_0_0.Type) -> ()"
     
     // <+356>
     SwiftUI.SwitchToggleStyle
     SwiftUI.ViewStyleOverrides.registerStyleOverride<τ_0_0, τ_0_1 where τ_0_0: SwiftUI.AnyDefaultStyle, τ_0_0: SwiftUI.ToggleStyle, τ_0_1: SwiftUI.ToggleStyle>(_: τ_0_0.Type, for: τ_0_1.Type) -> ()
     
     __TtC16StopwatchSupport43StopwatchSupportSwitchVisualElementProvider
     [[UIWindow alloc] init]
     setVisualElementProvider:
     SwiftUI.AppStorage.wrappedValue.getter
     
     // <+548>
     SwiftUI.ViewStyleOverrides.registerDefaultButtonStyleType<τ_0_0 where τ_0_0: SwiftUI.AnyDefaultStyle, τ_0_0: SwiftUI.PrimitiveButtonStyle>(τ_0_0.Type) -> ()
     type metadata accessor for SwiftUI.BorderlessButtonStyle
     
     // <+696>
     SwiftUI.ViewStyleOverrides.registerStyleOverride<τ_0_0, τ_0_1 where τ_0_0: SwiftUI.AnyDefaultStyle, τ_0_0: SwiftUI.ButtonStyleConvertible, τ_0_0: SwiftUI.PrimitiveButtonStyle, τ_0_1: SwiftUI.ButtonStyleConvertible, τ_0_1: SwiftUI.PrimitiveButtonStyle, τ_0_0.SwiftUI.ButtonStyleConvertible.ButtonStyleRepresentation: SwiftUI.AnyDefaultStyle>(_: τ_0_0.Type, for: τ_0_1.Type) -> ()
     
     // <+708>
     type metadata accessor for SwiftUI.BorderedButtonStyle
     
     // <+856>
     SwiftUI.ViewStyleOverrides.registerStyleOverride<τ_0_0, τ_0_1 where τ_0_0: SwiftUI.AnyDefaultStyle, τ_0_0: SwiftUI.ButtonStyleConvertible, τ_0_0: SwiftUI.PrimitiveButtonStyle, τ_0_1: SwiftUI.ButtonStyleConvertible, τ_0_1: SwiftUI.PrimitiveButtonStyle, τ_0_0.SwiftUI.ButtonStyleConvertible.ButtonStyleRepresentation: SwiftUI.AnyDefaultStyle>(_: τ_0_0.Type, for: τ_0_1.Type) -> ()
     
     // <+868>
     type metadata accessor for SwiftUI.RealityLinkButtonStyle
     
     // <+956>
     SwiftUI.ViewStyleOverrides.registerStyleOverride<τ_0_0, τ_0_1 where τ_0_0: SwiftUI.AnyDefaultStyle, τ_0_0: SwiftUI.PrimitiveButtonStyle, τ_0_1: SwiftUI.PrimitiveButtonStyle>(_: τ_0_0.Type, for: τ_0_1.Type) -> ()
     
     // <+964>
     type metadata accessor for SwiftUI.BorderedProminentButtonStyle
     
     // <+1068>
     SwiftUI.ViewStyleOverrides.registerStyleOverride<τ_0_0, τ_0_1 where τ_0_0: SwiftUI.AnyDefaultStyle, τ_0_0: SwiftUI.ButtonStyleConvertible, τ_0_0: SwiftUI.PrimitiveButtonStyle, τ_0_1: SwiftUI.ButtonStyleConvertible, τ_0_1: SwiftUI.PrimitiveButtonStyle, τ_0_0.SwiftUI.ButtonStyleConvertible.ButtonStyleRepresentation: SwiftUI.AnyDefaultStyle>(_: τ_0_0.Type, for: τ_0_1.Type) -> ()
     
     // <+1080>
     type metadata accessor for SwiftUI.PlainButtonStyle
     
     // <+1220>
     SwiftUI.ViewStyleOverrides.registerStyleOverride<τ_0_0, τ_0_1 where τ_0_0: SwiftUI.AnyDefaultStyle, τ_0_0: SwiftUI.ButtonStyleConvertible, τ_0_0: SwiftUI.PrimitiveButtonStyle, τ_0_1: SwiftUI.ButtonStyleConvertible, τ_0_1: SwiftUI.PrimitiveButtonStyle, τ_0_0.SwiftUI.ButtonStyleConvertible.ButtonStyleRepresentation: SwiftUI.AnyDefaultStyle>(_: τ_0_0.Type, for: τ_0_1.Type) -> ()
     
     // <+1352>
     (조건)
     SwiftUI.ViewStyleOverrides.registerDefaultButtonBehaviorStyleType<τ_0_0 where τ_0_0: SwiftUI.AnyDefaultStyle, τ_0_0: SwiftUI.ButtonBehaviorStyle>(τ_0_0.Type) -> ()
     
     // <+1460>
     SwiftUI.ViewStyleOverrides.registerDefaultSliderStyleType<τ_0_0 where τ_0_0: SwiftUI.AnyDefaultStyle, τ_0_0: SwiftUI.SliderStyle>(τ_0_0.Type) -> ()
     
     // <+1608>
     SwiftUI.ViewStyleOverrides.registerDefaultStepperStyleType<τ_0_0 where τ_0_0: SwiftUI.AnyDefaultStyle, τ_0_0: SwiftUI.StepperStyle>(τ_0_0.Type) -> ()
     
     // <+1888>
     SwiftUI.ViewStyleOverrides.registerDefaultGroupBoxStyleType<τ_0_0 where τ_0_0: SwiftUI.AnyDefaultStyle, τ_0_0: SwiftUI.GroupBoxStyle>(τ_0_0.Type) -> ()
     
     // <+4528>
     SwiftUI.ViewStyleOverrides.registerDefaultHelpStyleType<τ_0_0 where τ_0_0: SwiftUI.AnyDefaultStyle, τ_0_0: SwiftUI.HelpStyle>(τ_0_0.Type) -> ()
     
     // <+5052>
     static SwiftUI.ViewStyleRegistry.InterfaceIdiom.vision.getter : SwiftUI.ViewStyleRegistry.InterfaceIdiom
     static SwiftUI.ViewStyleRegistry.registerOverrides(_: SwiftUI.ViewStyleOverrides, for: SwiftUI.ViewStyleRegistry.InterfaceIdiom) -> ()
     */
}
