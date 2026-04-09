// D8DFA264514E810E42F8158FA6D0EF70
internal import MySwiftUICore
internal import CoreGraphics

@_spi(Internal) public struct _ResolvedImmersionStyle : Hashable {
    let wrappedStyle: any ImmersionStyle
    let initialImmersionLevel: CGFloat
    
    public static func == (lhs: _ResolvedImmersionStyle, rhs: _ResolvedImmersionStyle) -> Bool {
        return lhs.initialImmersionLevel == rhs.initialImmersionLevel
    }
    
    public func hash(into hasher: inout Hasher) {
        var d0 = self.initialImmersionLevel
        d0 = (d0 == 0) ? 0 : d0
        hasher.combine(d0.bitPattern)
    }
}

extension EnvironmentValues {
    var allowedImmersionStyles : [_ResolvedImmersionStyle]? {
        get {
            return self[EnvironmentValues.__Key_allowedImmersionStyles.self]
        }
        set {
            self[EnvironmentValues.__Key_allowedImmersionStyles.self] = newValue
        }
    }
    
    var _allowedImmersionStyles : [_ResolvedImmersionStyle] {
        get {
            return self[EnvironmentValues.__Key__allowedImmersionStyles.self]
        }
        set {
            self[EnvironmentValues.__Key__allowedImmersionStyles.self] = newValue
        }
    }
    
    fileprivate struct __Key_allowedImmersionStyles : EnvironmentKey {
        static var defaultValue: [_ResolvedImmersionStyle]? {
            return [
                _ResolvedImmersionStyle(wrappedStyle: MixedImmersionStyle(), initialImmersionLevel: 0)
            ]
        }
    }
    
    fileprivate struct __Key__allowedImmersionStyles : EnvironmentKey {
        static var defaultValue: [_ResolvedImmersionStyle] {
            return [
                _ResolvedImmersionStyle(wrappedStyle: MixedImmersionStyle(), initialImmersionLevel: 0)
            ]
        }
    }
}
