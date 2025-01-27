import AttributeGraph

package protocol GraphInput: PropertyKey {
    static var isTriviallyReusable: Bool { get }
    static func makeReusable(indirectMap: IndirectAttributeMap, value: inout Value)
    static func tryToReuse(_ value: Value, by otherValue: Value, indirectMap: IndirectAttributeMap, testOnly: Bool) -> Bool
}

package struct _GraphInputs {
    package var customInputs: PropertyList
    package var time: AttributeGraph.Attribute<Time>
    package private(set) var cachedEnvironment: MutableBox<CachedEnvironment>
    package var phase: AttributeGraph.Attribute<_GraphInputs.Phase>
    package var transaction: AttributeGraph.Attribute<Transaction>
    package var changedDebugProperties: _ViewDebug.Properties
    package var options: _GraphInputs.Options
    package var mergedInputs: Set<AGAttribute>
    
    package var environment: AttributeGraph.Attribute<EnvironmentValues> {
        get {
            cachedEnvironment.wrappedValue.environment
        }
        set {
            cachedEnvironment.wrappedValue.environment = newValue
            changedDebugProperties.formUnion(.environment)
        }
    }
    
    package var animationsDisabled: Bool {
        get {
            options.contains(.animationsDisabled)
        }
        set {
            if newValue {
                options.formUnion(.animationsDisabled)
            } else {
                options.remove(.animationsDisabled)
            }
        }
    }
#warning("TODO")
    
    package init(
        time: AttributeGraph.Attribute<Time>,
        phase: AttributeGraph.Attribute<Phase>,
        environment: AttributeGraph.Attribute<EnvironmentValues>,
        transaction: AttributeGraph.Attribute<Transaction>
    ) {
        fatalError("TODO")
    }
}

extension _GraphInputs {
    var scrollable: AttributeGraph.OptionalAttribute<Scrollable> {
        fatalError("TODO")
    }
}

extension _GraphInputs {
    package struct Phase {}
}

extension _GraphInputs {
    package struct Options: OptionSet, Equatable {
        package let rawValue: UInt32
        
        package init(rawValue: UInt32) {
            self.rawValue = rawValue
        }
        
        package static var animationsDisabled: Options { Options(rawValue: 1 << 0) }
        package static var viewRequestsLayoutComputer: Options { Options(rawValue: 1 << 1) }
        package static var viewStackOrientationIsDefined: Options { Options(rawValue: 1 << 2) }
        package static var viewStackOrientationIsHorizontal: Options { Options(rawValue: 1 << 3) }
        package static var viewDisplayListAccessibility: Options { Options(rawValue: 1 << 4) }
        package static var viewNeedsGeometry: Options { Options(rawValue: 1 << 5) }
        package static var viewNeedsGeometryAccessibility: Options { Options(rawValue: 1 << 6) }
        package static var viewNeedsRespondersAccessibility: Options { Options(rawValue: 1 << 7) }
        package static var needsStableDisplayListIDs: Options { Options(rawValue: 1 << 8) }
        package static var supportsVariableFrameDuration: Options { Options(rawValue: 1 << 10) }
        package static var needsDynamicLayout: Options { Options(rawValue: 1 << 11) }
        package static var needsAccessibility: Options { Options(rawValue: 1 << 12) }
        package static var doNotScrape: Options { Options(rawValue: 1 << 13) }
    }
}

extension _GraphInputs {
//    private struct ScrollableKey: GraphInput {}
    // ScrollStateRequestKey
}
