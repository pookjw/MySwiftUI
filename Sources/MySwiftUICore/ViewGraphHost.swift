#warning("TODO")
private import Foundation
private import AttributeGraph
package import QuartzCore

package final class ViewGraphHost {
    package static nonisolated(unsafe) var isDefaultEnvironmentConfigured: Bool = true
    package static nonisolated(unsafe) var defaultEnvironment: EnvironmentValues = EnvironmentValues(PropertyList())
    
    package weak var updateDelegate: ViewGraphRootValueUpdater? = nil
    package weak var renderDelegate: ViewGraphRenderDelegate? = nil
    package weak var delegate: ViewGraphHostDelegate? = nil
    private var idiom: ViewGraphHost.Idiom? = nil
    package var initialInheritedEnvironment: EnvironmentValues? = nil
    package let viewGraph: ViewGraph
    package let renderer: DisplayList.ViewRenderer
    package var currentTimestamp: Time = .zero
    package var valuesNeedingUpdate: ViewGraphRootValues = .all
    package var renderingPhase: ViewRenderingPhase = .none
    package var externalUpdateCount: Int = 0
    private var parentPhase: _GraphInputs.Phase? = nil
    private var displayLink: ViewGraphDisplayLink? = nil
    private var nextTimerTime: Time? = nil
    private var updateTimer: Timer? = nil
    
    package init<T: View>(
        rootViewType: T.Type,
        outputs: ViewGraph.Outputs,
        viewDefinition: PlatformViewDefinition.Type
    ) {
        self.viewGraph = ViewGraph(rootViewType: rootViewType, requestedOutputs: outputs)
        self.renderer = DisplayList.ViewRenderer(platform: DisplayList.ViewUpdater.Platform(definition: viewDefinition))
    }
    
    package func `as`<T>(_ type: T.Type) -> T? {
        if let result = _specialize(self as (any ViewGraphOwner), for: T.self) {
            return result
        } else if let result = _specialize(renderer, for: T.self) {
            return result
        } else if let result = _specialize(renderDelegate, for: T.self) {
            return result
        } else if let result = _specialize(viewGraph as (any ViewGraphRenderHost), for: T.self) {
            return result
        } else {
            return nil
        }
    }
    
    package var accessibilityEnabled: Bool {
        get {
            return viewGraph.accessibilityEnabled
        }
        set {
            viewGraph.accessibilityEnabled = newValue
        }
    }
    
    package func setUp() {
        let viewGraph = viewGraph
        viewGraph.append(feature: ViewGraphHost.GraphFeature(host: self))
        viewGraph.append(feature: HitTestBindingFeature())
        updateDelegate?.initializeViewGraph()
        setupInitialInheritedEnvironment()
    }
    
    private func setupInitialInheritedEnvironment() {
        guard let current = unsafe RepresentableContextValues.current else {
            return
        }
        
        initialInheritedEnvironment = current.environment
    }
    
    package func clearDisplayLink() {
        fatalError("TODO")
    }
    
    package func clearUpdateTimer() {
        fatalError("TODO")
    }
    
    package func cancelAsyncRendering() {
        Update.lock()
        if let displayLink {
            displayLink.nextThread = .main
        }
        Update.unlock()
    }
    
    package func updateRemovedState(isUnattached: Bool, isHiddenForReuse: Bool) {
        Update.lock()
        viewGraph.updateRemovedState()
        Update.unlock()
    }
    
    package var mayDeferUpdate: Bool {
        guard viewGraph.mayDeferUpdate else {
            return false
        }
        
        guard let displayLink else {
            return false
        }
        
        return displayLink.nextUpdate != .infinity
    }
    
    package nonisolated func startDisplayLink(delay: Double, makeCADisplayLink: (Any, Selector) -> CADisplayLink?) {
        let displayLink: ViewGraphDisplayLink
        if let _displayLink = self.displayLink {
            displayLink = _displayLink
        } else {
            let _displayLink = ViewGraphDisplayLink(host: self)
            if let caDisplayLink = makeCADisplayLink(_displayLink, #selector(ViewGraphDisplayLink.displayLinkTimer(_:))) {
                _displayLink.link = caDisplayLink
                caDisplayLink.add(to: .main, forMode: .common)
                self.displayLink = _displayLink
            }
            
            if let _displayLink = self.displayLink {
                displayLink = _displayLink
            } else {
                startUpdateTimer(delay: delay)
                return
            }
        }
        
        displayLink.setNextUpdate(delay: delay, interval: (delay.isFinite ? delay : 0), reasons: [])
        clearUpdateTimer()
    }
    
    package func startUpdateTimer(delay: Double) {
        fatalError("TODO")
    }
    
    package func nextRenderInterval(interval: () -> Double) -> Double {
        if let displayLink {
            let nextUpdate = displayLink.nextUpdate
            guard nextUpdate != .infinity else {
                return 0
            }
            return interval()
        } else {
            return interval()
        }
    }
    
    package func setEnvironment(_ environment: EnvironmentValues, wrapper: ViewGraphHostEnvironmentWrapper) {
        /*
         self = x19
         wrapper = x22
         environment = x21 + x24
         */
         // x20
        let viewGraph = self.viewGraph
        viewGraph.data.environment = environment
        
        let newParentPhase = wrapper.phase.base
        viewGraph.updateGraphPhase(oldParentPhase: parentPhase, newParentPhase: newParentPhase)
        parentPhase = newParentPhase
        
        viewGraph.updatePreferenceBridge(environment: environment) { [weak updateDelegate] in
            updateDelegate?.updateEnvironment()
        }
    }
}

