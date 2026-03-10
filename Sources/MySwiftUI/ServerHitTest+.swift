// 9E986B268CC0E734F6C68F73260B58EE
internal import MySwiftUICore
internal import UIKit
internal import RealityKit
private import Spatial
private import _QuartzCorePrivate
private import _UIKitPrivate

extension ServerHitTest {
    @MainActor init(uiResponder: UIResponder?, leafHitTestedEntity: RealityKit.Entity?) {
        /*
         uiResponder -> x0 -> x21
         leafHitTestedEntity -> x1 -> x19
         return pointer -> x8 -> x20
         */
        self = ServerHitTest(responderID: nil, leafHitTestedEntityProxy: nil)
        
        if let uiResponder {
            // uiResponder -> sp + 0x8
            self.responderID = serverResponderIDFromResponder(uiResponder)
            
            if let uiView = uiResponder as? UIView {
                // uiView -> x21
                let x = uiView.bounds.width * 0.5
                let bounds = uiView.bounds
                let y = bounds.height * 0.5
                let spPoint3D = Point3D(x: x, y: y, z: bounds.size.width)
                let caPoint3D = CAPoint3D(spPoint3D)
                // x22
                let window = uiView._window()
                let converted = uiView.convert(caPoint3D, to: window)
                self.responderHitPointGlobal = Point3D(converted)
            }
        } else {
            self.responderID = nil 
        }
        
        // <+316>
        self.leafHitTestedEntityProxy = leafHitTestedEntity
    }
}

@MainActor fileprivate func serverResponderIDFromResponder(_ responder: UIResponder?) -> UInt64? {
    guard let responder else {
        return nil
    }
    
    if let view = responder as? UIView {
        let externalHitTestingId = view._externalHitTestingId
        if externalHitTestingId != 0 {
            return externalHitTestingId
        }
    }
    
    return serverResponderIDFromResponder(responder.next)
}
