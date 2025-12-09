internal import AttributeGraph

enum ViewContentOffset {
    case staticCount(count: Int, needsDynamicView: Bool)
    case dynamic(count: Attribute<Int>, staticCount: Int)
}
