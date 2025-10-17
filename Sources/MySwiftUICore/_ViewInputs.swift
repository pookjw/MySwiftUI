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
    
    package var animationsDisabled: Bool {
        get {
            return base.options.contains(.animationsDisabled)
        }
        set {
            if newValue {
                base.options.insert(.animationsDisabled)
            } else {
                base.options.remove(.animationsDisabled)
            }
        }
        _modify {
            fatalError("TODO")
        }
    }
    
    var layoutDirection: Attribute<LayoutDirection> {
        return base.cachedEnvironment.value.attribute(id: .layoutDirection) { environmentValues in
            return environmentValues.layoutDirection
        }
    }
    
    package var textAccessibilityProvider: (any TextAccessibilityProvider.Type) {
        get {
            return base.textAccessibilityProvider
        }
        set {
            base.textAccessibilityProvider = newValue
        }
        _modify {
            yield &base.textAccessibilityProvider
        }
    }
    
    package var imageAccessibilityProvider: (any ImageAccessibilityProvider.Type) {
        get {
            return base.imageAccessibilityProvider
        }
        set {
            base.imageAccessibilityProvider = newValue
        }
        _modify {
            yield &base.imageAccessibilityProvider
        }
    }
    
    package var privacyReductionAccessibilityProvider: (any PrivacyReductionAccessibilityProvider.Type) {
        get {
            return base.privacyReductionAccessibilityProvider
        }
        set {
            base.privacyReductionAccessibilityProvider = newValue
        }
        _modify {
            yield &base.privacyReductionAccessibilityProvider
        }
    }
    
    package var layoutAccessibilityProvider: (any LayoutAccessibilityProvider.Type) {
        get {
            return base.layoutAccessibilityProvider
        }
        set {
            base.layoutAccessibilityProvider = newValue
        }
        _modify {
            yield &base.layoutAccessibilityProvider
        }
    }
    
    package var gestureAccessibilityProvider: (any GestureAccessibilityProvider.Type) {
        get {
            return base.gestureAccessibilityProvider
        }
        set {
            base.gestureAccessibilityProvider = newValue
        }
        _modify {
            yield &base.gestureAccessibilityProvider
        }
    }
    
    package var opacityAccessibilityProvider: (any OpacityAccessibilityProvider.Type) {
        get {
            return base.opacityAccessibilityProvider
        }
        set {
            base.opacityAccessibilityProvider = newValue
        }
        _modify {
            yield &base.opacityAccessibilityProvider
        }
    }
    
    package var contentShapeAccessibilityProvider: (any ContentShapeAccessibilityProvider.Type) {
        get {
            return base.contentShapeAccessibilityProvider
        }
        set {
            base.contentShapeAccessibilityProvider = newValue
        }
        _modify {
            yield &base.contentShapeAccessibilityProvider
        }
    }
    
    package var allowsHitTestingAccessibilityProvider: (any AllowsHitTestingAccessibilityProvider.Type) {
        get {
            return base.allowsHitTestingAccessibilityProvider
        }
        set {
            base.allowsHitTestingAccessibilityProvider = newValue
        }
        _modify {
            yield &base.allowsHitTestingAccessibilityProvider
        }
    }
    
    package var hiddenAccessibilityProvider: (any HiddenAccessibilityProvider.Type) {
        get {
            return base.hiddenAccessibilityProvider
        }
        set {
            base.hiddenAccessibilityProvider = newValue
        }
        _modify {
            yield &base.hiddenAccessibilityProvider
        }
    }
    
    package var customHoverEffectAccessibilityProvider: (any CustomHoverEffectAccessibilityProvider.Type) {
        get {
            return base.customHoverEffectAccessibilityProvider
        }
        set {
            base.customHoverEffectAccessibilityProvider = newValue
        }
        _modify {
            yield &base.customHoverEffectAccessibilityProvider
        }
    }
    
    package var remoteEffectsAccessibilityProvider: (any RemoteEffectsAccessibilityProvider.Type) {
        get {
            return base.remoteEffectsAccessibilityProvider
        }
        set {
            base.remoteEffectsAccessibilityProvider = newValue
        }
        _modify {
            yield &base.remoteEffectsAccessibilityProvider
        }
    }
}

extension _ViewInputs {
    func setContainerShape<T: RoundedRectangularShape>(_: Attribute<T>, isSystemShape: Bool) {
        fatalError("TODO")
    }
}
