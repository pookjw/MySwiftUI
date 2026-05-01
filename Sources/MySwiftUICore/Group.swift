//@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
//@frozen public struct Group<Content> {
//    public typealias Body = Never
//    
//    @usableFromInline
//    package var content: Content
//    
//    @_disfavoredOverload @inlinable package init(_content: Content) { self.content = _content }
//}
//
//@available(*, unavailable)
//extension Group : Sendable {
//}
//
//@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
//extension Group {
//    @available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
//    @available(*, deprecated, message: "Do not use this.")
//    @_alwaysEmitIntoClient public static func _make(content: Content) -> Group<Content> {
//        
//        
//        self.init(_content: content)
//    }
//}
//
//@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
//extension Group : View where Content : View {
//    @inlinable nonisolated public init(@ViewBuilder content: () -> Content) {
//        self.content = content()
//    }
//    
//    nonisolated public static func _makeViewList(view: _GraphValue<Group<Content>>, inputs: _ViewListInputs) -> _ViewListOutputs {
//        assertUnimplemented()
//    }
//    
//    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
//    nonisolated public static func _viewListCount(inputs: _ViewListCountInputs) -> Int? {
//        assertUnimplemented()
//    }
//}
//
//@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
//extension Group {
//    public init<Base, Result>(subviews view: Base, @ViewBuilder transform: @escaping (SubviewsCollection) -> Result) where Content == GroupElementsOfContent<Base, Result>, Base : View, Result : View {
//        assertUnimplemented()
//    }
//}
