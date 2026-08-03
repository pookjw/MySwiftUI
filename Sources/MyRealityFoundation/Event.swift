@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public protocol Event : Sendable {
}

protocol PublishingEvent : Event {
    func publish(_ service: any EventService, on source: (any EventSource)?, componentType: (any MyRealityFoundation::Component.Type)?)
}

protocol AccessibilityActivateEvent : PublishingEvent {
}

extension AccessibilityActivateEvent {
    func publish(_ service: any EventService, on source: (any EventSource)?, componentType: (any MyRealityFoundation::Component.Type)?) {
        assertUnimplemented()
    }
}

protocol AccessibilityIncrementEvent : PublishingEvent {
}

extension AccessibilityIncrementEvent {
    func publish(_ service: any EventService, on source: (any EventSource)?, componentType: (any MyRealityFoundation::Component.Type)?) {
        assertUnimplemented()
    }
}

protocol AccessibilityDecrementEvent : PublishingEvent {
}

extension AccessibilityDecrementEvent {
    func publish(_ service: any EventService, on source: (any EventSource)?, componentType: (any MyRealityFoundation::Component.Type)?) {
        assertUnimplemented()
    }
}

protocol AccessibilityCustomActionEvent : PublishingEvent {
}

extension AccessibilityCustomActionEvent {
    func publish(_ service: any EventService, on source: (any EventSource)?, componentType: (any MyRealityFoundation::Component.Type)?) {
        assertUnimplemented()
    }
}

protocol AccessibilityRotorNavigationEvent : PublishingEvent {
}

extension AccessibilityRotorNavigationEvent {
    func publish(_ service: any EventService, on source: (any EventSource)?, componentType: (any MyRealityFoundation::Component.Type)?) {
        assertUnimplemented()
    }
}
