// C9541C03AF81FECFD19A57A1BB81CE81
internal import AttributeGraph
internal import CoreGraphics
internal import MySwiftUICore

struct FeedbackRequestContext {
    private(set) var location: WeakAttribute<CGPoint>
    private(set) weak var cache: UIKitSensoryFeedbackCache?
    
    func implementation(type: SensoryFeedback.FeedbackType) -> PlatformSensoryFeedback? {
        assertUnimplemented()
    }
}

extension View {
    nonisolated func platformSensoryFeedback<T : SensoryFeedbackGeneratorModifier>(_ modifier: T) -> some View {
        return self.modifier(FeedbackRequestContextWriter(base: modifier))
    }
}

fileprivate struct FeedbackRequestContextWriter<T : SensoryFeedbackGeneratorModifier> : MultiViewModifier, PrimitiveViewModifier {
    @safe private(set) nonisolated(unsafe) var base: T
    
    nonisolated static func _makeView(modifier: _GraphValue<FeedbackRequestContextWriter<T>>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }
}

extension FeedbackRequestContextWriter {
    struct ChildModifier : Rule {
        @Attribute private(set) var base: T
        @Attribute private(set) var location: CGPoint
        private(set) weak var feedbackCache: UIKitSensoryFeedbackCache?
        
        var value: T {
            assertUnimplemented()
        }
    }
}
