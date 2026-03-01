internal import _UIKitPrivate
#if SwiftUICompataibility
internal import SwiftUI
#else
internal import MySwiftUICore
#endif

extension _UIUserInterfaceContainerVibrancy {
#if SwiftUICompataibility
    typealias ResolvedMaterial = SwiftUI.Material
#else
    typealias ResolvedMaterial = MySwiftUICore.Material
#endif
    
    init(material: ResolvedMaterial?) {
        // material -> x0 -> x19
        // x20
        guard let copy_1 = material else {
            self = .unspecified
            return
        }
        
        // <+320>
        switch copy_1.id {
        case .coreMaterial(_, _, _):
            self = .unspecified
        case .provider(_):
            self = .unspecified
        case .layers(_):
            self = .unspecified
        case .ultraThin:
            self = .lighterGlass
        case .thin:
            self = .lighterGlass
        case .regular:
            self = .darkerGlass
        case .thick:
            self = .ultraDarkerGlass
        case .ultraThick:
            self = .ultraDarkerGlass
        case .systemBars:
            self = .unspecified
        case .intelligenceLightSource_Unreactive:
            self = .unspecified
        case .intelligenceLightSource_AudioReactive:
            self = .unspecified
        case .pinched:
            self = .lighterGlass
        case .selected:
            self = .lighterGlass
        case .disabled:
            self = .darkerGlass
        case .vibrantGlassContent:
            self = .unspecified
        case .darkerGlass:
            self = .darkerGlass
        case .lighterGlass:
            self = .lighterGlass
        case .ultraDarkerGlass:
            self = .ultraDarkerGlass
        @unknown default:
            fatalError()
        }
    }
}
