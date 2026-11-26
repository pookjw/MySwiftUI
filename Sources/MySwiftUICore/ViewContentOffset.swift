internal import AttributeGraph

enum ViewContentOffset : _ViewTraitKey {
    case staticCount(count: Int, needsDynamicView: Bool)
    case dynamic(count: Attribute<Int>, staticCount: Int)
    
    var offset: Int {
        assertUnimplemented()
    }
    
    static var defaultValue: ViewContentOffset? {
        return nil
    }
}
