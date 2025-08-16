#warning("TODO")
internal import UIKit
internal import MySwiftUICore
internal import AttributeGraph

class InteractiveResizeBridge {
    var lastValue: Bool = false
    var isInteractivelyResizing: WeakAttribute<Bool> = WeakAttribute(base: AGWeakAttribute())
}
