internal import RenderBox

extension RBShadowFlags {
    init(_ options: GraphicsContext.ShadowOptions) {
        if options.contains(.shadowAbove) {
            self = [.unknown0]
        } else {
            self = []
        }
        
        if options.contains(.shadowOnly) {
            self.formUnion(.unknown1)
        }
        
        if options.contains(.invertsAlpha) {
            self.formUnion(.unknown2)
        }
        
        if options.contains(.disablesGroup) {
            self.formUnion(.unknown3)
        }
        
        if options.contains(.dither) {
            self.formUnion(.unknown4)
        }
        
        if options.contains(.knockout) {
            self.formUnion(.unknown5)
        }
    }
}
