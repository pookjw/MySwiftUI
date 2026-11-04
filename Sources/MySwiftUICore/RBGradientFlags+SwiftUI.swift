internal import RenderBox

extension RBGradientFlags {
    func union(_ options: GraphicsContext.GradientOptions) -> RBGradientFlags {
        var w0 = options.rawValue
        let w1 = self.rawValue
        var w8 = w1 & 0xfffffff8
        var w9 = w8 | 0x1
        w9 = ((w0 & 0x1) == 0) ? w1 : w9
        w8 = w8 | 0x2
        w8 = ((w0 & 0x2) == 0) ? w9 : w8
        w9 = w8 & 0xffffff3f
        w9 = w9 | 0x40
        w8 = ((w0 & 0x4) == 0) ? w8 : w9
        w9 = ((w8 & 0xf00) == 0) ? 1 : 0
        let w10 = w8 | 0x400
        w0 = ((w9 & (w0 >> 3)) != 0) ? w10 : w8
        
        return RBGradientFlags(rawValue: w0)
    }
}
