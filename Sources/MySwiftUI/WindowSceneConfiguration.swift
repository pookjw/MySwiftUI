// D768E85BAB32225B51C51D533DE88E6B
internal import MySwiftUICore
internal import Foundation
internal import UIKit
internal import MRUIKit

struct WindowSceneConfiguration<T : WindowSceneConfigurationAttributes> {
    var attributes: T
    private(set) var mainContent: AnyView
    private(set) var title: Text?
    private(set) var presentationDataType: Any.Type?
    private(set) var decoder: ((Data) -> AnyHashable?)?
    
    func sceneListValue() -> SceneList.Item.Value {
        return attributes.sceneListValue(self)
    }
}

struct WindowGroupConfigurationAttributes : WindowSceneConfigurationAttributes {
    typealias RootModifier = Never // TODO
    
    func sceneListValue(_ configuration: WindowSceneConfiguration<WindowGroupConfigurationAttributes>) -> SceneList.Item.Value {
        return .windowGroup(configuration)
    }
    
    var rootModifier: Never {
        assertUnimplemented()
    }
    
    private(set) var suppressGlassBackground: Bool
}

struct ImmersiveSpaceConfigurationAttributes : WindowSceneConfigurationAttributes {
    static func validatedImmersionStyleOptions(
        selection: Binding<ImmersionStyle>?,
        allowed: [any ImmersionStyle]?,
        supported: [any ImmersionStyle]?
    ) -> (ImmersionStyle, [any ImmersionStyle]) {
        /*
         selection -> x0/x1 -> x27/x24
         allowed -> x2 -> x23
         supported -> x3 -> x25
         */
        // <+192>
        guard
            let supported,
            let firstSupported = supported.first // x29 - 0x88
        else {
            // $s7SwiftUI37ImmersiveSpaceConfigurationAttributesV30validatedImmersionStyleOptions9selection7allowed9supportedAA0hI0_p_SayAaH_pGtAA7BindingVyAaH_pGSg_AISgANtFZSSyXEfu_
            preconditionFailure("The ImmersiveSpaceContent implementation should define at least one supported immersion style.")
        }
        
        // <+208>
        // x23
        let _allowed: [any ImmersionStyle]
        if let allowed {
            if allowed.isEmpty {
                // <+336>
                Log.immersiveSpace.log(level: .error, "The defined list of allowed immersion styles should have at least one immersion style. The default immersion style will be used.")
                // <+448>
                _allowed = [firstSupported]
            } else {
                // <+232>
                // <+548>
                _allowed = allowed
            }
        } else {
            // <+244>
            _allowed = [AutomaticImmersionStyle()]
            // <+548>
        }
        
        // <+548>
        // x29 - 0x90
        var resolvedStyles: Set<_ResolvedImmersionStyle> = []
        if isLinkedOnOrAfter(.v7) {
            // <+576>
            for style in _allowed {
                let inserted = resolvedStyles.insert(style._resolved()).inserted
                if !inserted {
                    // <+724>
                    Log.immersiveSpace.log(level: .error, "The defined list of allowed immersion styles contains duplicates. Which one of the duplicate styles will be used is undefined.")
                    break
                }
            }
        }
        
        // <+872>
        // x19 + 0xb8
        let copy_1 = selection
        // x29 - 0xd0
        let _selection: Binding<any ImmersionStyle>
        if let copy_1 {
            // <+900>
            _selection = copy_1
            // <+1016>
        } else {
            // <+932>
            _selection = .constant(AutomaticImmersionStyle())
            // <+1016>
        }
        
        // <+1016>
        var selectedStyle = _selection.wrappedValue
        var contains = ImmersiveSpaceConfigurationAttributes.immersionStyles(_allowed, contains: selectedStyle)
        
        if !contains {
            // <+1084>
            // x21/x27
            let description = ImmersiveSpaceConfigurationAttributes.immersionStyleListDescription(styles: _allowed)
            
            Log.immersiveSpace.log(level: .error, "Unable to configure an immersive space with selected style '\(_typeName(type(of: selectedStyle), qualified: false))' since it is not in the list of allowed styles defined for this immersive space: \(description). The first allowed immersion style will be used.")
            
            // <+1504>
            selectedStyle = _allowed.first!
            // <+1584>
        } else {
            // <+1584>
        }
        
        // <+1584>
        contains = ImmersiveSpaceConfigurationAttributes.immersionStyles(supported, contains: selectedStyle)
        
        if contains {
            // <+1620>
            // <+2172>
        } else {
            // <+1680>
            let description = ImmersiveSpaceConfigurationAttributes.immersionStyleListDescription(styles: supported)
            Log.immersiveSpace.log(level: .error, "Unable to configure an immersive space with selected style '\(_typeName(type(of: selectedStyle), qualified: false))' since it is not in the list of supported styles for this type of content: \(description). The default immersion style will be used.")
            
            // <+2076>
            selectedStyle = firstSupported
        }
        
        // <+2172>
        return (selectedStyle, _allowed)
    }
    
