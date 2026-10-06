internal import Foundation

struct _ShapeStyle_ResolverMode {
    var bundle: Bundle?
    var foregroundLevels: UInt16
    var options: _ShapeStyle_ResolverMode.Options
    
    init(foregroundLevels: UInt16 = 0, options: _ShapeStyle_ResolverMode.Options = []) {
        self.bundle = nil
        self.foregroundLevels = foregroundLevels
        self.options = options
    }
    
//    init(rbSymbolStyleMask: UInt32, location: Image.Location) {
//        assertUnimplemented()
//    }
}

extension _ShapeStyle_ResolverMode {
    struct Options : OptionSet {
        let rawValue: UInt8
        
        static var foregroundPalette: _ShapeStyle_ResolverMode.Options {
            return _ShapeStyle_ResolverMode.Options(rawValue: 1 << 0)
        }
        
        static var background: _ShapeStyle_ResolverMode.Options {
            return _ShapeStyle_ResolverMode.Options(rawValue: 1 << 1)
        }
        
        static var multicolor: _ShapeStyle_ResolverMode.Options {
            return _ShapeStyle_ResolverMode.Options(rawValue: 1 << 2)
        }
    }
}
