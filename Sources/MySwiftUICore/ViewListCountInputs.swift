public struct _ViewListCountInputs {
    var customInputs: PropertyList
    private(set) var options: _ViewListInputs.Options
    private(set) var baseOptions: _GraphInputs.Options
    private(set) var customViewCache: CustomViewCountCache?
    var debugReplaceableViewInfo: DebugReplaceableViewInfo
}
