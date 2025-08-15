#warning("TODO")

struct TrackerData {
    var plistID: UniqueID
    var values: [ObjectIdentifier: any AnyTrackedValue]
    var derivedValues: [ObjectIdentifier: any AnyTrackedValue]
    var invalidValues: [any AnyTrackedValue]
    var unrecordedDependencies: Bool
    
    @inlinable
    init(
        plistID: UniqueID,
        values: [ObjectIdentifier : any AnyTrackedValue],
        derivedValues: [ObjectIdentifier : any AnyTrackedValue],
        invalidValues: [any AnyTrackedValue],
        unrecordedDependencies: Bool
    ) {
        self.plistID = plistID
        self.values = values
        self.derivedValues = derivedValues
        self.invalidValues = invalidValues
        self.unrecordedDependencies = unrecordedDependencies
    }
}
