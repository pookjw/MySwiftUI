package protocol ViewRendererHost: AnyObject {
    var viewGraph: ViewGraph { get }
    var currentTimestamp: Time { get set }
    var propertiesNeedingUpdate: ViewRendererHostProperties { get set }
    var externalUpdateCount: Int { get set }
    func updateRootView()
    func updateEnvironment()
    func updateSize()
    func updateSafeArea()
}
