protocol ViewVisitor {
    func visit<Content: View>(_ view: Content)
}

protocol ViewTypeVisitor {
    mutating func visit<Content: View>(type: Content.Type)
}
