// 21FFA3C7D88AC65BB559906758271BFC

internal import CoreGraphics

extension DisplayList {
    fileprivate final class ViewRasterizer: ViewRendererBase {
        let rootPlatform: DisplayList.ViewUpdater.Platform // 0x10
        private weak var host: ViewRendererHost? // 0x18
        private var drawingView: AnyObject? // 0x20
        var options: _RendererConfiguration.RasterizationOptions // 0x30
        private let renderer: DisplayList.GraphicsRenderer // 0x48
        private var seed = DisplayList.Seed() // 0x50
        private var lastContentsScale: CGFloat = 0 // 0x58
        
        // 원래 없음
        @inlinable
        init(
            rootPlatform: DisplayList.ViewUpdater.Platform,
            host: ViewRendererHost?,
            drawingView: AnyObject?,
            rasterizationOptions: _RendererConfiguration.RasterizationOptions
        ) {
            self.rootPlatform = rootPlatform
            self.host = host
            self.drawingView = drawingView
            self.options = rasterizationOptions
            
            let platformViewMode: DisplayList.GraphicsRenderer.PlatformViewMode
            if rasterizationOptions.drawsPlatformViews {
                platformViewMode = .rendered(update: true)
            } else {
                platformViewMode = .unsupported
            }
            self.renderer = DisplayList.GraphicsRenderer(platformViewMode: platformViewMode)
        }
        
        // 원래 없음
        @inlinable
        func update(rasterizationOptions: _RendererConfiguration.RasterizationOptions, host: ViewRendererHost?) {
            self.options = rasterizationOptions
            
            let platformViewMode: DisplayList.GraphicsRenderer.PlatformViewMode
            if rasterizationOptions.drawsPlatformViews {
                platformViewMode = .rendered(update: true)
            } else {
                platformViewMode = .unsupported
            }
            self.renderer.platformViewMode = platformViewMode
            
            self.host = host
        }
        
        var exportedObject: AnyObject? {
            fatalError("TODO")
        }
        
        func render(rootView: AnyObject, from displayList: DisplayList, time: Time, version: DisplayList.Version, maxVersion: DisplayList.Version, environment: DisplayList.ViewRenderer.Environment) -> Time {
            fatalError("TODO")
        }
        
        func renderAsync(to displayList: DisplayList, time: Time, targetTimestamp: Time?, version: DisplayList.Version, maxVersion: DisplayList.Version) -> Time? {
            fatalError("TODO")
        }
        
        func destroy(rootView: AnyObject) {
            fatalError("TODO")
        }
        
        var viewCacheIsEmpty: Bool {
            fatalError("TODO")
        }
    }
}

extension DisplayList {
    package final class ViewRenderer: ViewRendererBase {
        let platform: DisplayList.ViewUpdater.Platform
        private(set) var configuration = _RendererConfiguration(renderer: .default)
        package weak var host: ViewRendererHost? = nil
        private var state: DisplayList.ViewRenderer.State = .none
        private(set) var renderer: ViewRendererBase? = nil
        private(set) var configChanged: Bool = true
        
        init(platform: DisplayList.ViewUpdater.Platform) {
            self.platform = platform
        }
        
        init(definition: PlatformViewDefinition.Type) {
            self.platform = DisplayList.ViewUpdater.Platform(definition: definition)
        }
        
        var definition: PlatformViewDefinition.Type {
            fatalError("TODO")
        }
        
        var rootPlatform: DisplayList.ViewUpdater.Platform {
            fatalError("TODO")
        }
        
        var exportedObject: AnyObject? {
            fatalError("TODO")
        }
        
        func render(rootView: AnyObject, from displayList: DisplayList, time: Time, version: DisplayList.Version, maxVersion: DisplayList.Version, environment: Environment) -> Time {
            let renderer = updateRenderer(rootView: rootView)
            return renderer.render(rootView: rootView, from: displayList, time: time, version: version, maxVersion: maxVersion, environment: environment)
        }
        
        func renderAsync(to displayList: DisplayList, time: Time, targetTimestamp: Time?, version: DisplayList.Version, maxVersion: DisplayList.Version) -> Time? {
            fatalError("TODO")
        }
        
        func destroy(rootView: AnyObject) {
            fatalError("TODO")
        }
        
        var viewCacheIsEmpty: Bool {
            fatalError("TODO")
        }
        
        fileprivate func updateRenderer(rootView: AnyObject) -> ViewRendererBase {
            guard configChanged else {
                return renderer!
            }
            
            configChanged = false
            
            let state = state
            let newState: DisplayList.ViewRenderer.State
            switch configuration.renderer {
            case .default:
                newState = .updating
            case .rasterized:
                newState = .rasterizing
            }
            
            if newState == state {
                // <+200>
            } else {
                if let renderer {
                    // <+112>
                    renderer.destroy(rootView: rootView)
                } else {
                    // <+184>
                }
                // <+188>
                self.renderer = nil
                self.state = .none
            }
            
            // <+200>
            if let renderer {
                switch configuration.renderer {
                case .default:
                    // <+896>
                    return self.renderer!
                case .rasterized(let options):
                    // <+216>
                    let viewRasterizer = renderer as! DisplayList.ViewRasterizer
                    // <+260>
                    viewRasterizer.update(rasterizationOptions: options, host: host)
                    return self.renderer!
                }
            } else {
                // <+416>
                switch configuration.renderer {
                case .default:
                    // <+940>
                    self.renderer = DisplayList.ViewUpdater(rootPlatform: platform, host: host)
                    return self.renderer!
                case .rasterized(let options):
                    // <+420>
                    // x23
                    let renderer = DisplayList.ViewRasterizer(rootPlatform: platform, host: host, drawingView: rootView, rasterizationOptions: options)
                    
                    // <+668>
                    let rasterizationOptions = RasterizationOptions(options)
                    platform.addDrawingView(rootView: rootView, options: PlatformDrawableOptions(base: rasterizationOptions))
                    
                    // <+860>
                    self.renderer = renderer
                    self.state = .rasterizing
                    return self.renderer!
                }
            }
        }
    }
}

extension DisplayList.ViewRenderer {
    struct Environment: Equatable {
        static var invalid: DisplayList.ViewRenderer.Environment {
            return DisplayList.ViewRenderer.Environment(contentsScale: 0)
        }
        
        var contentsScale: CGFloat
        
        init(contentsScale: CGFloat) {
            self.contentsScale = contentsScale
        }
    }
    
    fileprivate enum State {
        case none
        case updating
        case rasterizing
    }
}
