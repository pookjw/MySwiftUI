public struct SymbolVariants : Hashable, Sendable {
    private var flags: UInt8
    private var shape: UInt8

    public static var none: SymbolVariants {
        assertUnimplemented()
    }
    
    public static var circle: SymbolVariants {
        assertUnimplemented()
    }
    
    public static var square: SymbolVariants {
        assertUnimplemented()
    }
    
    public static var rectangle: SymbolVariants {
        assertUnimplemented()
    }
    
    public static var fill: SymbolVariants {
        assertUnimplemented()
    }
    
    public static var slash: SymbolVariants {
        assertUnimplemented()
    }
    
    public var circle: SymbolVariants {
        get {
            assertUnimplemented()
        }
    }
    
    public var square: SymbolVariants {
        get {
            assertUnimplemented()
        }
    }
    
    public var rectangle: SymbolVariants {
        get {
            assertUnimplemented()
        }
    }
    
    public var fill: SymbolVariants {
        get {
            assertUnimplemented()
        }
    }
    
    public var slash: SymbolVariants {
        get {
            assertUnimplemented()
        }
    }
    
    public func contains(_ other: SymbolVariants) -> Bool {
        assertUnimplemented()
    }
    
    public static func == (a: SymbolVariants, b: SymbolVariants) -> Bool {
        assertUnimplemented()
    }
    
    public func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
}

extension View {
    public func symbolVariant(_ variant: SymbolVariants) -> some View {
        assertUnimplemented()
    }
}

extension EnvironmentValues {
    public var symbolVariants: SymbolVariants {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}
