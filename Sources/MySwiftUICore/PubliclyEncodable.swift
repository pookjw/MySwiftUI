protocol PubliclyEncodable {
    associatedtype PublicEncoding : Encodable
    
    var publicEncoding: Self.PublicEncoding { get }
}
