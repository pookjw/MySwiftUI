// B0F5FD51133E70141176B7B8AC4E9712

#warning("TODO")
internal import QuartzCore
private import _QuartzCorePrivate
private import CoreGraphics

extension CALayer {
    @inline(__always)
    func updateEDR(allowedDynamicRange: Image.DynamicRange, contentHeadroom: @autoclosure () -> Float) {
        let preferredDynamicRange: CALayer.DynamicRange
        var w21 = false
        switch allowedDynamicRange.storage {
        case .standard:
            preferredDynamicRange = .standard
        default:
            // <+40>
            let headroom = contentHeadroom()
            if headroom != .nan, headroom > 1 {
                if allowedDynamicRange.storage == .high {
                    preferredDynamicRange = .high
                } else {
                    preferredDynamicRange = .constrainedHigh
                }
                w21 = true
            } else {
                preferredDynamicRange = .standard
            }
        }
        
        // <+112>
        // preferredDynamicRange = sp + 0x8
        // d9
        let contentsEDRStrength_1 = self.contentsEDRStrength
        // d8
        let contentsCDRStrength_1 = self.contentsCDRStrength
        self.preferredDynamicRange = preferredDynamicRange
        // d11
        let contentsEDRStrength_2 = self.contentsEDRStrength
        // d10
        let contentsCDRStrength_2 = self.contentsCDRStrength
        
        if contentsEDRStrength_2 != contentsEDRStrength_1 {
            // <+284>
            animateEDRProperty(#keyPath(CALayer.contentsEDRStrength), interval: contentsEDRStrength_2 - contentsEDRStrength_1)
            // <+232>
        } else if contentsCDRStrength_2 != contentsCDRStrength_1 {
            // <+328>
            animateEDRProperty(#keyPath(CALayer.contentsCDRStrength), interval: contentsCDRStrength_2 - contentsCDRStrength_1)
            // <+232>
        }
        
        // <+232>
        self.wantsExtendedDynamicRangeContent = w21
    }
    
    fileprivate func animateEDRProperty(_ keyPath: String, interval: CGFloat) {
        guard interval != 0 else {
            return
        }
        
        /*
         interval = d8
         value = x21/x22
         */
        
        guard isLinkedOnOrAfter(.v6) else {
            return
        }
        
        // <+160>
        // x21
        let animation = CASpringAnimation(keyPath: keyPath)
        animation.fromValue = -interval
        animation.toValue = CGFloat(0)
        animation.isAdditive = true
        animation.duration = 3
        animation.mass = 2
        animation.stiffness = 19.7392
        animation.damping = 12.5664
        animation.fillMode = .backwards
        
        add(animation, forKey: nil)
    }
}
