package protocol ViewGraphOwner: AnyObject {
    var viewGraph: ViewGraph { get }
    var currentTimestamp: Time { get set }
    var valuesNeedingUpdate: ViewGraphRootValues { get set }
    var renderingPhase: ViewRenderingPhase { get set }
    var externalUpdateCount: Int { get set }
}
