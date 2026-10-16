// 25C7EE19F64B0E53EE4CB01B5E3710EB

extension DisplayList {
    package struct InterpolatorAnimation {
        // TODO
    }
    
    struct InterpolatorLayer {
        private var contents: DisplayList.InterpolatorLayer.Contents
        private var removed: [DisplayList.InterpolatorLayer.Removed]
        private var time: Time
        private var renderer: DisplayList.GraphicsRenderer?
        private var contentSeed: DisplayList.Seed
        private var supportsVFD: Bool
        private var needsUpdate: Bool
    }
}

extension DisplayList.InterpolatorLayer {
    fileprivate struct Removed {
        // TODO
    }
    
    fileprivate enum Phase {
        case pending
        case first
        case second
        case running
    }
    
    fileprivate struct Contents {
        // TODO
    }
}
