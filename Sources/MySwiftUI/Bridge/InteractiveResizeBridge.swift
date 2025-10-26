#warning("TODO")
internal import UIKit
internal import MySwiftUICore
internal import AttributeGraph

final class InteractiveResizeBridge {
    var lastValue: Bool = false
    var isInteractivelyResizing = WeakAttribute<Bool>()
}