    fileprivate static func immersionStyles(_ styles: [ImmersionStyle], contains: any ImmersionStyle) -> Bool {
        for style in styles {
            if style._resolved().initialImmersionLevel == contains._resolved().initialImmersionLevel {
                return true
            }
        }
        
        return false
    }
    
    fileprivate static func immersionStyleListDescription(styles: [ImmersionStyle]) -> String {
        assertUnimplemented()
    }
    
    private(set) var sceneSessionRole: UISceneSession.Role // 0x0
    private(set) var sceneWindowType: UIWindow.Type // 0x8
    private(set) var activationBehavior: ImmersiveSpaceActivationBehavior.Storage = .automatic // 0x10
    private(set) var supportedImmersionStyles: [any ImmersionStyle]? = nil // 0x18
    var allowedImmersionStyles: [any ImmersionStyle]? = nil // 0x20
    var preferredUpperLimbVisibility: UpperLimbVisibility? = nil // 0x28
    var immersionStyleSelection: Binding<any ImmersionStyle>? = nil // 0x30
    var sceneUpdateTransitionAnimation: ImmersiveSpaceSceneUpdateTransition? = nil // 0x68
    var immersiveContentBrightness: ImmersiveContentBrightness? = nil // 0x78
    var immersiveEnvironmentBehavior: ImmersiveEnvironmentBehavior.Storage = .automatic // 0x82
    private(set) var orderOutSceneSessionIdentifiersProvider: () -> Set<String> = {
        // $s7SwiftUI37ImmersiveSpaceConfigurationAttributesV39orderOutSceneSessionIdentifiersProviderShySSGycvpfiAEycfU_
        return []
    } // 0x88
    
    typealias RootModifier = ViewInputFlagModifier<IsInVolumetricContext>
    
    init<Data, Content>(
        from content: PresentedContent<Data, PresentedImmersiveSpaceContent<Content>>
    ) where Data : Decodable, Data : Encodable, Data : Hashable, Content : ImmersiveSpaceContent {
        // <+180>
        let supportedImmersionStyles: [ImmersionStyle]
        let role: UISceneSession.Role
        let windowType: UIWindow.Type
        
        if Content._determineHasCompositorContent() {
            // <+200>
            // x25 -> x29 - 0xb0
            let immersiveSpaceContent = content.immersiveSpaceContent()
            // x29 - 0x80 -> x29 - 0xa8
            let compositorContent = immersiveSpaceContent._determinePrimitiveCompositorContent()
            supportedImmersionStyles = compositorContent!._makeSupportedImmersionStyles()
            role = compositorContent!._makeSceneSessionRole()
            windowType = compositorContent!._makeSceneWindowType()
            // <+760>
        } else {
            // <+616>
            supportedImmersionStyles = Content._determineSupportedImmersionStyles()
            role = Content._determineSceneSessionRole()
            windowType = Content._determineSceneWindowType()
            // <+760>
        }
        
        // <+760>
        self.sceneSessionRole = role
        self.sceneWindowType = windowType
        self.activationBehavior = .automatic
        self.supportedImmersionStyles = supportedImmersionStyles
        self.allowedImmersionStyles = nil
        self.preferredUpperLimbVisibility = nil
        self.immersionStyleSelection = nil
        self.sceneUpdateTransitionAnimation = nil
        self.immersiveContentBrightness = nil
        self.immersiveEnvironmentBehavior = .automatic
        self.orderOutSceneSessionIdentifiersProvider = {
            // $s7SwiftUI37ImmersiveSpaceConfigurationAttributesV39orderOutSceneSessionIdentifiersProviderShySSGycvpfiAEycfU_
            return []
        }
    }
    
