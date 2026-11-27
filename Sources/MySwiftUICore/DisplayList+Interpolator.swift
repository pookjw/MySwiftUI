// 25C7EE19F64B0E53EE4CB01B5E3710EB
package import CoreGraphics
package import RenderBox

extension DisplayList {
    package struct InterpolatorAnimation {
        private(set) var value: StrongHash?
        private(set) var animation: Animation?
    }
    
    struct InterpolatorLayer {
        private var contents: DisplayList.InterpolatorLayer.Contents
        private var removed: [DisplayList.InterpolatorLayer.Removed]
        private var time: Time
        private var renderer: DisplayList.GraphicsRenderer?
        private var contentSeed: DisplayList.Seed
        private var supportsVFD: Bool
        private var needsUpdate: Bool
        
        mutating func setDisplayList(_ list: DisplayList, origin: CGPoint) {
            assertUnimplemented()
        }
        
        mutating func updateInterpolators(contentsScale: Float, maxDuration: Double) {
            assertUnimplemented()
        }
        
        mutating func invalidateContentsScale() {
            assertUnimplemented()
        }
        
        mutating func updateOutput(list: inout DisplayList, frame: CGRect, contentOffset: CGSize, version: DisplayList.Version, rasterizationOptions: RasterizationOptions) -> Bool {
            assertUnimplemented()
        }
        
        fileprivate mutating func remove(prefix: Int) {
            assertUnimplemented()
        }
    }
}

extension DisplayList.InterpolatorLayer {
    fileprivate struct Removed {
        // TODO
    }
    
    fileprivate enum Phase : Hashable {
        case pending
        case first
        case second
        case running
    }
    
    fileprivate struct Contents {
        // TODO
        
        func render(at time: Time, renderer: inout DisplayList.GraphicsRenderer?, storage: inout RBDisplayList?, contentsScale: Float) -> Bool {
            assertUnimplemented()
        }
    }
}
