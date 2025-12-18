
protocol ViewVisitor {
    // TODO
}

protocol ViewTypeVisitor {
    mutating func visit<Content: View>(type: Content.Type)
}
