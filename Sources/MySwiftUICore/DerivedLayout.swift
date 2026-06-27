protocol DerivedLayout : Layout {
    associatedtype Base : Layout
    
    var base: Base { get }
}

extension DerivedLayout {
    static var layoutProperties: LayoutProperties {
        assertUnimplemented()
    }
}
