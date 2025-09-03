#warning("TODO")

package struct ViewGraphRootValues: OptionSet {
    package static var rootView: ViewGraphRootValues { return ViewGraphRootValues(rawValue: (1 << 0)) }
    package static var environment: ViewGraphRootValues { return ViewGraphRootValues(rawValue: (1 << 1)) }
    package static var transform: ViewGraphRootValues { return ViewGraphRootValues(rawValue: (1 << 2)) }
    package static var size: ViewGraphRootValues { return ViewGraphRootValues(rawValue: (1 << 3)) }
    package static var safeArea: ViewGraphRootValues { return ViewGraphRootValues(rawValue: (1 << 4)) }
    package static var containerSize: ViewGraphRootValues { return ViewGraphRootValues(rawValue: (1 << 5)) }
    package static var focusStore: ViewGraphRootValues { return ViewGraphRootValues(rawValue: (1 << 6)) }
    package static var focustedItem: ViewGraphRootValues { return ViewGraphRootValues(rawValue: (1 << 7)) }
    package static var focustedValues: ViewGraphRootValues { return ViewGraphRootValues(rawValue: (1 << 8)) }
    
    package static var all: ViewGraphRootValues {
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
    
    package let rawValue: UInt16
    
    package init(rawValue: UInt16) {
        self.rawValue = rawValue
    }
}