extension ViewGraphHost {
    package struct Idiom: Hashable {
        static var phone: Idiom { return Idiom(.phone) }
        static var pad: Idiom { return Idiom(.pad) }
        static var tv: Idiom { return Idiom(.tv) }
        static var watch: Idiom { return Idiom(.watch) }
        static var carPlay: Idiom { return Idiom(.carPlay) }
        static var mac: Idiom { return Idiom(.mac) }
        static var macCatalyst: Idiom { return Idiom(.macCatalyst) }
        static var vision: Idiom { return Idiom(.vision) }
        
        var base: InterfaceIdiom
        
        package init(_ idiom: InterfaceIdiom) {
            self.base = idiom
        }
    }
    
    struct Phase {
        // TODO
        var base = _GraphInputs.Phase()
    }
}

extension _GraphInputs {
    package var viewGraphHostIdiom: ViewGraphHost.Idiom? {
        get {
            guard let idiom = self[InterfaceIdiomInput.self] else {
                return nil
            }
            return ViewGraphHost.Idiom(idiom.interfaceIdiom)
        }
        set {
            if let newValue {
                self[InterfaceIdiomInput.self] = AnyInterfaceIdiom(idiom: newValue.base)
            } else {
                self[InterfaceIdiomInput.self] = nil
            }
        }
        _modify {
            fatalError("TODO")
        }
    }
}

extension ViewGraphHost {
    struct GraphFeature: ViewGraphFeature {
        private weak var host: ViewGraphHost?
        
        init(host: ViewGraphHost) {
            self.host = host
        }
        
        func modifyViewInputs(inputs: inout _ViewInputs, graph: ViewGraph) {
            if let host {
                let definition = host.renderer.platform.definition
                if definition.system == .uiView {
                    inputs.base.platformSystem = .uiKit
                }
            }
            
            if let delegate = host?.delegate {
                delegate.updateGraphInputs(&inputs.base)
            }
        }
    }
}

extension ViewGraphHost {
    package struct AssetCatalogConfiguration: Equatable {
        package var referenceBounds: CGRect
        package var pointsPerInch: CGFloat
        package var preferredArtworkSubtype: Int
        
        package init(referenceBounds: CGRect, pointsPerInch: CGFloat, preferredArtworkSubtype: Int) {
            self.referenceBounds = referenceBounds
            self.pointsPerInch = pointsPerInch
            self.preferredArtworkSubtype = preferredArtworkSubtype
        }
    }
}

extension ViewGraphHost: ViewGraphOwner {}

extension _GraphInputs {
    package var updateCycleUseSetNeedsLayout: Bool {
        get {
            return self[UpdateCycleUseSetNeedsLayoutKey.self]
        }
        set {
            self[UpdateCycleUseSetNeedsLayoutKey.self] = newValue
        }
        _modify {
            yield &self[UpdateCycleUseSetNeedsLayoutKey.self]
        }
    }
    
    fileprivate struct UpdateCycleUseSetNeedsLayoutKey: GraphInput {
        static var defaultValue: Bool {
            // SDK 확인이 있음
            fatalError("TODO")
        }
    }
}
