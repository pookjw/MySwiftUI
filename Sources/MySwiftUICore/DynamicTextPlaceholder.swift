internal import Foundation
internal import RenderBox
internal import CoreGraphics

final class DynamicTextPlaceholder : NSObject, RBPlaceholderDrawingOperation {
    private let text: ResolvedStyledText
    private let size: CGSize
    
    @inline(__always) // 원래 없음
    init(text: ResolvedStyledText, size: CGSize) {
        self.text = text
        self.size = size
        super.init()
    }
    
    var identifier: String? {
        assertUnimplemented()
    }
    
    var boundingRect: CGRect {
        assertUnimplemented()
    }
    
    func draw(in state: RBDrawingState) {
        // noop
    }
    
    func encodedData(delegate: (any RBEncoderDelegate)?) throws -> Data {
        assertUnimplemented()
    }
}
