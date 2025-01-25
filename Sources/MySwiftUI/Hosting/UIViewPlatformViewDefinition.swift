import MySwiftUICore

#warning("TODO")

// SwiftUI View (UIViewRepresentable 아님)을 생성할 때 $s7SwiftUI28UIViewPlatformViewDefinitionC04makeE04kindyXlAA0deF0C0E4KindO_tFZ이 불릴 것

final class UIViewPlatformViewDefinition: PlatformViewDefinition, @unchecked Sendable {
    override class var system: PlatformViewDefinition.System {
        .uiView
    }
}
