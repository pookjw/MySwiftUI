internal import MySwiftUICore

enum SharingPickerSource {
    case direct(Binding<AnyIdentifiableShareConfiguration?>)
    case indirect(Binding<Bool>, AnyIdentifiableShareConfiguration)
    
    var isPresented: Bool {
        assertUnimplemented()
    }
    
    var id: Namespace.ID? {
        assertUnimplemented()
    }
}
