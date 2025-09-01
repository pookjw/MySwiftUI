#warning("TODO")

struct ViewGraphRootValues: OptionSet {
    static var rootView: ViewGraphRootValues { return ViewGraphRootValues(rawValue: (1 << 0)) }
    static var environment: ViewGraphRootValues { return ViewGraphRootValues(rawValue: (1 << 1)) }
    static var transform: ViewGraphRootValues { return ViewGraphRootValues(rawValue: (1 << 2)) }
    static var size: ViewGraphRootValues { return ViewGraphRootValues(rawValue: (1 << 3)) }
    static var safeArea: ViewGraphRootValues { return ViewGraphRootValues(rawValue: (1 << 4)) }
    static var containerSize: ViewGraphRootValues { return ViewGraphRootValues(rawValue: (1 << 5)) }
    static var focusStore: ViewGraphRootValues { return ViewGraphRootValues(rawValue: (1 << 6)) }
    static var focustedItem: ViewGraphRootValues { return ViewGraphRootValues(rawValue: (1 << 7)) }
    static var focustedValues: ViewGraphRootValues { return ViewGraphRootValues(rawValue: (1 << 8)) }
    
    static var all: ViewGraphRootValues {
        return [
            .rootView,
            .environment,
            .transform,
            .size,
            .safeArea,
            .containerSize,
            .focusStore,
            .focustedItem,
            .focustedValues
        ]
    }
    
    let rawValue: UInt16
    
    init(rawValue: UInt16) {
        self.rawValue = rawValue
    }
}
