#warning("TODO")

protocol RootTransformProvider {
    func rootTransform() -> ViewTransform
}

package protocol RootTransformAdjuster {
    func updateRootTransform(_ transform: inout ViewTransform)
}
