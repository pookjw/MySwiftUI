internal import CoreGraphics

struct _ProposedSize: Hashable {
    var width: CGFloat?
    var height: CGFloat?
    
    init(width: CGFloat?, height: CGFloat?) {
        self.width = width
        self.height = height
    }
    
    init() {
        width = nil
        height = nil
    }
    
    func fixingUnspecifiedDimensions() -> CGSize {
        return CGSize(width: width ?? 10, height: height ?? 10)
    }
}

extension _ProposedSize {
    init(_ size: CGSize) {
        self.width = size.width
        self.height = size.height
    }
    
    func inset(by insets: EdgeInsets) -> _ProposedSize {
        var copy = self
        if let width {
            copy.width = max(0, width - insets.leading - insets.trailing)
        }
        if let height {
            copy.height = max(0, height - insets.top - insets.bottom)
        }
        return copy
    }
}
