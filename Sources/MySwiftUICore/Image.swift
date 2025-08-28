#warning("TODO")

public struct Image: View {
    
}

extension Image {
    @frozen public enum Orientation : UInt8, CaseIterable, Hashable {
        case up
        case upMirrored
        case down
        case downMirrored
        case left
        case leftMirrored
        case right
        case rightMirrored
    }
    
    struct ResizingInfo {
        private var capInsets: EdgeInsets
        private var mode: Image.ResizingMode
    }
    
    public enum ResizingMode : Sendable {
        case tile
        case stretch
    }
    
    enum Interpolation {
        case none
        case low
        case medium
        case high
    }
    
    struct DynamicRange {
        private var storage: Image.DynamicRange.Storage
    }
}

extension Image.ResizingMode: Hashable {}

extension Image.DynamicRange {
    enum Storage {
        case standard
        case constrainedHigh
        case high
    }
}
