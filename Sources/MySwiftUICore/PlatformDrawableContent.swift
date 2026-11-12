package import CoreGraphics
package import RenderBox
private import _MySwiftUICoreShims

@_spi(Internal) public struct PlatformDrawableContent {
    private var storage: PlatformDrawableContent.Storage
    
    package init() {
        self.storage = .empty
    }
    
    @inline(always) // 원래 없음
    init(storage: PlatformDrawableContent.Storage) {
        self.storage = storage
    }
    
    package func draw(in displayList: RBDisplayList, size: CGSize, state: inout PlatformDrawableContent.State) {
        switch self.storage {
        case .graphicsCallback(let callback):
            // <+564>
            var context = GraphicsContext(
                displayList: displayList,
                environment: EnvironmentValues()
            )
            
            callback(&context, size)
        case .platformCallback(let callback):
            // <+684>
            let context = GraphicsContext(
                displayList: displayList,
                environment: EnvironmentValues()
            )
            
            let state = context.storage.state
            let cgContext = unsafe state.beginCGContext(alpha: 1, flags: [])
                .takeUnretainedValue()
            
            let blendMode = context.storage.blendMode
            if blendMode != .unknown0 {
                unsafe cgContext.setBlendMode(
                    CGBlendMode(rawValue: blendMode.rawValue).unsafelyUnwrapped
                )
            }
            
            let shapeDistance = context.storage.shapeDistance
            if shapeDistance.isNaN {
                // <+1132>
                let context = CoreGraphicsContext(cgContext: cgContext)
                context.push()
                callback(size)
                context.pop()
                // <+832>
            } else {
                // <+752>
                _CGContextSetShapeDistance(cgContext, shapeDistance)
                let context = CoreGraphicsContext(cgContext: cgContext)
                context.push()
                callback(size)
                context.pop()
                _CGContextSetShapeDistance(cgContext, .nan)
                // <+832>
            }
            
            state.endCGContext()
        case .displayList(let list, let point, let time):
            // <+636>
            var context = GraphicsContext(
                displayList: displayList,
                environment: EnvironmentValues()
            )
            
            if (point.x != 0) || (point.y != 0) {
                // <+884>
                context.translateBy(x: -point.x, y: -point.y)
            } else {
                // <+664>
            }
            
            let renderer = state._renderer ?? DisplayList.GraphicsRenderer(platformViewMode: state.mode)
            state._renderer = renderer
            
            // <+984>
            renderer.renderDisplayList(list, at: time, in: &context)
        case .rbDisplayList(let contents, let point):
            // <+68>
            displayList.translateBy(x: -point.x, y: -point.y)
            displayList.draw(contents)
        case .rbInterpolator(let interpolator, let value, let point):
            // <+136>
            displayList.translateBy(x: -point.x, y: -point.y)
            let state = displayList.state
            interpolator.draw(in: state, by: value)
        case .empty:
            _ = GraphicsContext(
                displayList: displayList,
                environment: EnvironmentValues()
            )
        }
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
        fileprivate private(set) var mode: DisplayList.GraphicsRenderer.PlatformViewMode
        fileprivate var _renderer: DisplayList.GraphicsRenderer?
        
        package init() {
            self.mode = .unsupported
            self._renderer = nil
        }
        
        init(platformViewMode: DisplayList.GraphicsRenderer.PlatformViewMode) {
            self._renderer = nil
            self.mode = platformViewMode
        }
        
        mutating func renderer() -> DisplayList.GraphicsRenderer {
            assertUnimplemented()
        }
    }
}
