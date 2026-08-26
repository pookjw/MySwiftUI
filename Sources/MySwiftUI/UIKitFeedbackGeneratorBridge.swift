@_spi(Internal) internal import MySwiftUICore
private import RealityKit
internal import _UIKitPrivate
private import MRUIKit
private import CoreRE
private import _RealityFoundationPrivate

@MainActor
class UIKitFeedbackGeneratorBridge<Content : View> {
    weak var host: _UIHostingView<Content>? = nil {
        didSet {
            /*
             self -> x20
             oldValue -> x0 -> x19
             */
            guard self.host != oldValue else {
                return
            }
            
            if let oldValue {
                oldValue._request(.none, withReason: .audioFeedback)
            }
            
            // <+88>
            if let host {
                host._request(.tracked, withReason: .audioFeedback)
            }
            
            if
                let layer = self.host?.layer,
                let component = RECALayerGetCALayerClientComponent(layer)
            {
                let reEntity = component.entity
                let entity = unsafe RealityKit::Entity.fromCore(
                    unsafeBitCast(reEntity, to: OpaquePointer.self),
                    ignoringEntityInfo: false
                )
                
                self.hostingEntity = entity
            } else {
                self.hostingEntity = nil
            }
        }
    }
    
    private var hostingEntity: RealityKit::Entity? = nil
    private var activeEntities: [ViewIdentity: AudioFeedbackEntity] = [:]
    private var processedFeedbackSeeds: Set<FeedbackRequest.Seed> = []
    private var feedbackSeed = VersionSeed.empty
    
    func addPreferences(to viewGraph: ViewGraph) {
        viewGraph.addPreference(FeedbackRequest.PreferenceKey.self)
    }
    
    @MainActor final func preferencesDidChange(_ preferenceValues: PreferenceValues) {
        // x23 / x19 + 0x10
        let pref = preferenceValues[FeedbackRequest.PreferenceKey.self]
        
        guard !feedbackSeed.matches(pref.seed) else {
            return
        }
        
        // x23 / x19 + 0x28
        guard let host else {
            return
        }
        
        self.feedbackSeed = pref.seed
        
        // x19 + 0x30~0x48 (pointsPerMeter, 0, 0, 0)
        let pointsPerMeter = host.traitCollection._pointsPerMeter()
        
        for (identity, value) in pref.value {
            do {
                // value.0 = d13, d8, d15
                let entity = self.entity(for: identity, logPrefix: "\(identity)")
                // <+1432>
                let b1 = host.bounds
                let d14 = b1.origin.x + b1.width * 0.5
                let d9 = value.0.width - d14
                let d10 = host.bounds.maxY
                let b2 = host.bounds
                
                let d1 = d10 - b2.origin.y + b2.height * 0.5 - value.0.height
                let d0 = d9
                let size = Size3D(width: d0, height: d1, depth: value.0.depth)
                
                entity.position = SIMD3<Float>(
                    Float(size.width / pointsPerMeter),
                    Float(size.height / pointsPerMeter),
                    Float(size.depth / pointsPerMeter)
                )
                Log.log("Positioning entity \(entity.id) at \(entity.position)")
                
                for request in value.1 {
                    if !processedFeedbackSeeds.contains(request.seed) {
                        Log.log("Starting playback of `\(request.feedbackType)`")
                        processedFeedbackSeeds.insert(request.seed)
                        
                        guard let name = _MRUICadenzaNameForFeedback(request.feedbackType.mruiFeedbackType) else {
                            continue
                        }
                        
                        guard let feedback = _UIFeedback(dictionaryRepresentation: ["name": name, "type": "custom"]) else {
                            continue
                        }
                        
                        unsafe feedback.entityRef = unsafe entity.__coreEntity.__as(CoreRE::Entity.self)
                        feedback.play()
                    }
                }
            }
        }
    }
    
    private func entity(for: ViewIdentity, logPrefix: String) -> AudioFeedbackEntity {
        assertUnimplemented()
    }
}

extension _UIViewSeparatedStateRequestReason {
    static let audioFeedback = _UIViewSeparatedStateRequestReason(rawValue: "SwiftUI.AudioFeedback")
}