    func sceneListValue(_ configuration: WindowSceneConfiguration<ImmersiveSpaceConfigurationAttributes>) -> SceneList.Item.Value {
        return .immersiveSpace(configuration)
    }
    
    var rootModifier: ViewInputFlagModifier<IsInVolumetricContext> {
        return ViewInputFlagModifier(flag: IsInVolumetricContext())
    }
    
    func customizeSceneActivationRequestOptions(_ options: _MRUIImmersiveSpaceSceneActivationRequestOptions, isInternalScene: Bool) {
        /*
         options -> x0 -> x24
         isInternalScene -> w1 -> w25
         */
        options._isInternal = true
        options.mrui_requestInternalScene = isInternalScene
        
        // x29 - 0xe0
        let clientOptions = self.clientOptions()
        
        let immersiveEnvironmentBehavior: MRUIImmersiveEnvironmentBehavior
        switch clientOptions.environmentBehavior {
        case .automatic:
            immersiveEnvironmentBehavior = .`default`
        case .hide:
            immersiveEnvironmentBehavior = .hide
        case .coexist:
            immersiveEnvironmentBehavior = .coexist
        }
        options.immersiveEnvironmentBehavior = immersiveEnvironmentBehavior
        
        if let contentBrightness = clientOptions.contentBrightness {
            options.contentBrightness = contentBrightness
        }
        
        options._backgroundedSceneSessionPersistentIdentifiers = clientOptions.backgroundedSceneSessionPersistentIdentifiers
        options.initialImmersionStyle = immersionStyleForImmersionStyle(clientOptions.selectedStyle)
        
        var allowedStyles: MRUIImmersionStyle = []
        for style in clientOptions.allowedStyles {
            let _style = immersionStyleForImmersionStyle(style)
            allowedStyles.formUnion(_style)
        }
        options.allowedImmersionStyles = allowedStyles
        
        // <+372>
        if let minimumAmount = clientOptions.minimumAmount {
            options.minimumAmountOfImmersion = minimumAmount
        }
        
        if let maximumAmount = clientOptions.maximumAmount {
            options.maximumAmountOfImmersion = maximumAmount
        }
        
        if let initialAmount = clientOptions.initialAmount {
            options.initialAmountOfImmersion = initialAmount
        }
        
        // <+444>
        let shape: MRUIImmersionShape
        switch clientOptions.aspectRatio {
        case .automatic:
            shape = .automatic
        case .landscape:
            shape = .landscape
        case .portrait:
            shape = .portrait
        case .spatialSafari:
            shape = .spatialSafari
        case nil:
            shape = .automatic
        default:
            shape = .automatic
        }
        options.shape = shape
        
        Log.immersiveSpace.log(level: .debug, "Customizing scene activation request. \(clientOptions.description), isInternalScene: \(isInternalScene)")
    }
    
    func clientOptions() -> ImmersiveSpaceConfigurationAttributes.ClientOptions {
        /*
         self -> x20 -> x21
         return pointer -> x8 -> x19
         */
        let (selectedStyle, allowedStyles) = ImmersiveSpaceConfigurationAttributes.validatedImmersionStyleOptions(
            selection: self.immersionStyleSelection,
            allowed: self.allowedImmersionStyles,
            supported: self.supportedImmersionStyles
        )
        
        let contentBrightness: CGFloat?
        if let value = self.immersiveContentBrightness?.value ?? nil {
            contentBrightness = value
        } else {
            contentBrightness = nil
        }
        
        return ImmersiveSpaceConfigurationAttributes.ClientOptions(
            selectedStyle: selectedStyle,
            allowedStyles: allowedStyles,
            minimumAmount: nil,
            maximumAmount: nil,
            initialAmount: nil,
            aspectRatio: nil,
            contentBrightness: contentBrightness,
            environmentBehavior: self.immersiveEnvironmentBehavior,
            backgroundedSceneSessionPersistentIdentifiers: self.orderOutSceneSessionIdentifiersProvider(),
            sceneUpdateTransitionAnimation: self.sceneUpdateTransitionAnimation
        )
    }
    
    // TODO
}

