@_spi(Internal) internal import MySwiftUICore

struct EditMenuPresentation {
    
}

extension EditMenuPresentation {
    struct Key : HostPreferenceKey {
        typealias Value = EditMenuPresentation?
        
        static func reduce(value: inout EditMenuPresentation?, nextValue: () -> EditMenuPresentation?) {
            assertUnimplemented()
        }
    }
}
