
protocol ViewGraphRenderHost {
    func renderDisplayList(_ displayList: DisplayList, asynchronously: Bool, time: Time, nextTime: Time, targetTimestamp: Time?, version: DisplayList.Version, maxVersion: DisplayList.Version) -> Time
}
