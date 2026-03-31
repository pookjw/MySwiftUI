// 22A2F77020526CCA53FF38DE37184183

struct TextSizeVariant: Hashable, Comparable, Codable, RawRepresentable {
    static func < (lhs: TextSizeVariant, rhs: TextSizeVariant) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
    
    static var regular: TextSizeVariant {
        return TextSizeVariant(rawValue: 0)
    }
    
    static var compact: TextSizeVariant {
        return TextSizeVariant(rawValue: 1)
    }
    
    static var small: TextSizeVariant {
        return TextSizeVariant(rawValue: 2)
    }
    
    static var tiny: TextSizeVariant {
        return TextSizeVariant(rawValue: 3)
    }
    
    var nextUp: TextSizeVariant? {
        if rawValue == 0 {
            return nil
        }
        
        return TextSizeVariant(rawValue: rawValue - 1)
    }
    
    var nextDown: TextSizeVariant {
        return TextSizeVariant(rawValue: rawValue + 1)
    }
    
    var rawValue: Int
    
    init(rawValue: Int) {
        self.rawValue = rawValue
    }
}

extension EnvironmentValues {
    @inline(always)
    var textSizeVariant: TextSizeVariant {
        get {
            return self[TextSizeVariantKey.self]
        }
        set {
            self[TextSizeVariantKey.self] = newValue
        }
    }
    
    fileprivate struct TextSizeVariantKey: EnvironmentKey {
        static var defaultValue: TextSizeVariant {
            return .regular
        }
    }
}
