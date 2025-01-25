package struct ViewRendererHostProperties: OptionSet, Equatable {
    package static var rootView: ViewRendererHostProperties { ViewRendererHostProperties(rawValue: 1 << 0) }
    package static var environment: ViewRendererHostProperties { ViewRendererHostProperties(rawValue: 1 << 1) }
    package static var transform: ViewRendererHostProperties { ViewRendererHostProperties(rawValue: 1 << 2) }
    package static var size: ViewRendererHostProperties { ViewRendererHostProperties(rawValue: 1 << 3) }
    package static var safeArea: ViewRendererHostProperties { ViewRendererHostProperties(rawValue: 1 << 4) }
    package static var containerSize: ViewRendererHostProperties { ViewRendererHostProperties(rawValue: 1 << 5) }
    package static var focusStore: ViewRendererHostProperties { ViewRendererHostProperties(rawValue: 1 << 6) }
    package static var focusedItem: ViewRendererHostProperties { ViewRendererHostProperties(rawValue: 1 << 7) }
    package static var focusedValues: ViewRendererHostProperties { ViewRendererHostProperties(rawValue: 1 << 8) }
    
    package static let all: ViewRendererHostProperties = [
        .rootView,
        .environment,
        .transform,
        .size,
        .safeArea,
        .containerSize,
        .focusStore,
        .focusedItem,
        .focusedValues
    ]
    
    package let rawValue: UInt16
    
    package init(rawValue: UInt16) {
        self.rawValue = rawValue
    }
}
