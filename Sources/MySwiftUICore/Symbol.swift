@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public struct SymbolRenderingMode : Sendable {
    public static let monochrome: SymbolRenderingMode = { assertUnimplemented() }()
    public static let multicolor: SymbolRenderingMode = { assertUnimplemented() }()
    public static let hierarchical: SymbolRenderingMode = { assertUnimplemented() }()
    public static let palette: SymbolRenderingMode = { assertUnimplemented() }()
    
    private var storage: SymbolRenderingMode.Storage
}

extension SymbolRenderingMode {
    enum Storage {
        case monochrome
        case multicolor
        case hierarchical
        case palette
        case preferred
        case hierarchicalUnlessSlashed
        case hierarchicalSlashBadge
        case paletteSlashBadge
    }
}

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
public struct SymbolVariableValueMode : Equatable, Sendable {
    public static let color: SymbolVariableValueMode = { assertUnimplemented() }()
    public static let draw: SymbolVariableValueMode = { assertUnimplemented() }()
    
    public static func == (a: SymbolVariableValueMode, b: SymbolVariableValueMode) -> Bool {
        assertUnimplemented()
    }
    
    private var storage: SymbolVariableValueMode.Storage
}

extension SymbolVariableValueMode {
    enum Storage : Equatable {
        case color
        case draw
    }
}

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
public struct SymbolColorRenderingMode : Equatable, Sendable {
    public static let flat: SymbolColorRenderingMode = { assertUnimplemented() }()
    public static let gradient: SymbolColorRenderingMode = { assertUnimplemented() }()
    
    public static func == (a: SymbolColorRenderingMode, b: SymbolColorRenderingMode) -> Bool {
        assertUnimplemented()
    }

    private var storage: SymbolColorRenderingMode.Storage
}

extension SymbolColorRenderingMode {
    enum Storage : Equatable {
        case flat
        case gradient
    }
}

struct SymbolRenderingOptions {
    private var renderingMode: SymbolRenderingMode? = nil
    private var variableValueMode: SymbolVariableValueMode? = nil
    private var colorMode: SymbolColorRenderingMode? = nil
}
