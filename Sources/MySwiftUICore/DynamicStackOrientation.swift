internal import AttributeGraph

struct DynamicStackOrientation: ViewInput {
    static let defaultValue = OptionalAttribute<Axis?>()
}

struct DynamicStackOrientationIsDepth: ViewInput {
    static let defaultValue = OptionalAttribute<Bool>()
}
