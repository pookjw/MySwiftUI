public protocol DynamicViewContent<Data>: View {
  associatedtype Data : Collection
  var data: Self.Data { get }
}
