internal import RenderBox
internal import Foundation

class FactoryPlaceholder: NSObject, RBPlaceholderObject {
    private let _identifier: String
    private let value: (any Decodable & Encodable)
    private let userInfo: [CodingUserInfoKey : Any]
    
    override private init() {
        assertUnimplemented()
    }
    
    var identifier: String? {
        assertUnimplemented()
    }
    
    func encodedData(delegate: (any RBEncoderDelegate)?) throws -> Data {
        assertUnimplemented()
    }
}

final class FactoryViewPlaceholder: FactoryPlaceholder, RBPlaceholderDrawingOperation {
    init?(factory: any AnyViewFactory, userInfo: [CodingUserInfoKey: Any]) {
        assertUnimplemented()
    }
    
    var boundingRect: CGRect {
        assertUnimplemented()
    }
    
    func draw(inState state: RBDrawingState) {
        assertUnimplemented()
    }
}

final class FactoryStylePlaceholder: FactoryPlaceholder, RBPlaceholderStyle {
    init?(factory: any AnyViewFactory, userInfo: [CodingUserInfoKey: Any]) {
        assertUnimplemented()
    }
    
    func boundingRect(for content: any RBPlaceholderStyleContent) -> CGRect {
        assertUnimplemented()
    }
    
    func draw(inState state: RBDrawingState, content: any RBPlaceholderStyleContent) {
        assertUnimplemented()
    }
}
