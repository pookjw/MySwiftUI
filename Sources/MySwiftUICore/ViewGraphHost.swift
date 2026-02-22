private import Foundation
private import AttributeGraph
package import QuartzCore
internal import CoreGraphics

package final class ViewGraphHost {
    @safe package static nonisolated(unsafe) var isDefaultEnvironmentConfigured: Bool = true
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
        } else if let result = _specialize(self as (any RootTransformProvider), for: T.self) {
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
        Update.ensure {
            if let displayLink {
                displayLink.invalidate()
            }
        }
    }
    
    package func clearUpdateTimer() {
        guard Thread.isMainThread else {
            return
        }
        
        if let updateTimer {
            updateTimer.invalidate()
        }
    }
    
    package func cancelAsyncRendering() {
        Update.ensure {
            if let displayLink {
                displayLink.nextThread = .main
            }
        }
    }
    
    package func updateRemovedState(isUnattached: Bool, isHiddenForReuse: Bool) {
        Update.lock()
        Update.begin()
        
        let removedState: GraphHost.RemovedState
        if isHiddenForReuse {
            removedState = isUnattached ? [.unattached, .hiddenForReuse] : .hiddenForReuse
        } else {
            removedState = isUnattached ? .unattached : []
        }
        
        let viewGraph = viewGraph
        viewGraph.updateRemovedState()
        
        viewGraph.removedState = removedState
        
        Update.end()
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
    
    package func invalidateTransform() -> Bool {
        // x21
        let viewGraph = viewGraph
        // w20
        let rootTransform = viewGraph.$rootTransform
        // w19
        let valueState = rootTransform.valueState
        
        if !valueState.contains(.unknown0) {
            rootTransform.invalidateValue()
            if let delegate = viewGraph.delegate {
                delegate.graphDidChange()
            }
            
            return true
        } else {
            return false
        }
    }
    
    package func setProposedSize(_ size: CGSize) {
        viewGraph.setSize(ViewSize(size, proposal: _ProposedSize(size)))
    }
    
    func setSafeAreaInsets(_ edgeInsets: EdgeInsets?, keyboardHeight: CGFloat?) -> Bool {
        return setSafeAreaInsets(edgeInsets, keyboardHeight: keyboardHeight, cornerInsets: nil)
    }
    
    package func setSafeAreaInsets(_ edgeInsets: EdgeInsets?, keyboardHeight: CGFloat?, cornerInsets: RectangleCornerInsets?) -> Bool {
        // x29 = sp + 0x140
        /*
         edgeInsets (Pointer) = x24
         keyboardHeight = x21
         keyboardHeight (case) = x22
         cornerInsets (Pointer) = x23
         */
        
        var edgeInsets = edgeInsets ?? .zero
        let pixelLength = viewGraph.environment.pixelLength
        // sp + 0x70
        edgeInsets.round(toMultipleOf: pixelLength)
        // sp + 0x68
        var containerElement = SafeAreaInsets.Element(
            regions: .container,
            insets: edgeInsets
        )
        
        // sp + 0x10 / w25
        let cornerInsets = cornerInsets
        
        // d13, d12, d8, d10
        var keyboardElement = SafeAreaInsets.Element(regions: .keyboard, insets: EdgeInsets())
        if let keyboardHeight {
            keyboardElement.insets = EdgeInsets(edgeInsets.bottom - keyboardHeight, edges: .bottom)
        }
        
        // <+396>
        var elements: [SafeAreaInsets.Element] = []
        
        if !containerElement.insets.isEmpty {
            if let cornerInsets {
                containerElement.cornerInsets = AbsoluteRectangleCornerInsets(cornerInsets)
            }
            elements.append(containerElement)
        }
        
        if !keyboardElement.insets.isEmpty {
            elements.append(keyboardElement)
        }
        
        return viewGraph.setSafeAreaInsets(elements)
    }
    
    package func setContainerSize(_ size: CGSize) {
        let viewGraph = viewGraph
        guard let containerSize = viewGraph.$containerSize else {
            return
        }
        
        let changed = containerSize.setValue(ViewSize(size, proposal: _ProposedSize(size)))
        
        guard changed else {
            return
        }
        
        if let delegate = viewGraph.delegate {
            delegate.graphDidChange()
        }
    }
    
    package var environment: EnvironmentValues {
        return viewGraph.environment
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
    
    package struct Phase {
        // TODO
        var base = _GraphInputs.Phase()
    }
    
    package struct LayoutInvalidator {
        private weak var viewGraph: ViewGraph?
        private var layoutComputer: WeakAttribute<LayoutComputer>
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

extension ViewGraphHost: RootTransformProvider {
    func rootTransform() -> ViewTransform {
        var transform = ViewTransform()
        
        guard let updateDelegate else {
            return transform
        }
        
        guard let adjuster = updateDelegate.as((any RootTransformAdjuster).self) else {
            return transform
        }
        
        adjuster.updateRootTransform(&transform)
        transform.appendCoordinateSpace(id: .viewGraphHost)
        
        return transform
    }
}
