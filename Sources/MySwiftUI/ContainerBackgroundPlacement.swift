public import MySwiftUICore

@available(iOS 17.0, tvOS 17.0, macOS 14.0, watchOS 10.0, *)
public struct ContainerBackgroundPlacement : Sendable, Hashable {
    private var storage: ContainerBackgroundPlacement.Storage
    
    @available(watchOS 10.0, *)
    @available(iOS, unavailable)
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(visionOS, unavailable)
    public static let tabView: ContainerBackgroundPlacement = {
        assertUnimplemented()
    }()
    
    @available(watchOS 10.0, iOS 18.0, *)
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(visionOS, unavailable)
    public static let navigation: ContainerBackgroundPlacement = {
        assertUnimplemented()
    }()
    
    @available(watchOS 11.0, iOS 18.0, *)
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(visionOS, unavailable)
    public static let navigationSplitView: ContainerBackgroundPlacement = {
        assertUnimplemented()
    }()
    
    @available(macOS 15.0, *)
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(visionOS, unavailable)
    @available(watchOS, unavailable)
    public static let window: ContainerBackgroundPlacement = {
        assertUnimplemented()
    }()
}

extension ContainerBackgroundPlacement {
    enum Storage : Sendable, Hashable {
//        case custom(ContainerBackgroundKeys.AnyCustomKey)
//        case builtin(ContainerBackgroundKind.Builtin)
    }
}

extension View {
    @available(iOS 17.0, tvOS 17.0, macOS 14.0, watchOS 10.0, *)
    nonisolated public func containerBackground<S>(_ style: S, for container: ContainerBackgroundPlacement) -> some View where S : ShapeStyle {
        assertUnimplemented()
    }
    
    @available(iOS 17.0, tvOS 17.0, macOS 14.0, watchOS 10.0, *)
    nonisolated public func containerBackground<V>(for container: ContainerBackgroundPlacement, alignment: Alignment = .center, @ViewBuilder content: () -> V) -> some View where V : View {
        assertUnimplemented()
    }
}

extension View {
    func renderContainerBackgroundInHostingView<T : ContainerBackgroundPlacementKey>(_: T.Type) -> some View {
        self.backgroundPreferenceValue(
            T.self,
            alignment: .center
        ) { value in
            // $s7SwiftUI4ViewPAAE034renderContainerBackgroundInHostingC0yQrqd__mAA0eF12PlacementKeyRd__lFAA19_ConditionalContentVyAcAE10preference3key5valueQrqd__m_5ValueQyd__tAA010PreferenceJ0Rd__lFQOyAcAE15ignoresSafeArea_5edgesQrAA0sT7RegionsV_AA4EdgeO3SetVtFQOyAA03AnyC0V_Qo__AA0eF4KeysO16HostTransparencyVQo_AA05EmptyC0VGAA0efP0VcfU_
            assertUnimplemented()
        }
    }
}

protocol ContainerBackgroundPlacementKey : PreferenceKey {
    static var placement: ContainerBackgroundPlacement {
        get
    }
}
