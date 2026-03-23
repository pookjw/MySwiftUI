
protocol PlatformItemListHost: AnyObject {
    func platformItemListDidChange(list: () -> PlatformItemList)
}
