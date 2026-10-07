// 3890C65F12EA82A4BC5FBD33046B67FA
internal import CoreGraphics

public protocol ShapeStyle : Sendable {
    @available(*, deprecated, message: "obsolete")
    static func _makeView<S>(view: _GraphValue<_ShapeView<S, Self>>, inputs: _ViewInputs) -> _ViewOutputs where S : Shape
    
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    func _apply(to shape: inout _ShapeStyle_Shape)
    
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    static func _apply(to type: inout _ShapeStyle_ShapeType)
    
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    @_weakLinked associatedtype Resolved : ShapeStyle = Never
    
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    func resolve(in environment: EnvironmentValues) -> Self.Resolved
}

extension ShapeStyle {
    nonisolated public static func _makeView<S>(view: _GraphValue<_ShapeView<S, Self>>, inputs: _ViewInputs) -> _ViewOutputs where S : Shape {
        assertUnimplemented()
    }
    
    public func _apply(to shape: inout _ShapeStyle_Shape) {
        guard Self.Resolved.self != Never.self else {
            return
        }
        
        let resolved = self.resolve(in: shape.environment)
        resolved._apply(to: &shape)
    }
    
    public static func _apply(to type: inout _ShapeStyle_ShapeType) {
        assertUnimplemented()
    }
}

extension ShapeStyle where Self.Resolved == Never {
    public func resolve(in environment: EnvironmentValues) -> Never {
        assertUnimplemented()
    }
    
    public static func _apply(to type: inout _ShapeStyle_ShapeType) {
        assertUnimplemented()
    }
}

extension Never : ShapeStyle {
    public typealias Resolved = Never
    
    nonisolated public static func _makeView<S>(view: _GraphValue<_ShapeView<S, Never>>, inputs: _ViewInputs) -> _ViewOutputs where S : Shape {
        assertUnimplemented()
    }
}

public struct _ShapeStyle_Shape {
    var operation: _ShapeStyle_Shape.Operation // 0x0
    var result: _ShapeStyle_Shape.Result // 0x20
    private(set) var environment: EnvironmentValues // 0x30
    private var foregroundStyle: AnyShapeStyle? // 0x40
    private(set) var bounds: CGRect? // 0x48
    var role: ShapeRole // 0x69
    private var substrate: Material.Substrate? // 0x6a
    var activeRecursiveStyles: _ShapeStyle_Shape.RecursiveStyles // 0x6b
    
    init(
        operation: _ShapeStyle_Shape.Operation,
        result: _ShapeStyle_Shape.Result = .none,
        environment: EnvironmentValues = EnvironmentValues(),
        foregroundStyle: AnyShapeStyle?,
        bounds: CGRect?,
        role: ShapeRole = .fill,
        substrate: Material.Substrate?
    ) {
        self.operation = operation
        self.result = result
        self.environment = environment
        self.foregroundStyle = foregroundStyle
        self.bounds = bounds
        self.role = role
        self.substrate = substrate
        self.activeRecursiveStyles = []
    }
}

extension _ShapeStyle_Shape {
    enum Operation {
        case prepareText(level: Int)
        case resolveStyle(name: _ShapeStyle_Name, levels: Range<Int>)
        case fallbackColor(level: Int)
        case copyStyle(name: _ShapeStyle_Name)
        case modifyBackground(level: Int)
        case multiLevel
        case primaryStyle
    }
    
    enum Result {
        case preparedText(_ShapeStyle_Shape.PreparedTextResult)
        case pack(_ShapeStyle_Pack)
        case style(AnyShapeStyle)
        case color(Color)
        case bool(Bool)
        case none
    }
    
    enum PreparedTextResult {
        case foregroundColor(Color)
        case foregroundKeyColor
    }
    
    struct RecursiveStyles : OptionSet {
        static var content: _ShapeStyle_Shape.RecursiveStyles {
            return _ShapeStyle_Shape.RecursiveStyles(rawValue: 1 << 0)
        }
        
        static var foreground: _ShapeStyle_Shape.RecursiveStyles {
            return _ShapeStyle_Shape.RecursiveStyles(rawValue: 1 << 1)
        }
        
        static var background: _ShapeStyle_Shape.RecursiveStyles {
            return _ShapeStyle_Shape.RecursiveStyles(rawValue: 1 << 2)
        }
        
        static var materialProvider: _ShapeStyle_Shape.RecursiveStyles {
            return _ShapeStyle_Shape.RecursiveStyles(rawValue: 1 << 3)
        }
        
        let rawValue: UInt8
    }
}

public struct _ShapeStyle_ShapeType {
    // TODO
}

@available(*, unavailable)
extension _ShapeStyle_ShapeType : Sendable {}
