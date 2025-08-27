#warning("TODO")

private import Foundation

struct _ShapeStyle_ResolverMode {
    private var bundle: Bundle?
    private var foregroundLevels: UInt16
    private var options: _ShapeStyle_ResolverMode.Options
}

extension _ShapeStyle_ResolverMode {
    struct Options: OptionSet {
        let rawValue: UInt8
    }
}
