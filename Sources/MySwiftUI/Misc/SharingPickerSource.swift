internal import MySwiftUICore

enum SharingPickerSource {
    case direct(Binding<AnyIdentifiableShareConfiguration?>)
    case indirect(Binding<Bool>, AnyIdentifiableShareConfiguration)
    
    var isPresented: Bool {
        fatalError("TODO")
    }
    
    var id: Namespace.ID? {
        fatalError("TODO")
    }
}
