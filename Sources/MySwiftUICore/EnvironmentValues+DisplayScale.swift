// 1B17C64D9E901A0054B49B69A4A2439D
public import CoreGraphics

extension EnvironmentValues {
    public var displayScale: CGFloat {
        get {
            return self[DisplayScaleKey.self]
        }
        set {
            self[DisplayScaleKey.self] = newValue
        }
        _modify {
            yield &self[DisplayScaleKey.self]
        }
    }
    
    var defaultPixelLength: CGFloat? {
        get {
            return self[DefaultPixelLengthKey.self]
        }
        set {
            self[DefaultPixelLengthKey.self] = newValue
        }
        _modify {
            yield &self[DefaultPixelLengthKey.self]
        }
    }
    
    var pixelLength: CGFloat {
        if let defaultPixelLength {
            return defaultPixelLength
        } else {
            let displayScale = displayScale
            if displayScale == 0 {
                return 1
            } else {
                return 1.0 / displayScale
            }
        }
    }
}

fileprivate struct DisplayScaleKey: EnvironmentKey {
    static var defaultValue: CGFloat {
        return 1
    }
}

fileprivate struct DefaultPixelLengthKey: EnvironmentKey {
    static var defaultValue: CGFloat? {
        return nil
    }
}
