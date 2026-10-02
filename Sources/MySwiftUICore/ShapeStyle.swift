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
        assertUnimplemented()
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
    private(set) var operation: _ShapeStyle_Shape.Operation
    var result: _ShapeStyle_Shape.Result
    private(set) var environment: EnvironmentValues
    private var foregroundStyle: AnyShapeStyle?
    private var bounds: CGRect?
    private var role: ShapeRole
    private var substrate: Material.Substrate?
    private var activeRecursiveStyles: _ShapeStyle_Shape.RecursiveStyles
    
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
        let rawValue: UInt8
    }
}

public struct _ShapeStyle_ShapeType {
    // TODO
}

@available(*, unavailable)
extension _ShapeStyle_ShapeType : Sendable {}
