// 4CA94EFFBA1A33DEA2B0583B3783C90F
private import AttributeGraph

struct PlatformItemCollection {
    private var storage: PlatformItemCollection.Storage
    
    // TODO
}

extension PlatformItemCollection {
    fileprivate enum Storage {
        case attribute(WeakAttribute<PlatformItemList>)
        case list(PlatformItemList)
    }
}
