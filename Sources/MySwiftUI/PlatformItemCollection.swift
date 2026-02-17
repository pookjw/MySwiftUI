// 4CA94EFFBA1A33DEA2B0583B3783C90F
private import AttributeGraph

struct PlatformItemCollection {
    private var storage: PlatformItemCollection.Stroage
    
    // TODO
}

extension PlatformItemCollection {
    fileprivate enum Stroage {
        case attribute(WeakAttribute<PlatformItemList>)
        case list(PlatformItemList)
    }
}
