#warning("TODO")
internal import MySwiftUICore

struct EditMenuPresentation {
    
}

extension EditMenuPresentation {
    struct Key: HostPreferenceKey {
        typealias Value = Never? // TODO
        
        static func reduce(value: inout Never?, nextValue: () -> Never?) {
            fatalError("TODO")
        }
    }
}
