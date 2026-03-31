private import ObjectiveC.runtime

@c(stopwatchSupportShims_onDyldLoaded)
func onDyldLoaded() {
    swizzle_applyVisualStyles()
}


private nonisolated(unsafe) var original_applyVisualStyles: IMP!
private func swizzle_applyVisualStyles() {
    assert(original_applyVisualStyles == nil)
    
    let method = class_getClassMethod(objc_lookUpClass("_TtC16StopwatchSupport15StyleApplicator")!, Selector(("applyVisualStyles")))!
    original_applyVisualStyles = method_getImplementation(method)
    
    let custom: (@convention(c) (AnyClass, Selector) -> Void) = { `self`, _cmd in
        let casted = unsafeBitCast(original_applyVisualStyles, to: (@convention(c) (AnyClass, Selector) -> Void).self)
        
        casted(self, _cmd)
        applyVisualStyles()
    }
    
    method_setImplementation(method, unsafeBitCast(custom, to: IMP.self))
}
