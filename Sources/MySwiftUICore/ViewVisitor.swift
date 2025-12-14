#warning("TODO")

protocol ViewVisitor {
    // TODO
}

protocol ViewTypeVisitor {
    func visit<Content: View>(type: Content.Type)
}
