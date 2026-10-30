public import MySwiftUICore

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct GroupBoxStyleConfiguration {
    @MainActor @preconcurrency public struct Label : View {
        @available(macOS 11.0, iOS 14.0, *)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        public typealias Body = Swift.Never
    }
    
    @MainActor @preconcurrency public struct Content : View {
        @available(macOS 11.0, iOS 14.0, *)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        public typealias Body = Swift.Never
    }
    
    public let label: GroupBoxStyleConfiguration.Label
    public let content: GroupBoxStyleConfiguration.Content
}

extension GroupBoxStyleConfiguration.Label : ViewAlias {}
extension GroupBoxStyleConfiguration.Content : ViewAlias {}