extension ImmersiveSpaceConfigurationAttributes {
    struct ClientOptions : CustomStringConvertible {
        private(set) var selectedStyle: any ImmersionStyle // 0x0
        fileprivate private(set) var allowedStyles: [any ImmersionStyle] // 0x28
        fileprivate private(set) var minimumAmount: Double? // 0x30
        fileprivate private(set) var maximumAmount: Double? // 0x40
        fileprivate private(set) var initialAmount: Double? // 0x50
        fileprivate private(set) var aspectRatio: ProgressiveImmersionAspectRatio? // 0x59
        fileprivate private(set) var contentBrightness: CGFloat? // 0x60
        fileprivate private(set) var environmentBehavior: ImmersiveEnvironmentBehavior.Storage // 0x69
        fileprivate private(set) var backgroundedSceneSessionPersistentIdentifiers: Set<String>? // 0x70
        fileprivate private(set) var sceneUpdateTransitionAnimation: ImmersiveSpaceSceneUpdateTransition? // 0x80
        
        var description: String {
            let selectedStyleDescription = "selectedStyle: \(self.selectedStyleDescription)"
            
            var array: [String] = []
            array.append(selectedStyleDescription)
            
            let allowedStylesDescription = "allowedStyles: \(self.immersionStyleListDescription(styles: self.allowedStyles))"
            array.append(allowedStylesDescription)
            
            // 앞에 ( 빠진건 오타가 아님 원래 이럼
            let environmentBehaviorDescription = "environmentBehavior: \(self.environmentBehavior.description))"
            array.append(environmentBehaviorDescription)
            
            if let contentBrightness {
                let contentBrightnessDescription = "contentBrightness: \(contentBrightness.description)"
                array.append(contentBrightnessDescription)
            }
            
            // <+656>
            if let backgroundedSceneSessionPersistentIdentifiers {
                let backgroundedSceneSessionPersistentIdentifiersDescription = "backgroundedSceneSessionPersistentIdentifiers: \(backgroundedSceneSessionPersistentIdentifiers.description)"
                array.append(backgroundedSceneSessionPersistentIdentifiersDescription)
            }
            
            if let sceneUpdateTransitionAnimation {
                let sceneUpdateTransitionAnimationDescription = "sceneUpdateTransitionAnimation: (\(sceneUpdateTransitionAnimation.description))"
                array.append(sceneUpdateTransitionAnimationDescription)
            }
            
            return array.joined(separator: ", ")
        }
        
        var selectedStyleDescription: String {
            var result = _typeName(type(of: self.selectedStyle), qualified: false)
            
            if let casted = self.selectedStyle as? ProgressiveImmersionStyle {
                var array: [String] = []
                
                if let minimum = casted.minimumImmersionAmount {
                    let description = "minimum: \(minimum)"
                    array.append(description)
                }
                
                if let maximum = casted.maximumImmersionAmount {
                    let description = "maximum: \(maximum)"
                    array.append(description)
                }
                
                if let initial = casted.initialImmersionAmount {
                    let description = "initial: \(initial)"
                    array.append(description)
                }
                
                let shouldJoin: Bool
                if let aspectRatio {
                    // <+632>
                    let value: String
                    switch aspectRatio {
                    case .automatic:
                        value = "automatic"
                    case .landscape:
                        value = "landscape"
                    case .portrait:
                        value = "portrait"
                    case .spatialSafari:
                        value = "spatialSafari"
                    default:
                        value = "spatialSafari"
                    }
                    
                    let description = "aspectRatio: \(value)"
                    array.append(description)
                    shouldJoin = true
                } else {
                    shouldJoin = !array.isEmpty
                }
                
                if shouldJoin {
                    // <+864>
                    let joined = array.joined(separator: ", ")
                    result.append(" (")
                    result.append(joined)
                    result.append(") ")
                }
            }
            
            return result
        }
        
        fileprivate func immersionStyleListDescription(styles: [ImmersionStyle]) -> String {
            var array: [String] = []
            
            for style in styles {
                array.append("'\(_typeName(type(of: style), qualified: false))'")
            }
            
            return array.joined(separator: ", ")
        }
        
        // TODO
    }
}

struct VolumeConfigurationAttributes : WindowSceneConfigurationAttributes {
    typealias RootModifier = ViewInputFlagModifier<IsInVolumetricContext> // TODO
    
    func sceneListValue(_ configuration: WindowSceneConfiguration<VolumeConfigurationAttributes>) -> SceneList.Item.Value {
        return .volume(configuration)
    }
    
