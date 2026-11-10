internal import CoreGraphics
internal import RenderBox

@_spi(Internal) public struct PlatformDrawableContent {
    private var storage: PlatformDrawableContent.Storage
    
    package init() {
        self.storage = .empty
    }
    
    @inline(always) // 원래 없음
    init(storage: PlatformDrawableContent.Storage) {
        self.storage = storage
    }
}

extension PlatformDrawableContent {
    enum Storage {
        case graphicsCallback((inout GraphicsContext, CGSize) -> Void)
        case platformCallback((CGSize) -> Void)
        case displayList(DisplayList, CGPoint, Time)
        case rbDisplayList(any RBDisplayListContents, CGPoint)
        case rbInterpolator(RBDisplayListInterpolator, Float, CGPoint)
        case empty
    }
    
    package struct State {
        private var mode: DisplayList.GraphicsRenderer.PlatformViewMode
        private var _renderer: DisplayList.GraphicsRenderer?
        
        package init() {
            self.mode = .unsupported
            self._renderer = nil
        }
        
        init(platformViewMode: DisplayList.GraphicsRenderer.PlatformViewMode) {
            self._renderer = nil
            self.mode = platformViewMode
        }
    }
}
