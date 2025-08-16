#warning("TODO")

package import AttributeGraph
internal import CoreGraphics

public struct _ViewInputs {
    package var base: _GraphInputs
    package var preferences: PreferencesInputs
    
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
    
    var transform: Attribute<ViewTransform>
    var position: Attribute<CGPoint>
    var containerPosition: Attribute<CGPoint>
    var size: Attribute<ViewSize>
    var safeAreaInsets: OptionalAttribute<SafeAreaInsets>
    var containerSize: OptionalAttribute<ViewSize>
}
