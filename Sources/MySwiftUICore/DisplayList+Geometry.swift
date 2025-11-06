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
    
    fileprivate func discardContainingClips(state: inout DisplayList.ViewUpdater.Model.State) -> Bool {
        fatalError("TODO")
    }
    
    private var canInheritIgnoresEvents: Bool {
        fatalError("TODO")
    }
}

extension DisplayList.ViewUpdater.Model {
    static func merge(
        item: inout DisplayList.Item,
        index: DisplayList.Index,
        into state: inout DisplayList.ViewUpdater.Model.State
    ) -> DisplayList.ViewUpdater.Model.MergedViewRequirements {
        /*
         item = x21
         index = sp + 0x10
         state = x19
         */
        if case .empty = item.value {
            // <+80>
            fatalError("TODO")
        }
        
        // <+360>
        if state.opacity == 1 {
            // <+384>
            if state.rewriteVibrantColorMatrix {
                // <+664>
                fatalError("TODO")
            } else {
                // <+392>
                if let filter = state.filters.first {
                    switch filter {
                    case .colorMultiply(_):
                        // <+440>
                        fatalError("TODO")
                    default:
                        // <+664>
                        fatalError("TODO")
                    }
                }
                // <+960>
            }
        } else {
            // <+464>
            fatalError("TODO")
        }
        
        // <+960>
        // sp + 0x780
        var copy_1 = item
        // sp + 0x4f0
        var copy_2 = item
        // <+1020>
        // sp + 0x3a0
        var copy_3 = copy_1
        
        let result = copy_2.discardContainingClips(state: &state)
        // sp + 0x7d0
        var copy_4 = copy_2
        let w22 = (result ? 4 : 0)
        
        if !state.clips.isEmpty {
            // <+1132>
            fatalError("TODO")
        }
        
        // <+1568>
        fatalError("TODO")
    }
    
    static func finalizePlatformMerge(
        item: inout DisplayList.Item,
        into: inout DisplayList.ViewUpdater.Model.State,
        requirements: DisplayList.ViewUpdater.Model.MergedViewRequirements
    ) {
        fatalError("TODO")
    }
}
