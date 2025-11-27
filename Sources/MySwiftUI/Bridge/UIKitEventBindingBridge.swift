#warning("TODO")
@_spi(Internal) internal import MySwiftUICore
internal import UIKit
private import _UIKitPrivate

final class UIKitEventBindingBridge: EventBindingBridge {
    private(set) var gestureRecognizer: UIKitGestureRecognizer? = nil
    private(set) var hoverGestureRecognizer: UIKitHoverGestureRecognizer
    private(set) var keyPressResponder: UIKitKeyPressResponder? = nil
    
    @MainActor
    override init(eventBindingManager: EventBindingManager) {
        if !GestureContainerFeature.isEnabled {
            gestureRecognizer = UIKitGestureRecognizer()
        }
        self.hoverGestureRecognizer = UIKitHoverGestureRecognizer()
        
        super.init(eventBindingManager: eventBindingManager)
        
        self.gestureRecognizer?.eventBridge = self
        self.hoverGestureRecognizer.eventBridge = self
    }
    
    @MainActor
    func hostingView<Content: View>(_ hostingView: _UIHostingView<Content>, didMoveToWindow window: UIWindow?) {
        if let gestureRecognizer {
            let twoHandedInteractionRelationshipGesture = gestureRecognizer.twoHandedInteractionRelationshipGesture
            let gesturesRequiringFailure = twoHandedInteractionRelationshipGesture.gesturesRequiringFailure
            
            for gesture in gesturesRequiringFailure {
                gesture.removeFailureRequirement(twoHandedInteractionRelationshipGesture)
            }
            
            if let gestureForFailureRelationships = window?._sceneZoomInteraction?.gestureForFailureRelationships {
                gestureForFailureRelationships.require(toFail: twoHandedInteractionRelationshipGesture)
                var gesturesRequiringFailure = gesturesRequiringFailure
                gesturesRequiringFailure.insert(gestureForFailureRelationships)
                twoHandedInteractionRelationshipGesture.gesturesRequiringFailure = gesturesRequiringFailure
            }
        }
        
        let keyPressResponder: UIKitKeyPressResponder?
        if window != nil {
            let fallbackResponderProvider = hostingView.as(FallbackResponderProvider.self)
            keyPressResponder = UIKitKeyPressResponder(
                eventBindingManager: eventBindingManager,
                fallbackResponderProvider: fallbackResponderProvider
            )
        } else {
            keyPressResponder = nil
        }
        self.keyPressResponder = keyPressResponder
    }
}
