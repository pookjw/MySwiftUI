// 587BE5026F01C2416D8EB2E1012BACCA
private import Foundation
internal import Combine
internal import Spatial
private import Observation
internal import UIKit

@Observable
final class _RealityViewModel {
    @ObservationIgnored var content: RealityViewContent
    @ObservationIgnored var relativeTransformObservers: [NSObject]
    @ObservationIgnored var isObservingRelativeTransform: Bool
    @ObservationIgnored var transformInteractionComponentWasAdded: (any Cancellable)?
    
    var useNewMakeClosureBehavior: Bool {
        assertUnimplemented()
    }
    
    var idealSize: Size3D?
    var loadingPhase: _RealityViewModel.LoadingPhase
    var hasTransformInteractionComponents: Bool
    
    init() {
        assertUnimplemented()
    }
    
    func setSceneToImmersiveSpaceTransform(using windowScene: UIWindowScene) {
        assertUnimplemented()
    }
}

extension _RealityViewModel {
    enum LoadingPhase : Hashable {
        case empty
        case loading
        case loaded
        case connected
    }
}
