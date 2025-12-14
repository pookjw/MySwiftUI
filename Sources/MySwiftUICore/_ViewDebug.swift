// 43DA1754B0518AF1D72B90677BF266DB

#warning("TODO")
private import _DarwinFoundation3._stdlib
private import AttributeGraph

public enum _ViewDebug {
    @safe static nonisolated(unsafe) var isInitialized = false
    @safe static nonisolated(unsafe) var properties: _ViewDebug.Properties = []
}

extension _ViewDebug {
    static func initialize(inputs: inout _ViewInputs) {
        if !_ViewDebug.isInitialized {
            if let value = unsafe getenv("SWIFTUI_VIEW_DEBUG") {
                _ViewDebug.properties = unsafe _ViewDebug.Properties(rawValue: UInt32(atoi(value)))
            }
            _ViewDebug.isInitialized = true
        }
        
        if !_ViewDebug.properties.isEmpty {
            Subgraph.setShouldRecordTree()
        }
    }
}

extension _ViewDebug {
    public enum Property : UInt32, Hashable {
        case type
        case value
        case transform
        case position
        case size
        case environment
        case phase
        case layoutComputer
        case displayList
    }
}

extension _ViewDebug {
    public struct Properties: OptionSet, Sendable {
        public let rawValue: UInt32
        
        public init(rawValue: UInt32) {
            self.rawValue = rawValue
        }
        
        @inlinable package init(_ property: _ViewDebug.Property) {
            self.init(rawValue: 1 << property.rawValue)
        }
        
        public static let type = _ViewDebug.Properties(rawValue: (1 << 0))
        public static let value = _ViewDebug.Properties(rawValue: (1 << 1))
        public static let transform = _ViewDebug.Properties(rawValue: (1 << 2))
        public static let position = _ViewDebug.Properties(rawValue: (1 << 3))
        public static let size = _ViewDebug.Properties(rawValue: (1 << 4))
        public static let environment = _ViewDebug.Properties(rawValue: (1 << 5))
        public static let phase = _ViewDebug.Properties(rawValue: (1 << 6))
        public static let layoutComputer = _ViewDebug.Properties(rawValue: (1 << 7))
        public static let displayList = _ViewDebug.Properties(rawValue: (1 << 8))
        public static let all = _ViewDebug.Properties(rawValue: .max)
    }
}

extension _ViewDebug {
    public struct Data {
        
    }
}

extension _ViewDebug {
    fileprivate static func reallyWrap<T>(_ outputs: inout _ViewOutputs, value: _GraphValue<T>, inputs: UnsafePointer<_ViewInputs>) {
        // value는 안 쓰이는 값으로 추정
        // $s7SwiftUI10_ViewDebugOAAE10reallyWrap33_43DA1754B0518AF1D72B90677BF266DBLL_5value6inputsyAA01_C7OutputsVz_AA11_GraphValueVyxGSPyAA01_C6InputsVGtlFZAA06_ShapeC0VyAA9RectangleVAAE17AsymmetricalInsetVAA15ForegroundStyleVG_Tt0t2g5Tm
        /*
         outputs = x20
         inputs = x19
         */
        // w22
        var debugProperties = unsafe outputs.preferences.debugProperties.union(inputs.pointee.base.changedDebugProperties)
        outputs.preferences.debugProperties = []
        
        if debugProperties.contains(.layoutComputer) && outputs.layoutComputer == nil {
            // <+48>
            debugProperties.remove(.layoutComputer)
        }
        
        // <+76>
        guard !debugProperties.subtracting(.displayList).isEmpty else {
            // <+360>
            return
        }
        
        // <+84>
        guard Subgraph.shouldRecordTree else {
            return
        }
        
        // <+92>
        if debugProperties.contains(.transform) {
            unsafe Subgraph.addTreeValue(inputs.pointee.transform, forKey: "transform", flags: 0)
        }
        if debugProperties.contains(.position) {
            unsafe Subgraph.addTreeValue(inputs.pointee.position, forKey: "position", flags: 0)
        }
        if debugProperties.contains(.size) {
            unsafe Subgraph.addTreeValue(inputs.pointee.size, forKey: "size", flags: 0)
        }
        if debugProperties.contains(.environment) {
            unsafe Subgraph.addTreeValue(inputs.pointee.base.environment, forKey: "environment", flags: 0)
        }
        if debugProperties.contains(.phase) {
            unsafe Subgraph.addTreeValue(inputs.pointee.base.phase, forKey: "phase", flags: 0)
        }
        if debugProperties.contains(.layoutComputer) {
            unsafe Subgraph.addTreeValue(outputs.layoutComputer!, forKey: "layoutComputer", flags: 0)
        }
    }
}

extension View {
    @inline(__always)
    static nonisolated func makeDebuggableView(view: _GraphValue<Self>, inputs: _ViewInputs) -> _ViewOutputs {
        let shouldRecordTree = Subgraph.shouldRecordTree
        if shouldRecordTree {
            Subgraph.beginTreeElement(value: view.value, flags: 0)
        }
        
        var copy = inputs
        let prev = copy.base.changedDebugProperties
        copy.base.changedDebugProperties = []
        
        var outputs = Self._makeView(view: view, inputs: copy)
        copy.base.changedDebugProperties = prev
        
        if shouldRecordTree {
            unsafe _ViewDebug.reallyWrap(&outputs, value: view, inputs: &copy)
            Subgraph.endTreeElement(value: view.value)
        }
        
        return outputs
    }
    
    static nonisolated func makeDebuggableViewList<T: View>(view: _GraphValue<T>, inputs: _ViewListInputs) -> _ViewListOutputs {
        let shouldRecordTree = Subgraph.shouldRecordTree
        if shouldRecordTree {
            Subgraph.beginTreeElement(value: view.value, flags: 0)
        }
        defer {
            if shouldRecordTree {
                Subgraph.endTreeElement(value: view.value)
            }
        }
        
        return T._makeViewList(view: view, inputs: inputs)
    }
}

extension ViewModifier {
    @inline(__always)
    @MainActor static func makeDebuggableView(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: @MainActor @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        let shouldRecordTree = Subgraph.shouldRecordTree
        if shouldRecordTree {
            Subgraph.beginTreeElement(value: modifier.value, flags: 0)
        }
        
        var copy = inputs
        let prev = copy.base.changedDebugProperties
        copy.base.changedDebugProperties = []
        
        var outputs = Self._makeView(modifier: modifier, inputs: copy) { graph, inputs in
            return body(graph, inputs)
        }
        copy.base.changedDebugProperties = prev
        
        if shouldRecordTree {
            unsafe _ViewDebug.reallyWrap(&outputs, value: modifier, inputs: &copy)
            Subgraph.endTreeElement(value: modifier.value)
        }
        
        return outputs
    }
    
    static func makeDebuggableViewList<T>(modifier: _GraphValue<T>, inputs: _ViewListInputs, body: (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        fatalError("TODO")
    }
}
