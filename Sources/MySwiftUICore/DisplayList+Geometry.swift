// CA3A65C294B7CEBAC4D3EE28C528C257

#warning("TODO")

extension DisplayList.Item {
    func canMergeWithClipMask(state: UnsafePointer<DisplayList.ViewUpdater.Model.State>) -> Bool {
        fatalError("TODO")
    }
    
    func canMergeWithClipRect(_: FixedRoundedRect, state: inout DisplayList.ViewUpdater.Model.State) -> Bool {
        fatalError("TODO")
    }
    
    func canMergeWithTransform() {
        fatalError("TODO")
    }
    
    var canInheritShadowOrFilters: Bool {
        fatalError("TODO")
    }
    
    private func rewriteVibrancyFilterAsBackdrop(_: GraphicsFilter.VibrantColorMatrix, list: DisplayList) {
        fatalError("TODO")
    }
    
    private func discardContainingClips(state: inout DisplayList.ViewUpdater.Model.State) -> Bool {
        fatalError("TODO")
    }
    
    private var canInheritIgnoresEvents: Bool {
        fatalError("TODO")
    }
}
