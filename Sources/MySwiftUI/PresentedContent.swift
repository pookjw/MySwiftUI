internal import MySwiftUICore

enum PresentedContent<Data, Content> : View where Content: View, Data: Decodable, Data: Encodable, Data: Hashable {
    case view(Content)
    case data(PresentedWindowContent<Data, Content>)
    
    var body: some View {
        assertUnimplemented()
    }
}
