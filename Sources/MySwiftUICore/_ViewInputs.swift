#warning("TODO")

internal import AttributeGraph
internal import CoreGraphics

public struct _ViewInputs {
    var base: _GraphInputs
    var preferences: PreferencesInputs
    private var transform: Attribute<ViewTransform>
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
}
