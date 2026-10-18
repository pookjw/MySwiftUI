internal import MySwiftUICore

struct AnyIdentifiableShareConfiguration : Identifiable {
    var id: Namespace.ID
    private var base: AnyShareConfiguration
}