    var rootModifier: ViewInputFlagModifier<IsInVolumetricContext> {
        return ViewInputFlagModifier(flag: IsInVolumetricContext())
    }
}

struct IdentifiedDocumentGroupConfiguration {
    // TODO
}

struct MenuBarExtraConfiguration {
    // TODO
}

struct UISceneAdaptorConfiguration {
    let id: SceneID
    let kind: UISceneAdaptorConfiguration.Kind
    let content: AnyView
    // TODO
}

extension UISceneAdaptorConfiguration {
    enum Kind : Equatable {
        case custom(String)
        case carPlay
        case assistiveAccess
        case externalDisplay
    }
}

struct SingleWindowConfigurationAttributes : WindowSceneConfigurationAttributes {
    typealias RootModifier = Never // TODO
    
    func sceneListValue(_ configuration: WindowSceneConfiguration<SingleWindowConfigurationAttributes>) -> SceneList.Item.Value {
        assertUnimplemented()
    }
    
    var rootModifier: Never {
        assertUnimplemented()
    }
    
    // TODO
}

struct DocumentIntroductionConfiguration {
    // TODO
}

struct DialogConfiguration {
    // TODO
}

protocol WindowSceneConfigurationAttributes {
    associatedtype RootModifier
    
    func sceneListValue(_ configuration: WindowSceneConfiguration<Self>) -> SceneList.Item.Value
    var rootModifier: Self.RootModifier { get }
}

struct IsInVolumetricContext: ViewInputBoolFlag {
}

struct IsInImmersiveContext: ViewInputBoolFlag {
}

extension ImmersiveSpaceContent {
    @_transparent // 원래 없음
    private static var resolvedRrimitiveImmersiveSpaceContentType: any PrimitiveImmersiveSpaceContent.Type {
        let casted: any PrimitiveImmersiveSpaceContent.Type
        if let _casted = self as? PrimitiveImmersiveSpaceContent.Type {
            casted = _casted
        } else {
            var body: (any ImmersiveSpaceContent.Type) = self.Body
            while true {
                if let _casted = body as? PrimitiveImmersiveSpaceContent.Type {
                    casted = _casted
                    break
                } else {
                    func project<T: ImmersiveSpaceContent>(_ type: T.Type) -> T.Body.Type {
                        return type.Body
                    }
                    body = project(body)
                }
            }
        }
        
        return casted
    }
    
    @_transparent // 원래 없음
    private var resolvedRrimitiveImmersiveSpaceContent: any PrimitiveImmersiveSpaceContent {
        let casted: any PrimitiveImmersiveSpaceContent
        if let _casted = self as? PrimitiveImmersiveSpaceContent {
            casted = _casted
        } else {
            var body: (any ImmersiveSpaceContent) = self.body
            while true {
                if let _casted = body as? PrimitiveImmersiveSpaceContent {
                    casted = _casted
                    break
                } else {
                    body = self.body
                }
            }
        }
        
        return casted
    }
    
    nonisolated static func _determineHasCompositorContent() -> Bool {
        return resolvedRrimitiveImmersiveSpaceContentType._hasCompositorContent()
    }
    
    nonisolated func _determinePrimitiveCompositorContent() -> PrimitiveCompositorContent? {
        assertUnimplemented()
    }
    
    nonisolated static func _determineSupportedImmersionStyles() -> [ImmersionStyle] {
        let styles = resolvedRrimitiveImmersiveSpaceContentType._makeSupportedImmersionStyles()
        precondition(
            !styles.isEmpty, // $s7SwiftUI21ImmersiveSpaceContentPAAE34_determineSupportedImmersionStylesSayAA0H5Style_pGyFZSbyXEfu_TA
            "Content should define at least one supported immersion style."
        )
        return styles
    }
    
    nonisolated static func _determineSceneSessionRole() -> UISceneSession.Role {
        return resolvedRrimitiveImmersiveSpaceContentType._makeSceneSessionRole()
    }
    
    nonisolated static func _determineSceneWindowType() -> UIWindow.Type {
        return resolvedRrimitiveImmersiveSpaceContentType._makeSceneWindowType()
    }
    
    func _determineView() -> AnyView {
        return resolvedRrimitiveImmersiveSpaceContent._makeView()
    }
}
