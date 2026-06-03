// 0D3243EDC3DD4D641848661DCC354D4B
internal import MySwiftUICore

struct AccessibilityCustomSectionHeaderStyling : ViewInputBoolFlag {
}

struct AccessibilitySectionHeaderModifier<T : View> : AccessibilityConfigurationModifier {
    var configuration: Never {
        assertUnimplemented()
    }
    
    func body(content: T) -> some View {
        content
            .staticIf(
                AccessibilityCustomSectionHeaderStyling(),
                then: { incoming in
                    incoming
                },
                else: { incoming in
                    // $s7SwiftUI34AccessibilitySectionHeaderModifierV4body7contentQrx_tFAA15ModifiedContentVyxAC05ChildF033_0D3243EDC3DD4D641848661DCC354D4BLLVyx_GGyXEfU0_AA0D18StyleConfigurationV0E0V_TG5TA
                    incoming
                        .modifier(
                            AccessibilitySectionHeaderModifier<T>
                                .ChildModifier(
                                    traits: AccessibilityTraitSet(trait: .isHeader)
                                )
                        )
                }
            )
    }
}

extension AccessibilitySectionHeaderModifier {
    fileprivate struct ChildModifier : AccessibilityViewModifier {
        static var options: AccessibilityModifierOptions {
            return []
        }
        
        func willCreateNode(for nodes: [AccessibilityNode]) -> Bool {
            return false
        }
        
        func initialAttachment(for nodes: [AccessibilityNode]) -> AccessibilityAttachment {
            assertUnimplemented()
        }
        
        func createOrUpdateNode(viewRendererHost: (any ViewRendererHost)?, existingNode: AccessibilityNode?) -> AccessibilityNode {
            assertUnimplemented()
        }
        
        func scrapeableContent(environment: EnvironmentValues, idiom: AnyInterfaceIdiom) -> ScrapeableContent.Content? {
            assertUnimplemented()
        }
        
        static func makeAccessibilityViewModifier(modifier: _GraphValue<AccessibilitySectionHeaderModifier<T>.ChildModifier>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
            return body(_Graph(), inputs)
        }
        
        var supportsPlaceholders: Bool {
            return false
        }
        
        private(set) var traits: AccessibilityTraitSet
    }
}

@MainActor protocol AccessibilityConfigurationModifier {
    associatedtype Configuration
    associatedtype Body
    associatedtype Content
    
    var configuration: Self.Configuration {
        get
    }
    
    func body(content: Self.Content) -> Self.Body
}
