// C9541C03AF81FECFD19A57A1BB81CE81
internal import AttributeGraph
internal import CoreGraphics
@_spi(Internal) internal import MySwiftUICore
private import RealityKit
internal import MRUIKit
private import _UIKitPrivate
internal import _UIKitShims

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
        guard
            let delegate = ViewGraph.current.delegate,
            let casted = delegate.as(SensoryFeedbackCacheHost.self)
        else {
            return body(_Graph(), inputs)
        }
        
        let cache = casted.feedbackCache
        let context = modifier[{ .of(&$0.base) }]
        let value = context.value
        
        let block: () -> Attribute<T> = {
            // $s7SwiftUI28FeedbackRequestContextWriter33_C9541C03AF81FECFD19A57A1BB81CE81LLV9_makeView8modifier6inputs4bodyAA01_P7OutputsVAA11_GraphValueVyADyxGG_AA01_P6InputsVAjA01_U0V_APtctFZ09AttributeU00X0VyxGyXEfU0_
            guard inputs.needsGeometry else {
                return value
            }
            
            let position: Attribute<CGPoint>
            let interfaceIdiom = inputs.base.interfaceIdiom
            
            if interfaceIdiom.accepts(.pad) || interfaceIdiom.accepts(.vision) {
                position = Attribute(
                    FeedbackLocation(position: inputs.position, size: inputs.size, transform: inputs.transform)
                )
            } else {
                position = ViewGraph.current.$zeroPoint
            }
            
            let modifier = FeedbackRequestContextWriter<T>.ChildModifier(
                base: value,
                location: position,
                feedbackCache: cache
            )
            
            return Attribute(modifier)
        }
        
        return T.makeDebuggableView(
            modifier: _GraphValue(block()),
            inputs: inputs,
            body: body
        )
    }
}

extension FeedbackRequestContextWriter {
    struct ChildModifier : Rule {
        @Attribute private(set) var base: T
        @Attribute private(set) var location: CGPoint
        private(set) weak var feedbackCache: UIKitSensoryFeedbackCache?
        
        var value: T {
            var base = self.base
            
            base.feedbackRequestContext = FeedbackRequestContext(
                location: WeakAttribute(self.$location),
                cache: self.feedbackCache
            )
            
            return base
        }
    }
}

fileprivate struct FeedbackLocation : Rule {
    @Attribute private(set) var position: CGPoint
    @Attribute private(set) var size: ViewSize
    @Attribute private(set) var transform: ViewTransform
    
    var value: CGPoint {
        assertUnimplemented()
    }
}

struct MRUIFeedbackImplementation : LocationBasedSensoryFeedback {
    private let generator: MRUIFeedbackGenerator
    private let type: MRUIFeedbackType
    private let separationReason: _UIViewSeparatedStateRequestReason
    private var hostingEntity: RealityKit::Entity?
    private var playbackEntity: AudioFeedbackEntity?
    
    init(generator: MRUIFeedbackGenerator, type: MRUIFeedbackType) {
        assertUnimplemented()
    }
    
    func setUp() {
        assertUnimplemented()
    }
    
    func tearDown() {
        assertUnimplemented()
    }
    
    func generate() {
        fatalError("Requires location.")
    }
    
    mutating func generate(location: CGPoint) {
        assertUnimplemented()
    }
    
    fileprivate func playbackEntity(for: CGPoint) -> AudioFeedbackEntity? {
        assertUnimplemented()
    }
}

struct ImpactFeedbackImplementation : LocationBasedSensoryFeedback {
    let generator: MyUIImpactFeedbackGenerator
    private(set) var intensity: Double
    
    func setUp() {
        assertUnimplemented()
    }
    
    func tearDown() {
        assertUnimplemented()
    }
    
    func generate() {
        fatalError("Requires location.")
    }
    
    mutating func generate(location: CGPoint) {
        assertUnimplemented()
    }
}

struct NotificationFeedbackImplementation : LocationBasedSensoryFeedback {
    let generator: MyUINotificationFeedbackGenerator
    let type: MyUINotificationFeedbackType
    
    func setUp() {
        assertUnimplemented()
    }
    
    func tearDown() {
        assertUnimplemented()
    }
    
    func generate() {
        fatalError("Requires location.")
    }
    
    mutating func generate(location: CGPoint) {
        assertUnimplemented()
    }
}

struct SelectionFeedbackImplementation : LocationBasedSensoryFeedback {
    let generator: MyUISelectionFeedbackGenerator
    
    func setUp() {
        assertUnimplemented()
    }
    
    func tearDown() {
        assertUnimplemented()
    }
    
    func generate() {
        fatalError("Requires location.")
    }
    
    mutating func generate(location: CGPoint) {
        assertUnimplemented()
    }
}

struct CanvasFeedbackImplementation : LocationBasedSensoryFeedback {
    let generator: MyUICanvasFeedbackGenerator
    let type: SensoryFeedback.FeedbackType
    
    func setUp() {
        assertUnimplemented()
    }
    
    func tearDown() {
        assertUnimplemented()
    }
    
    func generate() {
        fatalError("Requires location.")
    }
    
    mutating func generate(location: CGPoint) {
        assertUnimplemented()
    }
}
