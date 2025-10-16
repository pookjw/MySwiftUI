#warning("TODO")

package import AttributeGraph
internal import CoreGraphics

public struct _ViewInputs {
    package var base: _GraphInputs
    package var preferences: PreferencesInputs
    package var transform: Attribute<ViewTransform>
    private var position: Attribute<CGPoint>
    private var containerPosition: Attribute<CGPoint>
    private var size: Attribute<ViewSize>
    private var safeAreaInsets: OptionalAttribute<SafeAreaInsets>
    var containerSize: OptionalAttribute<ViewSize>
    
    init(
        _ base: _GraphInputs,
        position: Attribute<CGPoint>,
        size: Attribute<ViewSize>,
        transform: Attribute<ViewTransform>,
        containerPosition: Attribute<CGPoint>,
        hostPreferenceKeys: Attribute<PreferenceKeys>
    ) {
        self.base = base
        self.position = position
        self.containerPosition = containerPosition
        self.size = size
        self.transform = transform
        self.preferences = PreferencesInputs(keys: PreferenceKeys(), hostKeys: hostPreferenceKeys)
        self.safeAreaInsets = OptionalAttribute()
        self.containerSize = OptionalAttribute()
    }
    
    package var customInputs: PropertyList {
        get {
            return base.customInputs
        }
        set {
            base.customInputs = newValue
        }
    }
    
    package subscript<T: ViewInput>(_ type: T.Type) -> T.Value {
        get {
            return base[type]
        }
        set {
            base[type] = newValue
        }
    }
    
    func makeRootMatchedGeometryScope() {
        fatalError("TODO")
    }
}

extension _ViewInputs {
    var requestsLayoutComputer: Bool {
        get {
            return base.options.contains(.viewRequestsLayoutComputer)
        }
        set {
            if newValue {
                base.options.insert(.viewRequestsLayoutComputer)
            } else {
                base.options.remove(.viewRequestsLayoutComputer)
            }
        }
    }
    
    var needsGeometry: Bool {
        get {
            return base.options.contains(.viewNeedsGeometry)
        }
        set {
            if newValue {
                base.options.insert(.viewNeedsGeometry)
            } else {
                base.options.remove(.viewNeedsGeometry)
            }
        }
    }
    
    var needsDisplayListAccessibility: Bool {
        get {
            return base.options.contains(.viewDisplayListAccessibility)
        }
        set {
            if newValue {
                base.options.insert(.viewDisplayListAccessibility)
            } else {
                base.options.remove(.viewDisplayListAccessibility)
            }
        }
    }
    
    package var needsAccessibilityGeometry: Bool {
        get {
            return base.options.contains(.viewNeedsGeometryAccessibility)
        }
        set {
            if newValue {
                base.options.insert(.viewNeedsGeometryAccessibility)
            } else {
                base.options.remove(.viewNeedsGeometryAccessibility)
            }
        }
    }
    
    package var needsAccessibility: Bool {
        get {
            return base.options.contains(.needsAccessibility)
        }
        set {
            if newValue {
                base.options.insert(.needsAccessibility)
            } else {
                base.options.remove(.needsAccessibility)
            }
        }
    }
    
    var supportsVFD: Bool {
        return base.options.contains(.supportsVariableFrameDuration)
    }
    
    var layoutDirection: Attribute<LayoutDirection> {
        return base.cachedEnvironment.value.attribute(id: .layoutDirection) { environmentValues in
            return environmentValues.layoutDirection
        }
    }
    
    package var textAccessibilityProvider: (any TextAccessibilityProvider.Type) {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
}
